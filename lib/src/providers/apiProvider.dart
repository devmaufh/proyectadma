import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:rmys/src/models/dependencia_model.dart';
import 'package:rmys/src/models/evento_model.dart';
import 'package:rmys/src/models/personal_model.dart';
import 'package:rmys/src/models/sala_model.dart';
import 'package:rmys/src/models/solicitud_model.dart';

class ApiProvider {
  final String API_URL = "http://yabasta.azurewebsites.net/cachito/index.php";

  Future<List<DependenciaModel>> dependencias() async {
    var peticion = await http.get('$API_URL/api/dependencias');
    final respuesta = json.decode(peticion.body);
    List<DependenciaModel> lista = (respuesta['dependencias'] as List)
        .map((dependencia) => DependenciaModel.fromJson(dependencia))
        .toList();
    lista.forEach((dependencia) {
      print(dependencia.nom);
    });
    return lista;
  }

  Future<List<EventoModel>> listaEventos() async {
    var peticion = await http.get("$API_URL/api/eventos");
    if (peticion.statusCode == 200 || peticion.statusCode == 201) {
      final respuesta = json.decode(peticion.body);
      List<EventoModel> eventos = (respuesta['eventos'] as List)
          .map((evento) => EventoModel.fromJson(evento))
          .toList();
      return eventos;
    }
    return [];
  }

  Future<List<SalaModel>> listaSalas() async {
    var peticion = await http.get("$API_URL/api/salas");
    if (peticion.statusCode == 201 || peticion.statusCode == 200) {
      final respuesta = json.decode(peticion.body);
      List<SalaModel> salas = (respuesta['salas'] as List)
          .map((sala) => SalaModel.fromJson(sala))
          .toList();
      return salas;
    }
    return [];
  }

  Future<PersonalModel> login(String correo, String pass) async {
    var request = await http.post("$API_URL/api/login", body: {
      'Correo': correo,
      'Contrasena': pass,
    });
    if (request.statusCode == 200 || request.statusCode == 201) {
      final res = request.body;
      try{
        final r = PersonalModel.fromJson(json.decode(res));
        return r;
      }catch(_){
        return null;
      }
      //return PersonalModel.fromJson(json.decode(res));
    }
    return null;
  }

  Future<List<SolicitudModel>> listaSolicitudes() async {
    var peticion = await http.get("$API_URL/api/solicityud");
    if (peticion.statusCode == 201 || peticion.statusCode == 200) {
      final respuesta = json.decode(peticion.body);
      List<SolicitudModel> solicitudes = (respuesta['solicitud'] as List)
          .map((solicitud) => SolicitudModel.fromJson(solicitud))
          .toList();
      return [];
    }
  }
}
