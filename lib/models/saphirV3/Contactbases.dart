import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Contactbases extends ToJsonInterface {
  String id;
  String type;
  int preferredcontactmethodcode;
  int leadsourcecode;
  int shippingmethodcode;
  bool participatesinworkflow;
  bool isbackofficecustomer;
  String firstname;
  String lastname;
  String fullname;
  dynamic birthdate;
  String yomifullname;
  dynamic gendercode;
  int haschildrencode;
  int educationcode;
  dynamic familystatuscode;
  dynamic emailaddress1;
  bool donotphone;
  bool donotfax;
  bool donotemail;
  bool donotpostalmail;
  bool donotbulkemail;
  bool donotbulkpostalmail;
  int accountrolecode;
  int territorycode;
  bool isprivate;
  String mobilephone;
  dynamic telephone1;
  int preferredappointmenttimecode;
  bool donotsendmm;
  bool merged;
  bool isautocreate;
  dynamic gs2EAprevenirencasdecoupuredo;
  dynamic gs2EChargertableaudo;
  int gs2ECodeOrganisation;
  String gs2ECodesystemegenreclient;
  dynamic gs2ENepascouperdo;
  dynamic gs2ENepasmettreenprecontentieuxdo;
  dynamic gs2ENepasrelancerdo;
  dynamic gs2ESouscriptionnmpfdo;
  dynamic gs2ETestfonctiondo;
  int jfaNaturepieceidentite;
  String jfaNomdelamere;
  String jfaNomdupere;
  String jfaNumeropiceidentite;
  String jfaReferenceclient;
  dynamic jfaSocietedugroupe;
  int jfaStatutsaphir;
  String contactid;
  dynamic transactioncurrencyid;
  dynamic gs2ECiviliteid;
  String gs2EGenreclientid;

  Contactbases({
    this.id,
    this.type,
    this.preferredcontactmethodcode,
    this.leadsourcecode,
    this.shippingmethodcode,
    this.participatesinworkflow,
    this.isbackofficecustomer,
    this.firstname,
    this.lastname,
    this.fullname,
    this.birthdate,
    this.yomifullname,
    this.gendercode,
    this.haschildrencode,
    this.educationcode,
    this.familystatuscode,
    this.emailaddress1,
    this.donotphone,
    this.donotfax,
    this.donotemail,
    this.donotpostalmail,
    this.donotbulkemail,
    this.donotbulkpostalmail,
    this.accountrolecode,
    this.territorycode,
    this.isprivate,
    this.mobilephone,
    this.telephone1,
    this.preferredappointmenttimecode,
    this.donotsendmm,
    this.merged,
    this.isautocreate,
    this.gs2EAprevenirencasdecoupuredo,
    this.gs2EChargertableaudo,
    this.gs2ECodeOrganisation,
    this.gs2ECodesystemegenreclient,
    this.gs2ENepascouperdo,
    this.gs2ENepasmettreenprecontentieuxdo,
    this.gs2ENepasrelancerdo,
    this.gs2ESouscriptionnmpfdo,
    this.gs2ETestfonctiondo,
    this.jfaNaturepieceidentite,
    this.jfaNomdelamere,
    this.jfaNomdupere,
    this.jfaNumeropiceidentite,
    this.jfaReferenceclient,
    this.jfaSocietedugroupe,
    this.jfaStatutsaphir,
    this.contactid,
    this.transactioncurrencyid,
    this.gs2ECiviliteid,
    this.gs2EGenreclientid,
  });

  factory Contactbases.fromJson(Map<String, dynamic> json) => Contactbases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    preferredcontactmethodcode: json["preferredcontactmethodcode"] == null ? null : json["preferredcontactmethodcode"],
    leadsourcecode: json["leadsourcecode"] == null ? null : json["leadsourcecode"],
    shippingmethodcode: json["shippingmethodcode"] == null ? null : json["shippingmethodcode"],
    participatesinworkflow: json["participatesinworkflow"] == null ? null : json["participatesinworkflow"],
    isbackofficecustomer: json["isbackofficecustomer"] == null ? null : json["isbackofficecustomer"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    birthdate: json["birthdate"],
    yomifullname: json["yomifullname"] == null ? null : json["yomifullname"],
    gendercode: json["gendercode"],
    haschildrencode: json["haschildrencode"] == null ? null : json["haschildrencode"],
    educationcode: json["educationcode"] == null ? null : json["educationcode"],
    familystatuscode: json["familystatuscode"],
    emailaddress1: json["emailaddress1"],
    donotphone: json["donotphone"] == null ? null : json["donotphone"],
    donotfax: json["donotfax"] == null ? null : json["donotfax"],
    donotemail: json["donotemail"] == null ? null : json["donotemail"],
    donotpostalmail: json["donotpostalmail"] == null ? null : json["donotpostalmail"],
    donotbulkemail: json["donotbulkemail"] == null ? null : json["donotbulkemail"],
    donotbulkpostalmail: json["donotbulkpostalmail"] == null ? null : json["donotbulkpostalmail"],
    accountrolecode: json["accountrolecode"] == null ? null : json["accountrolecode"],
    territorycode: json["territorycode"] == null ? null : json["territorycode"],
    isprivate: json["isprivate"] == null ? null : json["isprivate"],
    mobilephone: json["mobilephone"] == null ? null : json["mobilephone"],
    telephone1: json["telephone1"],
    preferredappointmenttimecode: json["preferredappointmenttimecode"] == null ? null : json["preferredappointmenttimecode"],
    donotsendmm: json["donotsendmm"] == null ? null : json["donotsendmm"],
    merged: json["merged"] == null ? null : json["merged"],
    isautocreate: json["isautocreate"] == null ? null : json["isautocreate"],
    gs2EAprevenirencasdecoupuredo: json["gs2eAprevenirencasdecoupuredo"],
    gs2EChargertableaudo: json["gs2eChargertableaudo"],
    gs2ECodeOrganisation: json["gs2eCodeOrganisation"] == null ? null : json["gs2eCodeOrganisation"],
    gs2ECodesystemegenreclient: json["gs2eCodesystemegenreclient"] == null ? null : json["gs2eCodesystemegenreclient"],
    gs2ENepascouperdo: json["gs2eNepascouperdo"],
    gs2ENepasmettreenprecontentieuxdo: json["gs2eNepasmettreenprecontentieuxdo"],
    gs2ENepasrelancerdo: json["gs2eNepasrelancerdo"],
    gs2ESouscriptionnmpfdo: json["gs2eSouscriptionnmpfdo"],
    gs2ETestfonctiondo: json["gs2eTestfonctiondo"],
    jfaNaturepieceidentite: json["jfaNaturepieceidentite"] == null ? null : json["jfaNaturepieceidentite"],
    jfaNomdelamere: json["jfaNomdelamere"] == null ? null : json["jfaNomdelamere"],
    jfaNomdupere: json["jfaNomdupere"] == null ? null : json["jfaNomdupere"],
    jfaNumeropiceidentite: json["jfaNumeropiceidentite"] == null ? null : json["jfaNumeropiceidentite"],
    jfaReferenceclient: json["jfaReferenceclient"] == null ? null : json["jfaReferenceclient"],
    jfaSocietedugroupe: json["jfaSocietedugroupe"],
    jfaStatutsaphir: json["jfaStatutsaphir"] == null ? null : json["jfaStatutsaphir"],
    contactid: json["contactid"] == null ? null : json["contactid"],
    transactioncurrencyid: json["transactioncurrencyid"],
    gs2ECiviliteid: json["gs2eCiviliteid"],
    gs2EGenreclientid: json["gs2eGenreclientid"] == null ? null : json["gs2eGenreclientid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "preferredcontactmethodcode": preferredcontactmethodcode == null ? null : preferredcontactmethodcode,
    "leadsourcecode": leadsourcecode == null ? null : leadsourcecode,
    "shippingmethodcode": shippingmethodcode == null ? null : shippingmethodcode,
    "participatesinworkflow": participatesinworkflow == null ? null : participatesinworkflow,
    "isbackofficecustomer": isbackofficecustomer == null ? null : isbackofficecustomer,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "fullname": fullname == null ? null : fullname,
    "birthdate": birthdate,
    "yomifullname": yomifullname == null ? null : yomifullname,
    "gendercode": gendercode,
    "haschildrencode": haschildrencode == null ? null : haschildrencode,
    "educationcode": educationcode == null ? null : educationcode,
    "familystatuscode": familystatuscode,
    "emailaddress1": emailaddress1,
    "donotphone": donotphone == null ? null : donotphone,
    "donotfax": donotfax == null ? null : donotfax,
    "donotemail": donotemail == null ? null : donotemail,
    "donotpostalmail": donotpostalmail == null ? null : donotpostalmail,
    "donotbulkemail": donotbulkemail == null ? null : donotbulkemail,
    "donotbulkpostalmail": donotbulkpostalmail == null ? null : donotbulkpostalmail,
    "accountrolecode": accountrolecode == null ? null : accountrolecode,
    "territorycode": territorycode == null ? null : territorycode,
    "isprivate": isprivate == null ? null : isprivate,
    "mobilephone": mobilephone == null ? null : mobilephone,
    "telephone1": telephone1,
    "preferredappointmenttimecode": preferredappointmenttimecode == null ? null : preferredappointmenttimecode,
    "donotsendmm": donotsendmm == null ? null : donotsendmm,
    "merged": merged == null ? null : merged,
    "isautocreate": isautocreate == null ? null : isautocreate,
    "gs2eAprevenirencasdecoupuredo": gs2EAprevenirencasdecoupuredo,
    "gs2eChargertableaudo": gs2EChargertableaudo,
    "gs2eCodeOrganisation": gs2ECodeOrganisation == null ? null : gs2ECodeOrganisation,
    "gs2eCodesystemegenreclient": gs2ECodesystemegenreclient == null ? null : gs2ECodesystemegenreclient,
    "gs2eNepascouperdo": gs2ENepascouperdo,
    "gs2eNepasmettreenprecontentieuxdo": gs2ENepasmettreenprecontentieuxdo,
    "gs2eNepasrelancerdo": gs2ENepasrelancerdo,
    "gs2eSouscriptionnmpfdo": gs2ESouscriptionnmpfdo,
    "gs2eTestfonctiondo": gs2ETestfonctiondo,
    "jfaNaturepieceidentite": jfaNaturepieceidentite == null ? null : jfaNaturepieceidentite,
    "jfaNomdelamere": jfaNomdelamere == null ? null : jfaNomdelamere,
    "jfaNomdupere": jfaNomdupere == null ? null : jfaNomdupere,
    "jfaNumeropiceidentite": jfaNumeropiceidentite == null ? null : jfaNumeropiceidentite,
    "jfaReferenceclient": jfaReferenceclient == null ? null : jfaReferenceclient,
    "jfaSocietedugroupe": jfaSocietedugroupe,
    "jfaStatutsaphir": jfaStatutsaphir == null ? null : jfaStatutsaphir,
    "contactid": contactid == null ? null : contactid,
    "transactioncurrencyid": transactioncurrencyid,
    "gs2eCiviliteid": gs2ECiviliteid,
    "gs2eGenreclientid": gs2EGenreclientid == null ? null : gs2EGenreclientid,
  };
}