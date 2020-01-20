import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/ListeDesFacture.dart';

class RefContractResponse extends ToJsonInterface {
  int codeTraitement;
  String messageTraitement;
  String referenceContrat;
  String adresseTechnique;
  int nombreFacture;
  double montantTotal;
  List<ListeDesFacture> listeDesFactures;

  RefContractResponse({
    this.codeTraitement,
    this.messageTraitement,
    this.referenceContrat,
    this.adresseTechnique,
    this.nombreFacture,
    this.montantTotal,
    this.listeDesFactures,
  });

  factory RefContractResponse.fromJson(Map<String, dynamic> json) => RefContractResponse(
    codeTraitement: json["CodeTraitement"] == null ? null : json["CodeTraitement"],
    messageTraitement: json["MessageTraitement"] == null ? null : json["MessageTraitement"],
    referenceContrat: json["ReferenceContrat"] == null ? null : json["ReferenceContrat"],
    adresseTechnique: json["AdresseTechnique"] == null ? null : json["AdresseTechnique"],
    nombreFacture: json["NombreFacture"] == null ? null : json["NombreFacture"],
    montantTotal: json["MontantTotal"] == null ? null : json["MontantTotal"],
    listeDesFactures: json["ListeDesFactures"] == null ? null : List<ListeDesFacture>.from(json["ListeDesFactures"].map((x) => ListeDesFacture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CodeTraitement": codeTraitement == null ? null : codeTraitement,
    "MessageTraitement": messageTraitement == null ? null : messageTraitement,
    "ReferenceContrat": referenceContrat == null ? null : referenceContrat,
    "AdresseTechnique": adresseTechnique == null ? null : adresseTechnique,
    "NombreFacture": nombreFacture == null ? null : nombreFacture,
    "MontantTotal": montantTotal == null ? null : montantTotal,
    "ListeDesFactures": listeDesFactures == null ? null : List<dynamic>.from(listeDesFactures.map((x) => x.toJson())),
  };
}