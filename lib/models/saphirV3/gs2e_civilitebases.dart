import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Civilitebases extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String gs2EName;
  String gs2ECiviliteid;

  Civilitebases({
    this.id,
    this.type,
    this.statuscode,
    this.gs2EName,
    this.gs2ECiviliteid,
  });

  factory Civilitebases.fromJson(Map<String, dynamic> json) => Civilitebases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    gs2EName: json["gs2eName"] == null ? null : json["gs2eName"],
    gs2ECiviliteid: json["gs2eCiviliteid"] == null ? null : json["gs2eCiviliteid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "gs2eName": gs2EName == null ? null : gs2EName,
    "gs2eCiviliteid": gs2ECiviliteid == null ? null : gs2ECiviliteid,
  };
}
