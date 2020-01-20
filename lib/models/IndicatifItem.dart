import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class IndicatifItem extends ToJsonInterface {
  int id;
  String codeIndicatif;
  String paysIndicatif;

  IndicatifItem({
    this.id,
    this.codeIndicatif,
    this.paysIndicatif,
  });

  factory IndicatifItem.fromJson(Map<String, dynamic> json) => IndicatifItem(
    id: json["id_indicatif"] == null ? null : json["id_indicatif"],
    codeIndicatif: json["code_indicatif"] == null ? null : json["code_indicatif"],
    paysIndicatif: json["pays_indicatif"] == null ? null : json["pays_indicatif"],
  );

  Map<String, dynamic> toJson() => {
    "id_indicatif": id == null ? null : id,
    "code_indicatif": codeIndicatif == null ? null : codeIndicatif,
    "pays_indicatif": paysIndicatif == null ? null : paysIndicatif,
  };
}
