import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/SousRubriqueBonReflexesDto.dart';

class DataReflex extends ToJsonInterface {
  int idRubrique;
  String rubrique;
  List<SousRubriqueBonReflexesDto> sousRubriqueBonReflexesDto;

  DataReflex({
    this.idRubrique,
    this.rubrique,
    this.sousRubriqueBonReflexesDto,
  });

  factory DataReflex.fromJson(Map<String, dynamic> json) => DataReflex(
    idRubrique: json["idRubrique"] == null ? null : json["idRubrique"],
    rubrique: json["rubrique"] == null ? null : json["rubrique"],
    sousRubriqueBonReflexesDto: json["sousRubriqueBonReflexesDto"] == null ? null : List<SousRubriqueBonReflexesDto>.from(json["sousRubriqueBonReflexesDto"].map((x) => SousRubriqueBonReflexesDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idRubrique": idRubrique == null ? null : idRubrique,
    "rubrique": rubrique == null ? null : rubrique,
    "sousRubriqueBonReflexesDto": sousRubriqueBonReflexesDto == null ? null : List<dynamic>.from(sousRubriqueBonReflexesDto.map((x) => x.toJson())),
  };
}