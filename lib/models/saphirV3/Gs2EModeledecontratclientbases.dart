import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Gs2EModeledecontratclientbases extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String gs2EName;
  String gs2EReference;
  String gs2EModeledecontratclientid;
  String gs2EProductid;

  Gs2EModeledecontratclientbases({
    this.id,
    this.type,
    this.statuscode,
    this.gs2EName,
    this.gs2EReference,
    this.gs2EModeledecontratclientid,
    this.gs2EProductid,
  });

  factory Gs2EModeledecontratclientbases.fromJson(Map<String, dynamic> json) => Gs2EModeledecontratclientbases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    gs2EName: json["gs2eName"] == null ? null : json["gs2eName"],
    gs2EReference: json["gs2eReference"] == null ? null : json["gs2eReference"],
    gs2EModeledecontratclientid: json["gs2eModeledecontratclientid"] == null ? null : json["gs2eModeledecontratclientid"],
    gs2EProductid: json["gs2eProductid"] == null ? null : json["gs2eProductid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "gs2eName": gs2EName == null ? null : gs2EName,
    "gs2eReference": gs2EReference == null ? null : gs2EReference,
    "gs2eModeledecontratclientid": gs2EModeledecontratclientid == null ? null : gs2EModeledecontratclientid,
    "gs2eProductid": gs2EProductid == null ? null : gs2EProductid,
  };
}