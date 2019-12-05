import 'package:flutter/material.dart';
import 'package:rmys/src/bloc/eventos_bloc.dart';
import 'package:rmys/src/models/evento_model.dart';

class EventosPage extends StatefulWidget {
  const EventosPage({Key key}) : super(key: key);

  @override
  _EventosPageState createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  final EventosBloc bloc = EventosBloc();

  @override
  Widget build(BuildContext context) {
    bloc.getEventos();
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0, left: 20),
            child: Text(
              'Eventos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          StreamBuilder(
            stream: bloc.eventosStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<EventoModel>> snapshot) {
              if (snapshot.hasData) {
                final List<EventoModel> lista = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                            height: 200.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        child: Text(
                                          lista[index].nom,
                                          style: TextStyle(fontSize: 15.0),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    lista[index].estado,
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        width: 70.0,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        alignment: Alignment.center,
                                        child: Text('Fecha : ' +
                                            lista[index]
                                                .fechaEvento
                                                .toIso8601String()
                                                .substring(0, 10)),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(4.0),
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Duracion : ' +
                                                lista[index].duracion,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            top: 15.0,
                            bottom: 15.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                width: 110,
                                image: AssetImage('assets/sala.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                    CircularProgressIndicator()],
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
