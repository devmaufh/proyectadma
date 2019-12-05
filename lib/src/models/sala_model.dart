// To parse this JSON data, do
//
//     final salaModel = salaModelFromJson(jsonString);

import 'dart:convert';

import 'edificio_model.dart';

SalaModel salaModelFromJson(String str) => SalaModel.fromJson(json.decode(str));

String salaModelToJson(SalaModel data) => json.encode(data.toJson());

class SalaModel {
    String idSala;
    String nom;
    String capacidad;
    String descripcion;
    String url;
    List<Edificio> edificio;

    SalaModel({
        this.idSala,
        this.nom,
        this.capacidad,
        this.descripcion,
        this.url,
        this.edificio,
    });

    factory SalaModel.fromJson(Map<String, dynamic> json) => SalaModel(
        idSala: json["idSala"],
        nom: json["Nom"],
        capacidad: json["Capacidad"],
        descripcion: json["descripcion"],
        url: json["url"],
        edificio: List<Edificio>.from(json["edificio"].map((x) => Edificio.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idSala": idSala,
        "Nom": nom,
        "Capacidad": capacidad,
        "descripcion": descripcion,
        "url": url,
        "edificio": List<dynamic>.from(edificio.map((x) => x.toJson())),
    };
}
