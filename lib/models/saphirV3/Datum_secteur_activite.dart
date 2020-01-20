class DatumSectuerActivite {
  String jfaBrancheactiviteId;
  String jfaName;
  String jfaSecteuractivite;

  DatumSectuerActivite({
    this.jfaBrancheactiviteId,
    this.jfaName,
    this.jfaSecteuractivite,
  });

  factory DatumSectuerActivite.fromJson(Map<String, dynamic> json) => DatumSectuerActivite(
    jfaBrancheactiviteId: json["jfa_brancheactiviteId"] == null ? null : json["jfa_brancheactiviteId"],
    jfaName: json["jfa_name"] == null ? null : json["jfa_name"],
    jfaSecteuractivite: json["jfa_Secteuractivite"] == null ? null : json["jfa_Secteuractivite"],
  );

  Map<String, dynamic> toJson() => {
    "jfa_brancheactiviteId": jfaBrancheactiviteId == null ? null : jfaBrancheactiviteId,
    "jfa_name": jfaName == null ? null : jfaName,
    "jfa_Secteuractivite": jfaSecteuractivite == null ? null : jfaSecteuractivite,
  };
}