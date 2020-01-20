import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Gs2ETypededocumentdumodelebases extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String gs2EName;
  int gs2EMotifdedemandego;
  bool gs2EObligatoireDo;
  String gs2ETypededocumentid;
  String gs2ETypededocumentdumodeleid;
  String gs2EModeledecontratclientid;

  Gs2ETypededocumentdumodelebases({
    this.id,
    this.type,
    this.statuscode,
    this.gs2EName,
    this.gs2EMotifdedemandego,
    this.gs2EObligatoireDo,
    this.gs2ETypededocumentid,
    this.gs2ETypededocumentdumodeleid,
    this.gs2EModeledecontratclientid,
  });

  factory Gs2ETypededocumentdumodelebases.fromJson(Map<String, dynamic> json) => Gs2ETypededocumentdumodelebases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    gs2EName: json["gs2eName"] == null ? null : json["gs2eName"],
    gs2EMotifdedemandego: json["gs2eMotifdedemandego"] == null ? null : json["gs2eMotifdedemandego"],
    gs2EObligatoireDo: json["gs2eObligatoireDo"] == null ? null : json["gs2eObligatoireDo"],
    gs2ETypededocumentid: json["gs2eTypededocumentid"] == null ? null : json["gs2eTypededocumentid"],
    gs2ETypededocumentdumodeleid: json["gs2eTypededocumentdumodeleid"] == null ? null : json["gs2eTypededocumentdumodeleid"],
    gs2EModeledecontratclientid: json["gs2eModeledecontratclientid"] == null ? null : json["gs2eModeledecontratclientid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "gs2eName": gs2EName == null ? null : gs2EName,
    "gs2eMotifdedemandego": gs2EMotifdedemandego == null ? null : gs2EMotifdedemandego,
    "gs2eObligatoireDo": gs2EObligatoireDo == null ? null : gs2EObligatoireDo,
    "gs2eTypededocumentid": gs2ETypededocumentid == null ? null : gs2ETypededocumentid,
    "gs2eTypededocumentdumodeleid": gs2ETypededocumentdumodeleid == null ? null : gs2ETypededocumentdumodeleid,
    "gs2eModeledecontratclientid": gs2EModeledecontratclientid == null ? null : gs2EModeledecontratclientid,
  };
}