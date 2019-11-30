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
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _construyeTextEmail(),
                SizedBox(height: 20.0),
                _construyeTextPass(),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('Entrar'),
                  onPressed: () {
                    _login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    if (!formKey.currentState.validate()) return;
        formKey.currentState.save();
        Navigator.pushNamed(context, 'home');
  }

  Widget _construyeTextEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Ej. Mau@example.com",
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
        prefixIcon: Icon(Icons.security),
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
}
