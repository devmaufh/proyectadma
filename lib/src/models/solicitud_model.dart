// To parse this JSON data, do
//
//     final solicitudModel = solicitudModelFromJson(jsonString);

import 'dart:convert';

import 'package:rmys/src/models/sala_model.dart';

import 'dependencia_model.dart';

SolicitudModel solicitudModelFromJson(String str) => SolicitudModel.fromJson(json.decode(str));

String solicitudModelToJson(SolicitudModel data) => json.encode(data.toJson());

class SolicitudModel {
    String idSolicitud;
    String rfc;
    String telefono;
    String correo;
    String asistencia;
    String requerimientos;
    DateTime fechaEvento;
    String duracion;
    SalaModel sala;
    DependenciaModel dependencia;

    SolicitudModel({
        this.idSolicitud,
        this.rfc,
        this.telefono,
        this.correo,
        this.asistencia,
        this.requerimientos,
        this.fechaEvento,
        this.duracion,
        this.sala,
        this.dependencia,
    });

    factory SolicitudModel.fromJson(Map<String, dynamic> json) => SolicitudModel(
        idSolicitud: json["idSolicitud"],
        rfc: json["RFC"],
        telefono: json["Telefono"],
        correo: json["Correo"],
        asistencia: json["Asistencia"],
        requerimientos: json["Requerimientos"],
        fechaEvento: DateTime.parse(json["fechaEvento"]),
        duracion: json["Duracion"],
        sala: SalaModel.fromJson(json["sala"]),
        dependencia: DependenciaModel.fromJson(json["dependencia"]),
    );

    Map<String, dynamic> toJson() => {
        "idSolicitud": idSolicitud,
        "RFC": rfc,
        "Telefono": telefono,
        "Correo": correo,
        "Asistencia": asistencia,
        "Requerimientos": requerimientos,
        "fechaEvento": "${fechaEvento.year.toString().padLeft(4, '0')}-${fechaEvento.month.toString().padLeft(2, '0')}-${fechaEvento.day.toString().padLeft(2, '0')}",
        "Duracion": duracion,
        "sala": sala.toJson(),
        "dependencia": dependencia.toJson(),
    };
}


