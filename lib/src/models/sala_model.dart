
import 'dart:convert';

import 'edificio_model.dart';

SalaModel salaModelFromJson(String str) => SalaModel.fromJson(json.decode(str));

String salaModelToJson(SalaModel data) => json.encode(data.toJson());

class SalaModel {
    String idSala;
    String nom;
    String capacidad;
    List<Edificio> edificio;

    SalaModel({
        this.idSala,
        this.nom,
        this.capacidad,
        this.edificio,
    });

    factory SalaModel.fromJson(Map<String, dynamic> json) => SalaModel(
        idSala: json["idSala"],
        nom: json["Nom"],
        capacidad: json["Capacidad"],
        edificio: List<Edificio>.from(json["edificio"].map((x) => Edificio.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idSala": idSala,
        "Nom": nom,
        "Capacidad": capacidad,
        "edificio": List<dynamic>.from(edificio.map((x) => x.toJson())),
    };
}


