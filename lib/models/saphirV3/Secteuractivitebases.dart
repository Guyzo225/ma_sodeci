import 'package:sodeci_mobile/models/saphirV3/Datum_secteur_activite.dart';

class Secteuractivitebases {
  List<DatumSectuerActivite> data;

  Secteuractivitebases({
    this.data,
  });

  factory Secteuractivitebases.fromJson(Map<String, dynamic> json) => Secteuractivitebases(
    data: json["Data"] == null ? null : List<DatumSectuerActivite>.from(json["Data"].map((x) => DatumSectuerActivite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}