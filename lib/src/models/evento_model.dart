// To parse this JSON data, do
//
//     final eventoModel = eventoModelFromJson(jsonString);

import 'dart:convert';

EventoModel eventoModelFromJson(String str) => EventoModel.fromJson(json.decode(str));

String eventoModelToJson(EventoModel data) => json.encode(data.toJson());

class EventoModel {
    String idEvento;
    String asistencia;
    DateTime fechaEvento;
    String duracion;
    String estado;
    String nom;

    EventoModel({
        this.idEvento,
        this.asistencia,
        this.fechaEvento,
        this.duracion,
        this.estado,
        this.nom,
    });

    factory EventoModel.fromJson(Map<String, dynamic> json) => EventoModel(
        idEvento: json["idEvento"],
        asistencia: json["asistencia"],
        fechaEvento: DateTime.parse(json["fechaEvento"]),
        duracion: json["duracion"],
        estado: json["Estado"],
        nom: json["Nom"],
    );

    Map<String, dynamic> toJson() => {
        "idEvento": idEvento,
        "asistencia": asistencia,
        "fechaEvento": "${fechaEvento.year.toString().padLeft(4, '0')}-${fechaEvento.month.toString().padLeft(2, '0')}-${fechaEvento.day.toString().padLeft(2, '0')}",
        "duracion": duracion,
        "Estado": estado,
        "Nom": nom,
    };
}
