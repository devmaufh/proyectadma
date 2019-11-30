// To parse this JSON data, do
//
//     final departamentoModel = departamentoModelFromJson(jsonString);

import 'dart:convert';

DepartamentoModel departamentoModelFromJson(String str) => DepartamentoModel.fromJson(json.decode(str));

String departamentoModelToJson(DepartamentoModel data) => json.encode(data.toJson());

class DepartamentoModel {
    String idDepartamento;
    String nom;

    DepartamentoModel({
        this.idDepartamento,
        this.nom,
    });

    factory DepartamentoModel.fromJson(Map<String, dynamic> json) => DepartamentoModel(
        idDepartamento: json["idDepartamento"],
        nom: json["Nom"],
    );

    Map<String, dynamic> toJson() => {
        "idDepartamento": idDepartamento,
        "Nom": nom,
    };
}
