import 'package:flutter/material.dart';
import 'package:rmys/src/models/sala_model.dart';

class DetalleSalaPages extends StatelessWidget {
  const DetalleSalaPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalaModel modelo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          modelo.nom,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: modelo.idSala,
                  child: Image(image: AssetImage('assets/evento.jpg')),
                ),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text('Ubicación : '),
                  subtitle: Text(modelo.edificio[0].nom),
                ),
                ListTile(
                  leading: Icon(Icons.accessibility),
                  title: Text('Capacidad : '),
                  subtitle: Text(modelo.capacidad),
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Descripción : '),
                  subtitle: Text(
                      'Pues aqui va la mamada de descripcion de el edifició.'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add),
        onPressed: () {},
      ),
    );
  }
}
