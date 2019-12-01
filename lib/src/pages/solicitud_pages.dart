import 'package:flutter/material.dart';
import 'package:rmys/src/utils/validacion.dart';

class SolicitudPage extends StatefulWidget {
  SolicitudPage({Key key}) : super(key: key);

  @override
  _SolicitudPageState createState() => _SolicitudPageState();
}

class _SolicitudPageState extends State<SolicitudPage> {
  final formKey = GlobalKey<FormState>();
  String corr = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Solicitud',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoRfc(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoTelefono(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoCorrreo(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoAsistencia(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoRequerimientos(),
                      SizedBox(height: 15.0),
                      _construyendoFecha(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoDuracion(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoSala(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _construyendoDepedencia(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _boton(),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _construyendoRfc() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "RFC",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.account_circle),
      ),
      onSaved: (rfc) {},
      validator: (r) {
        if (Validaciones.isEmpty(r)) return "Ingresa un valor correcto";
        return null;
      },
    );
  }

  Widget _construyendoTelefono() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "461 123 4567",
        labelText: "Teléfono",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.phone),
      ),
      onSaved: (telefono) {},
      validator: (tel) {
        if (Validaciones.isEmpty(tel)) return "Ingresa un teléfono";
        if (Validaciones.validateNumber(tel)) return "Teléfono inválido";
        return null;
      },
    );
  }

  Widget _construyendoCorrreo() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Ejemplo@example.com",
        labelText: "Correo",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.email),
      ),
      onSaved: (correo) {
        corr = correo;
      },
      validator: (email) {
        if (Validaciones.isEmpty(email)) return "Ingresa un correo";
        if (Validaciones.validateEmail(email))
          return "Ingresa un correo válido";
        return null;
      },
    );
  }

  Widget _construyendoAsistencia() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Asistencia",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.accessibility_new),
      ),
      onSaved: (asisten) {},
      validator: (asis) {
        if (Validaciones.isEmpty(asis)) return "Ingresa un valor correcto";
        return null;
      },
    );
  }

  Widget _construyendoRequerimientos() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText:
            "Un Proyector, Dos Pantallas, Tres Sillas, Cuatro Mesas, Cinco Manteles",
        labelText: "Requerimientos",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.text_fields),
      ),
      onSaved: (requerimiento) {},
    );
  }

  Widget _construyendoFecha() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelText: "Fecha & Hora",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.date_range),
      ),
      onSaved: (fech) {},
    );
  }

  Widget _construyendoDuracion() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Duracion",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.timer),
      ),
      onSaved: (dura) {},
    );
  }

  Widget _construyendoSala() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Ej. Usos Múltiples",
        labelText: "Sala",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.store),
      ),
      onSaved: (sal) {},
    );
  }

  Widget _construyendoDepedencia() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Ej. Gubernamenta",
          labelText: "Dependencia",
          border: OutlineInputBorder(borderSide: BorderSide()),
          prefixIcon: Icon(Icons.account_balance)),
    );
  }

  Widget _construyeBoton() {
    return MaterialButton(
      minWidth: double.infinity,
      color: Colors.blue,
      child: Text(
        "Enviar",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget _boton() {
    return FloatingActionButton.extended(
      onPressed: () {
      },
      label: Text('Enviar'),
      icon: Icon(Icons.thumb_up),
      backgroundColor: Colors.black,
    );
  }
}
