import 'package:flutter/material.dart';
import 'package:rmys/src/pages/detalles_salas_pages.dart';
import 'package:rmys/src/pages/evento_pages.dart';
import 'package:rmys/src/pages/home.dart';
import 'package:rmys/src/pages/login_pages.dart';
import 'package:rmys/src/pages/salas_pages.dart';
import 'package:rmys/src/pages/solicitud_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
    String initialRoute = 'login';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final rfc = await prefs.getString('rfc');
    if(rfc !=null) initialRoute = 'home';
    print("RFC: $rfc");
   runApp(MyApp(initialRoute: initialRoute,));
}

class MyApp extends StatefulWidget {
  final initialRoute;
  MyApp({
    Key key,
    @required this.initialRoute 
  });
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  int indice = 0;
  @override
  void initState() {
    print("Aver");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recursos Materiales',
      initialRoute: widget.initialRoute,
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
