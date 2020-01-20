import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Datum extends ToJsonInterface {
  String jfaUsageId;
  String jfaName;
  String jfaProduitcible;

  Datum({
    this.jfaUsageId,
    this.jfaName,
    this.jfaProduitcible,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    jfaUsageId: json["jfa_usageId"] == null ? null : json["jfa_usageId"],
    jfaName: json["jfa_name"] == null ? null : json["jfa_name"],
    jfaProduitcible: json["jfa_Produitcible"] == null ? null : json["jfa_Produitcible"],
  );

  Map<String, dynamic> toJson() => {
    "jfa_usageId": jfaUsageId == null ? null : jfaUsageId,
    "jfa_name": jfaName == null ? null : jfaName,
    "jfa_Produitcible": jfaProduitcible == null ? null : jfaProduitcible,
  };
}