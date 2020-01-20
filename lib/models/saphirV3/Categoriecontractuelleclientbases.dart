import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Categoriecontractuelleclientbases extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String jfaName;
  String jfaCode;
  String jfaCategoriecontractuelleclientid;
  String gs2ECatgorieclientlie;
  bool gs2EQuotaautorisedo;

  Categoriecontractuelleclientbases({
    this.id,
    this.type,
    this.statuscode,
    this.jfaName,
    this.jfaCode,
    this.jfaCategoriecontractuelleclientid,
    this.gs2ECatgorieclientlie,
    this.gs2EQuotaautorisedo,
  });

  factory Categoriecontractuelleclientbases.fromJson(Map<String, dynamic> json) => Categoriecontractuelleclientbases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    jfaName: json["jfaName"] == null ? null : json["jfaName"],
    jfaCode: json["jfaCode"] == null ? null : json["jfaCode"],
    jfaCategoriecontractuelleclientid: json["jfaCategoriecontractuelleclientid"] == null ? null : json["jfaCategoriecontractuelleclientid"],
    gs2ECatgorieclientlie: json["gs2eCatgorieclientlie"] == null ? null : json["gs2eCatgorieclientlie"],
    gs2EQuotaautorisedo: json["gs2eQuotaautorisedo"] == null ? null : json["gs2eQuotaautorisedo"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "jfaName": jfaName == null ? null : jfaName,
    "jfaCode": jfaCode == null ? null : jfaCode,
    "jfaCategoriecontractuelleclientid": jfaCategoriecontractuelleclientid == null ? null : jfaCategoriecontractuelleclientid,
    "gs2eCatgorieclientlie": gs2ECatgorieclientlie == null ? null : gs2ECatgorieclientlie,
    "gs2eQuotaautorisedo": gs2EQuotaautorisedo == null ? null : gs2EQuotaautorisedo,
  };
}