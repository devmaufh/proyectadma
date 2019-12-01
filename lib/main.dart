import 'package:flutter/material.dart';
import 'package:rmys/src/pages/detalles_salas_pages.dart';
import 'package:rmys/src/pages/evento_pages.dart';
import 'package:rmys/src/pages/home.dart';
import 'package:rmys/src/pages/login_pages.dart';
import 'package:rmys/src/pages/salas_pages.dart';
import 'package:rmys/src/pages/solicitud_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indice = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recursos Materiales',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'evento': (BuildContext context) => EventosPage(),
        'sala': (BuildContext context) => SalasPage(),
        'detalleSala': (BuildContext context) => DetalleSalaPages(),
        'solicitud': (BuildContext context) => SolicitudPage(),
      },
    );
  }
}
