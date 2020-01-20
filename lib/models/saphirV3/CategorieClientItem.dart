import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class CategorieClientItem extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String gs2EName;
  String gs2ECodecatgorie;
  String gs2ECategorieclientid;
  String gs2EGenreclientid;

  CategorieClientItem({
    this.id,
    this.type,
    this.statuscode,
    this.gs2EName,
    this.gs2ECodecatgorie,
    this.gs2ECategorieclientid,
    this.gs2EGenreclientid,
  });

  factory CategorieClientItem.fromJson(Map<String, dynamic> json) => CategorieClientItem(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    gs2EName: json["gs2eName"] == null ? null : json["gs2eName"],
    gs2ECodecatgorie: json["gs2eCodecatgorie"] == null ? null : json["gs2eCodecatgorie"],
    gs2ECategorieclientid: json["gs2eCategorieclientid"] == null ? null : json["gs2eCategorieclientid"],
    gs2EGenreclientid: json["gs2eGenreclientid"] == null ? null : json["gs2eGenreclientid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "gs2eName": gs2EName == null ? null : gs2EName,
    "gs2eCodecatgorie": gs2ECodecatgorie == null ? null : gs2ECodecatgorie,
    "gs2eCategorieclientid": gs2ECategorieclientid == null ? null : gs2ECategorieclientid,
    "gs2eGenreclientid": gs2EGenreclientid == null ? null : gs2EGenreclientid,
  };
}