import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class ListeDesFacture extends ToJsonInterface {
  String codeTypFac;
  String typFac;
  String perFac;
  String numFac;
  String montantTotal;
  String soldeFacture;
  String montantPenalite;
  String signe;
  String dateLimit;

  ListeDesFacture({
    this.codeTypFac,
    this.typFac,
    this.perFac,
    this.numFac,
    this.montantTotal,
    this.soldeFacture,
    this.montantPenalite,
    this.signe,
    this.dateLimit,
  });

  factory ListeDesFacture.fromJson(Map<String, dynamic> json) => ListeDesFacture(
    codeTypFac: json["CODE_TYP_FAC"] == null ? null : json["CODE_TYP_FAC"],
    typFac: json["TYP_FAC"] == null ? null : json["TYP_FAC"],
    perFac: json["PER_FAC"] == null ? null : json["PER_FAC"],
    numFac: json["NUM_FAC"] == null ? null : json["NUM_FAC"],
    montantTotal: json["MONTANT_TOTAL"] == null ? null : json["MONTANT_TOTAL"],
    soldeFacture: json["SOLDE_FACTURE"] == null ? null : json["SOLDE_FACTURE"],
    montantPenalite: json["MONTANT_PENALITE"] == null ? null : json["MONTANT_PENALITE"],
    signe: json["SIGNE"] == null ? null : json["SIGNE"],
    dateLimit: json["DATE_LIMIT"] == null ? null : json["DATE_LIMIT"],
  );

  Map<String, dynamic> toJson() => {
    "CODE_TYP_FAC": codeTypFac == null ? null : codeTypFac,
    "TYP_FAC": typFac == null ? null : typFac,
    "PER_FAC": perFac == null ? null : perFac,
    "NUM_FAC": numFac == null ? null : numFac,
    "MONTANT_TOTAL": montantTotal == null ? null : montantTotal,
    "SOLDE_FACTURE": soldeFacture == null ? null : soldeFacture,
    "MONTANT_PENALITE": montantPenalite == null ? null : montantPenalite,
    "SIGNE": signe == null ? null : signe,
    "DATE_LIMIT": dateLimit == null ? null : dateLimit,
  };
}