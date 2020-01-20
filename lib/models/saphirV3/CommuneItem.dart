import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class CommuneItem extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String fanDecoupage;
  String fanIdtechniquerecherche;
  String fanLatitude;
  String fanLongitude;
  dynamic gs2ECartebing;
  dynamic gs2ECode;
  dynamic gs2ECodepostal;
  dynamic gs2ELibellecourt;
  String gs2EStatutAdressetech;
  String fanDcoupagegographiqueid;
  String fanNiveaudecoupage;
  String fanDcoupageparentid;

  CommuneItem({
    this.id,
    this.type,
    this.statuscode,
    this.fanDecoupage,
    this.fanIdtechniquerecherche,
    this.fanLatitude,
    this.fanLongitude,
    this.gs2ECartebing,
    this.gs2ECode,
    this.gs2ECodepostal,
    this.gs2ELibellecourt,
    this.gs2EStatutAdressetech,
    this.fanDcoupagegographiqueid,
    this.fanNiveaudecoupage,
    this.fanDcoupageparentid,
  });

  factory CommuneItem.fromJson(Map<String, dynamic> json) => CommuneItem(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    fanDecoupage: json["fanDecoupage"] == null ? null : json["fanDecoupage"],
    fanIdtechniquerecherche: json["fanIdtechniquerecherche"] == null ? null : json["fanIdtechniquerecherche"],
    fanLatitude: json["fanLatitude"] == null ? null : json["fanLatitude"],
    fanLongitude: json["fanLongitude"] == null ? null : json["fanLongitude"],
    gs2ECartebing: json["gs2eCartebing"],
    gs2ECode: json["gs2eCode"],
    gs2ECodepostal: json["gs2eCodepostal"],
    gs2ELibellecourt: json["gs2eLibellecourt"],
    gs2EStatutAdressetech: json["gs2eStatutAdressetech"] == null ? null : json["gs2eStatutAdressetech"],
    fanDcoupagegographiqueid: json["fanDcoupagegographiqueid"] == null ? null : json["fanDcoupagegographiqueid"],
    fanNiveaudecoupage: json["fanNiveaudecoupage"] == null ? null : json["fanNiveaudecoupage"],
    fanDcoupageparentid: json["fanDcoupageparentid"] == null ? null : json["fanDcoupageparentid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "fanDecoupage": fanDecoupage == null ? null : fanDecoupage,
    "fanIdtechniquerecherche": fanIdtechniquerecherche == null ? null : fanIdtechniquerecherche,
    "fanLatitude": fanLatitude == null ? null : fanLatitude,
    "fanLongitude": fanLongitude == null ? null : fanLongitude,
    "gs2eCartebing": gs2ECartebing,
    "gs2eCode": gs2ECode,
    "gs2eCodepostal": gs2ECodepostal,
    "gs2eLibellecourt": gs2ELibellecourt,
    "gs2eStatutAdressetech": gs2EStatutAdressetech == null ? null : gs2EStatutAdressetech,
    "fanDcoupagegographiqueid": fanDcoupagegographiqueid == null ? null : fanDcoupagegographiqueid,
    "fanNiveaudecoupage": fanNiveaudecoupage == null ? null : fanNiveaudecoupage,
    "fanDcoupageparentid": fanDcoupageparentid == null ? null : fanDcoupageparentid,
  };
}