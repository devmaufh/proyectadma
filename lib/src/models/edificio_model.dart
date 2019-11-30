class Edificio {
  String idEdificio;
  String nom;

  Edificio({
    this.idEdificio,
    this.nom,
  });

  factory Edificio.fromJson(Map<String, dynamic> json) => Edificio(
        idEdificio: json["idEdificio"],
        nom: json["Nom"],
      );

  Map<String, dynamic> toJson() => {
        "idEdificio": idEdificio,
        "Nom": nom,
      };
}
