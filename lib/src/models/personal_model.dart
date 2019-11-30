// To parse this JSON data, do
//
//     final personalModel = personalModelFromJson(jsonString);

import 'dart:convert';

PersonalModel personalModelFromJson(String str) => PersonalModel.fromJson(json.decode(str));

String personalModelToJson(PersonalModel data) => json.encode(data.toJson());

class PersonalModel {
    String rfc;
    String nom;
    String correo;
    String contrasena;
    String idDepartamento;

    PersonalModel({
        this.rfc,
        this.nom,
        this.correo,
        this.contrasena,
        this.idDepartamento,
    });

    factory PersonalModel.fromJson(Map<String, dynamic> json) => PersonalModel(
        rfc: json["RFC"],
        nom: json["Nom"],
        correo: json["Correo"],
        contrasena: json["Contrasena"],
        idDepartamento: json["idDepartamento"],
    );

    Map<String, dynamic> toJson() => {
        "RFC": rfc,
        "Nom": nom,
        "Correo": correo,
        "Contrasena": contrasena,
        "idDepartamento": idDepartamento,
    };
}
