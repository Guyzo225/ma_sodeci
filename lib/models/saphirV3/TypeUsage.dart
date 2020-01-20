import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/saphirV3/Datum.dart';

class TypeUsage extends ToJsonInterface {
  List<Datum> data;

  TypeUsage({
    this.data,
  });

  factory TypeUsage.fromJson(Map<String, dynamic> json) => TypeUsage(
    data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}