import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Salesliteraturebases extends ToJsonInterface {
  String id;
  String type;
  dynamic description;
  String name;
  bool hasattachments;
  dynamic processid;
  dynamic entityimageid;
  bool jfaDocumentobligatoire;
  dynamic gs2EDemandedegrevementid;
  String gs2ETypedocumentid;
  dynamic gs2EDemandeinterventiondiverseid;
  dynamic gs2EDemanderaccordementabonnementid;
  String salesliteratureid;
  dynamic gs2EBranchementid;
  dynamic gs2EDemandeabonnementid;
  dynamic gs2EDemandebranchementid;
  dynamic gs2EDemandebranchementabonnementid;
  dynamic gs2EDemanderesiliationid;
  dynamic jfaContrat;
  int literaturetypecode;

  Salesliteraturebases({
    this.id,
    this.type,
    this.description,
    this.name,
    this.hasattachments,
    this.processid,
    this.entityimageid,
    this.jfaDocumentobligatoire,
    this.gs2EDemandedegrevementid,
    this.gs2ETypedocumentid,
    this.gs2EDemandeinterventiondiverseid,
    this.gs2EDemanderaccordementabonnementid,
    this.salesliteratureid,
    this.gs2EBranchementid,
    this.gs2EDemandeabonnementid,
    this.gs2EDemandebranchementid,
    this.gs2EDemandebranchementabonnementid,
    this.gs2EDemanderesiliationid,
    this.jfaContrat,
    this.literaturetypecode,
  });

  factory Salesliteraturebases.fromJson(Map<String, dynamic> json) => Salesliteraturebases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    description: json["description"],
    name: json["name"] == null ? null : json["name"],
    hasattachments: json["hasattachments"] == null ? null : json["hasattachments"],
    processid: json["processid"],
    entityimageid: json["entityimageid"],
    jfaDocumentobligatoire: json["jfaDocumentobligatoire"] == null ? null : json["jfaDocumentobligatoire"],
    gs2EDemandedegrevementid: json["gs2eDemandedegrevementid"],
    gs2ETypedocumentid: json["gs2eTypedocumentid"] == null ? null : json["gs2eTypedocumentid"],
    gs2EDemandeinterventiondiverseid: json["gs2eDemandeinterventiondiverseid"],
    gs2EDemanderaccordementabonnementid: json["gs2eDemanderaccordementabonnementid"],
    salesliteratureid: json["salesliteratureid"] == null ? null : json["salesliteratureid"],
    gs2EBranchementid: json["gs2eBranchementid"],
    gs2EDemandeabonnementid: json["gs2eDemandeabonnementid"],
    gs2EDemandebranchementid: json["gs2eDemandebranchementid"],
    gs2EDemandebranchementabonnementid: json["gs2eDemandebranchementabonnementid"],
    gs2EDemanderesiliationid: json["gs2eDemanderesiliationid"],
    jfaContrat: json["jfaContrat"],
    literaturetypecode: json["literaturetypecode"] == null ? null : json["literaturetypecode"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "description": description,
    "name": name == null ? null : name,
    "hasattachments": hasattachments == null ? null : hasattachments,
    "processid": processid,
    "entityimageid": entityimageid,
    "jfaDocumentobligatoire": jfaDocumentobligatoire == null ? null : jfaDocumentobligatoire,
    "gs2eDemandedegrevementid": gs2EDemandedegrevementid,
    "gs2eTypedocumentid": gs2ETypedocumentid == null ? null : gs2ETypedocumentid,
    "gs2eDemandeinterventiondiverseid": gs2EDemandeinterventiondiverseid,
    "gs2eDemanderaccordementabonnementid": gs2EDemanderaccordementabonnementid,
    "salesliteratureid": salesliteratureid == null ? null : salesliteratureid,
    "gs2eBranchementid": gs2EBranchementid,
    "gs2eDemandeabonnementid": gs2EDemandeabonnementid,
    "gs2eDemandebranchementid": gs2EDemandebranchementid,
    "gs2eDemandebranchementabonnementid": gs2EDemandebranchementabonnementid,
    "gs2eDemanderesiliationid": gs2EDemanderesiliationid,
    "jfaContrat": jfaContrat,
    "literaturetypecode": literaturetypecode == null ? null : literaturetypecode,
  };
}