import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Gs2EBranchementbases extends ToJsonInterface {
  String id;
  String type;
  int statuscode;
  String gs2EName;
  int gs2ENaturecommercialego;
  int gs2EOrdretournee;
  String gs2EReferencedubranchement;
  int gs2EStatutsaphir;
  int gs2EStatutsaphiraffichego;
  dynamic gs2ETypedesubventionpromotiongo;
  String gs2ELocalisationdubranchement;
  String gs2EBranchementid;

  Gs2EBranchementbases({
    this.id,
    this.type,
    this.statuscode,
    this.gs2EName,
    this.gs2ENaturecommercialego,
    this.gs2EOrdretournee,
    this.gs2EReferencedubranchement,
    this.gs2EStatutsaphir,
    this.gs2EStatutsaphiraffichego,
    this.gs2ETypedesubventionpromotiongo,
    this.gs2ELocalisationdubranchement,
    this.gs2EBranchementid,
  });

  factory Gs2EBranchementbases.fromJson(Map<String, dynamic> json) => Gs2EBranchementbases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    gs2EName: json["gs2eName"] == null ? null : json["gs2eName"],
    gs2ENaturecommercialego: json["gs2eNaturecommercialego"] == null ? null : json["gs2eNaturecommercialego"],
    gs2EOrdretournee: json["gs2eOrdretournee"] == null ? null : json["gs2eOrdretournee"],
    gs2EReferencedubranchement: json["gs2eReferencedubranchement"] == null ? null : json["gs2eReferencedubranchement"],
    gs2EStatutsaphir: json["gs2eStatutsaphir"] == null ? null : json["gs2eStatutsaphir"],
    gs2EStatutsaphiraffichego: json["gs2eStatutsaphiraffichego"] == null ? null : json["gs2eStatutsaphiraffichego"],
    gs2ETypedesubventionpromotiongo: json["gs2eTypedesubventionpromotiongo"],
    gs2ELocalisationdubranchement: json["gs2eLocalisationdubranchement"] == null ? null : json["gs2eLocalisationdubranchement"],
    gs2EBranchementid: json["gs2eBranchementid"] == null ? null : json["gs2eBranchementid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "gs2eName": gs2EName == null ? null : gs2EName,
    "gs2eNaturecommercialego": gs2ENaturecommercialego == null ? null : gs2ENaturecommercialego,
    "gs2eOrdretournee": gs2EOrdretournee == null ? null : gs2EOrdretournee,
    "gs2eReferencedubranchement": gs2EReferencedubranchement == null ? null : gs2EReferencedubranchement,
    "gs2eStatutsaphir": gs2EStatutsaphir == null ? null : gs2EStatutsaphir,
    "gs2eStatutsaphiraffichego": gs2EStatutsaphiraffichego == null ? null : gs2EStatutsaphiraffichego,
    "gs2eTypedesubventionpromotiongo": gs2ETypedesubventionpromotiongo,
    "gs2eLocalisationdubranchement": gs2ELocalisationdubranchement == null ? null : gs2ELocalisationdubranchement,
    "gs2eBranchementid": gs2EBranchementid == null ? null : gs2EBranchementid,
  };
}