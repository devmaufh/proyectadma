import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rmys/src/pages/personal_pages.dart';
import 'package:rmys/src/pages/salas_pages.dart';

import 'evento_pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
        items: <Widget>[
          Icon(Icons.event_available, size: 30),
          Icon(Icons.format_list_bulleted, size: 30),
          Icon(Icons.face, size: 30),
        ],
        onTap: (index) {
          setState(() {
            indice = index;
          });
        },
      ),
      body: _callPage(indice),
    );
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return EventosPage();
      case 1:
        return SalasPage();
      case 2:
        return PeronalPage();

      default:
        return EventosPage();
    }
  }
}
