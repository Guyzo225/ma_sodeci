import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/Conseil.dart';

class SousRubriqueBonReflexesDto extends ToJsonInterface {
  int idSousRubrique;
  String sousRubrique;
  String urlShare;
  List<Conseil> conseil;

  SousRubriqueBonReflexesDto({
    this.idSousRubrique,
    this.sousRubrique,
    this.urlShare,
    this.conseil,
  });

  factory SousRubriqueBonReflexesDto.fromJson(Map<String, dynamic> json) => SousRubriqueBonReflexesDto(
    idSousRubrique: json["idSousRubrique"] == null ? null : json["idSousRubrique"],
    sousRubrique: json["sousRubrique"] == null ? null : json["sousRubrique"],
    urlShare: json["urlShare"] == null ? null : json["urlShare"],
    conseil: json["conseil"] == null ? null : List<Conseil>.from(json["conseil"].map((x) => Conseil.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idSousRubrique": idSousRubrique == null ? null : idSousRubrique,
    "sousRubrique": sousRubrique == null ? null : sousRubrique,
    "urlShare": urlShare == null ? null : urlShare,
    "conseil": conseil == null ? null : List<dynamic>.from(conseil.map((x) => x.toJson())),
  };
}