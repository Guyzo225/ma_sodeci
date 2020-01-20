
import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class CiviliteItem extends ToJsonInterface {
  int id;
  String v3GenreCli;
  String label;

  CiviliteItem({
    this.id,
    this.v3GenreCli,
    this.label,
  });

  factory CiviliteItem.fromJson(Map<String, dynamic> json) => CiviliteItem(
    id: json["id"] == null ? null : json["id"],
    v3GenreCli: json["v3GenreCli"] == null ? null : json["v3GenreCli"],
    label: json["label"] == null ? null : json["label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "v3GenreCli": v3GenreCli == null ? null : v3GenreCli,
    "label": label == null ? null : label,
  };
}