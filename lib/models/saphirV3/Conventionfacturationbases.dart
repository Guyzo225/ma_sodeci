import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Conventionfacturationbases extends ToJsonInterface {
  String periodeFacturation;
  String reffactureV3;
  dynamic reffactureV2;
  String refcontratv3;
  String refclientv3;
  String montantFacture;
  DateTime dateLimite;
  String soldefacture;
  String statutPaye;
  dynamic dateDebutConso;
  dynamic dateFinConso;
  DateTime dateDebutRelleConso;
  DateTime dateFinRelleConso2;

  Conventionfacturationbases({
    this.periodeFacturation,
    this.reffactureV3,
    this.reffactureV2,
    this.refcontratv3,
    this.refclientv3,
    this.montantFacture,
    this.dateLimite,
    this.soldefacture,
    this.statutPaye,
    this.dateDebutConso,
    this.dateFinConso,
    this.dateDebutRelleConso,
    this.dateFinRelleConso2,
  });

  factory Conventionfacturationbases.fromJson(Map<String, dynamic> json) => Conventionfacturationbases(
    periodeFacturation: json["periode_facturation"] == null ? null : json["periode_facturation"],
    reffactureV3: json["ReffactureV3"] == null ? null : json["ReffactureV3"],
    reffactureV2: json["ReffactureV2"],
    refcontratv3: json["refcontratv3"] == null ? null : json["refcontratv3"],
    refclientv3: json["refclientv3"] == null ? null : json["refclientv3"],
    montantFacture: json["MontantFacture"] == null ? null : json["MontantFacture"],
    dateLimite: json["Date_limite"] == null ? null : DateTime.parse(json["Date_limite"]),
    soldefacture: json["soldefacture"] == null ? null : json["soldefacture"],
    statutPaye: json["Statut_paye"] == null ? null : json["Statut_paye"],
    dateDebutConso: json["Date_debut_conso"],
    dateFinConso: json["Date_fin_Conso"],
    dateDebutRelleConso: json["Date_debut_relle_conso"] == null ? null : DateTime.parse(json["Date_debut_relle_conso"]),
    dateFinRelleConso2: json["Date_fin_relle_Conso2"] == null ? null : DateTime.parse(json["Date_fin_relle_Conso2"]),
  );

  Map<String, dynamic> toJson() => {
    "periode_facturation": periodeFacturation == null ? null : periodeFacturation,
    "ReffactureV3": reffactureV3 == null ? null : reffactureV3,
    "ReffactureV2": reffactureV2,
    "refcontratv3": refcontratv3 == null ? null : refcontratv3,
    "refclientv3": refclientv3 == null ? null : refclientv3,
    "MontantFacture": montantFacture == null ? null : montantFacture,
    "Date_limite": dateLimite == null ? null : dateLimite.toIso8601String(),
    "soldefacture": soldefacture == null ? null : soldefacture,
    "Statut_paye": statutPaye == null ? null : statutPaye,
    "Date_debut_conso": dateDebutConso,
    "Date_fin_Conso": dateFinConso,
    "Date_debut_relle_conso": dateDebutRelleConso == null ? null : dateDebutRelleConso.toIso8601String(),
    "Date_fin_relle_Conso2": dateFinRelleConso2 == null ? null : dateFinRelleConso2.toIso8601String(),
  };
}