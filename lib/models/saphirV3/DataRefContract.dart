import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class DataRefContract extends ToJsonInterface {
  String jfaReferencecontrat;
  String contractId;
  String gs2EModeledecontratclientid;

  DataRefContract({
    this.jfaReferencecontrat,
    this.contractId,
    this.gs2EModeledecontratclientid,
  });

  factory DataRefContract.fromJson(Map<String, dynamic> json) => DataRefContract(
    jfaReferencecontrat: json["jfa_Referencecontrat"] == null ? null : json["jfa_Referencecontrat"],
    contractId: json["ContractId"] == null ? null : json["ContractId"],
    gs2EModeledecontratclientid: json["gs2e_modeledecontratclientid"] == null ? null : json["gs2e_modeledecontratclientid"],
  );

  Map<String, dynamic> toJson() => {
    "jfa_Referencecontrat": jfaReferencecontrat == null ? null : jfaReferencecontrat,
    "ContractId": contractId == null ? null : contractId,
    "gs2e_modeledecontratclientid": gs2EModeledecontratclientid == null ? null : gs2EModeledecontratclientid,
  };
}