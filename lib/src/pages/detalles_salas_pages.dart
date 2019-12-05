import 'package:flutter/material.dart';
import 'package:rmys/src/models/sala_model.dart';

class DetalleSalaPages extends StatelessWidget {
  const DetalleSalaPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalaModel modelo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
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
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: modelo.idSala,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: NetworkImage('http://yabasta.azurewebsites.net/cachito/files/${modelo.url}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Ubicación : '),
                subtitle: Text(modelo.edificio[0].nom),
              ),
              SizedBox(
                height: 5.0,
              ),
              ListTile(
                leading: Icon(Icons.accessibility),
                title: Text('Capacidad : '),
                subtitle: Text(modelo.capacidad),
              ),
              SizedBox(
                height: 5.0,
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Descripción : '),
                subtitle: Text(
                    'Pues aqui va la mamada de descripcion de el edifició.'),
              ),
              SizedBox(
                height: 5.0,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, 'solicitud');
                },
                label: Text('Solicitar'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.black,
              ),
              /*FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, 'solicitud');
                },
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}
