import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rmys/src/bloc/solicitud_bloc.dart';
import 'package:rmys/src/models/personal_model.dart';
import 'package:rmys/src/models/solicitud_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PeronalPage extends StatefulWidget {
  PeronalPage({Key key}) : super(key: key);

  @override
  _PeronalPageState createState() => _PeronalPageState();
}

class _PeronalPageState extends State<PeronalPage> {
  SolicitudBloc bloc = SolicitudBloc();
  PersonalModel pers = PersonalModel(
      contrasena: "",
      rfc: "",
      nom: "",
      correo: "",
      idDepartamento: "",
      idRol: "");

  getData() async {
    print("Obteniendo data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pers.rfc = prefs.getString('rfc');
    pers.nom = prefs.getString('nom');
    pers.correo = prefs.getString('correo');
    pers.idDepartamento = prefs.getString('idDepartamento');

    bloc.getSolicitud(pers.rfc);
    print(pers.toJson());
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 65, 172, 1.0),
      child: Stack(
        children: <Widget>[
          _profileBack(context),
          Center(
            child: _buildUserStats(context),
          ),
        ],
      ),
    );
  }

  Widget _profileBack(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final background = Container(
      height: screenSize.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(0, 65, 172, 1.0), BlendMode.dstIn),
            image: AssetImage('assets/cool.png'),
            fit: BoxFit.cover),
      ),
    );
    return Stack(children: <Widget>[
      background,
    ]);
  }

  Widget _buildUserStats(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
          ),
          SafeArea(
            child: Container(
              width: screenSize.width * 0.85,
              padding: EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(250, 250, 250, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mi perfil',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
                        child: Icon(
                          Icons.recent_actors,
                          color: Colors.white,
                        )),
                    title: Text(
                      pers.rfc,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("RFC"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                    title: Text(
                      pers.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Nombre"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        )),
                    title: Text(
                      pers.correo,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Correo electrónico"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.15),
                    trailing: Icon(
                      Icons.exit_to_app,
                      color: Color.fromRGBO(0, 65, 172, 1.0),
                    ),
                    title: Text(
                      'Cerrar sesión',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Color.fromRGBO(0, 65, 172, 1.0)),
                    ),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.pushNamed(context, 'login');
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10),
            child: Text(
              'Mis solicitudes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: screenSize.width * 0.85,
            child: StreamBuilder(
              stream: bloc.solicitudStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<SolicitudModel>> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  print("OTRAVEZ");
                  return Swiper(
                    itemCount: data.length,
                    itemBuilder: (BuildContext contxt, int index) {
                      return Container(
                          width: screenSize.width * 0.85,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                    maxRadius: 25,
                                    backgroundColor: Colors.transparent,
                                    child: ClipOval(
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                          'http://yabasta.azurewebsites.net/cachito/files/${data[index].sala.url}',
                                        ),
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    )),
                                title: Text(data[index].sala.nom, style: TextStyle(color: Colors.black,),) ,
                                subtitle: Text("Lugar"),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
                                  child: Icon(Icons.calendar_today, color: Colors.white,),
                                ),
                                title: Text(data[index].fechaEvento.toIso8601String().substring(0,10)),
                                subtitle: Text("Fecha"),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
                                  child: Icon(Icons.people, color: Colors.white,),
                                ),
                                title: Text(data[index].asistencia),
                                subtitle: Text("Númer de asistentes"),
                              ),
                              ListTile(
                                title: Text(data[index].dependencia.nom),
                                subtitle: Text("Dependencia"),
                                leading: CircleAvatar(
                                  backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
                                  child: Icon(Icons.business, color: Colors.white,),
                                ),
                              ),
                            ],
                          ));
                    },
                    viewportFraction: 1,
                    scale: 0.5,
                  );
                } else {
                  return Text("NOU");
                }
              },
            ),
          ),
                                        SizedBox(height: 15,),

        ],
      ),
    );
  }
}
