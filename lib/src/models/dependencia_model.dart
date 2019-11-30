class DependenciaModel {
    String idDependencia;
    String nom;

    DependenciaModel({
        this.idDependencia,
        this.nom,
    });

    factory DependenciaModel.fromJson(Map<String, dynamic> json) => DependenciaModel(
        idDependencia: json["idDependencia"],
        nom: json["Nom"],
    );

    Map<String, dynamic> toJson() => {
        "idDependencia": idDependencia,
        "Nom": nom,
    };
}
