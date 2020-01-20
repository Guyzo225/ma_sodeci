import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class DernierIndex extends ToJsonInterface {
  int codeTraitement;
  String messageTraitement;
  double dernierindex;
  DateTime dateDeleve;

  DernierIndex({
    this.codeTraitement,
    this.messageTraitement,
    this.dernierindex,
    this.dateDeleve,
  });

  factory DernierIndex.fromJson(Map<String, dynamic> json) => DernierIndex(
    codeTraitement: json["CodeTraitement"] == null ? null : json["CodeTraitement"],
    messageTraitement: json["MessageTraitement"] == null ? null : json["MessageTraitement"],
    dernierindex: json["Dernierindex"] == null ? null : json["Dernierindex"],
    dateDeleve: json["DateDeleve"] == null ? null : DateTime.parse(json["DateDeleve"]),
  );

  Map<String, dynamic> toJson() => {
    "CodeTraitement": codeTraitement == null ? null : codeTraitement,
    "MessageTraitement": messageTraitement == null ? null : messageTraitement,
    "Dernierindex": dernierindex == null ? null : dernierindex,
    "DateDeleve": dateDeleve == null ? null : dateDeleve.toIso8601String(),
  };
}