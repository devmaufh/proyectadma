import 'package:flutter/material.dart';
import 'package:rmys/src/bloc/sala_bloc.dart';
import 'package:rmys/src/models/sala_model.dart';

class SalasPage extends StatefulWidget {
  const SalasPage({Key key}) : super(key: key);

  @override
  _SalasPageState createState() => _SalasPageState();
}

class _SalasPageState extends State<SalasPage> {
  final SalasBloc bloc = SalasBloc();
  @override
  Widget build(BuildContext context) {
    bloc.getSalas();
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0, left: 20),
            child: Text(
              'Salas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.salasStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<SalaModel>> snapshot) {
                if (snapshot.hasData) {
                  final _datos = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _datos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 250, child: _itemPage(_datos[index]));
                    },
                  );
                } else {
                  return Center(
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35),
                      CircularProgressIndicator()
                    ],
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemPage(SalaModel model) {
    return Stack(
      //alignment: Alignment.center,
      children: <Widget>[
        //Animación
        Hero(
          //ID asigna a la Animación
          tag: model.idSala,
          child: Container(
            decoration: BoxDecoration(
                /*boxShadow: [
                 /* BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),*/
                ],*/
                borderRadius: BorderRadius.circular(20),
                //Permite manipular la imagen
                image: DecorationImage(
                  // Filtro de color
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, .5),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: AssetImage('assets/evento.jpg'),
                )),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
            //Stack permite sobre poner
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  bottom: 40,
                  child: Text(
                    model.nom.length >= 20
                        ? model.nom.substring(0, 20) + "..."
                        : model.nom,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  bottom: 20,
                  child: Text(
                    model.edificio[0].nom,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 15.0,
          bottom: 4.0,
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
            child: Icon(Icons.remove_red_eye),
            onPressed: () {
              Navigator.pushNamed(context, 'detalleSala', arguments: model);
            },
          ),
        ),
      ],
    );
  }
}
