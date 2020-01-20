import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/saphirV3/DataRefContract.dart';

class ReferenceContractItems extends ToJsonInterface {
  List<DataRefContract> data;

  ReferenceContractItems({
    this.data,
  });

  factory ReferenceContractItems.fromJson(Map<String, dynamic> json) => ReferenceContractItems(
    data: json["Data"] == null ? null : List<DataRefContract>.from(json["Data"].map((x) => DataRefContract.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}