import 'package:flutter/material.dart';
import 'package:rmys/src/utils/validacion.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String corr = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 65, 172, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Recursos Materiales & Servicio',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    _construyeTextEmail(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _construyeTextPass(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _boton(),
                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Me manda error en esto, autsilio
  _login() async {
    /*if (!formKey.currentState.validate()) return;
    formKey.currentState.save();*/
    Navigator.pushNamed(context, 'home');
  }

  Widget _construyeTextEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Ejemplo@example.com",
        labelText: "Email",
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

  Widget _construyeTextPass() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.vpn_key),
      ),
      onSaved: (contra) {
        pass = contra;
      },
      validator: (text) {
        if (Validaciones.isEmpty(text)) return "Ingresa tu Contraseaña";
        return null;
      },
    );
  }

  Widget _boton() {
    return FloatingActionButton.extended(
      onPressed: () {
        _login();
      },
      label: Text('Entrar'),
      icon: Icon(Icons.check),
      backgroundColor: Colors.black,
    );
  }

}