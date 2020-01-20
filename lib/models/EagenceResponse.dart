
import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/TabEagence.dart';

class EagenceResponse extends ToJsonInterface {
  int refIndividu;
  int valeur;
  int retour;
  int idUser;
  String RefClient;
  int variable1;
  String idSave;
  String numDemv3;
  String Num_Dem_Temp;
  List<TabEagence> tab;
  String gs2e_motifdedemandego;
  List<String> contracts;
  List<String> Tab_My_Demandes;
  List<String> Tableau_Id_Save;

  EagenceResponse({
    this.refIndividu,
    this.valeur,
    this.idUser,
    this.RefClient,
    this.contracts,
    this.variable1,
    this.idSave,
    this.retour,
    this.numDemv3,
    this.Tab_My_Demandes,
    this.gs2e_motifdedemandego,
    this.Num_Dem_Temp,
    this.Tableau_Id_Save,
    this.tab
  });

  factory EagenceResponse.fromJson(Map<String, dynamic> json) => EagenceResponse(
    refIndividu: json["Ref_Individu"] == null ? null : json["Ref_Individu"],
    valeur: json["Valeur"] == null ? null : json["Valeur"],
    retour: json["retour"] == null ? null : json["retour"],
    idUser: json["Id_Usr"] == null ? null : json["Id_Usr"],
    RefClient: json["Ref"] == null ? null : json["Ref"].toString(),
    contracts: json["contracts"] == null ? null : List<String>.from(json["contracts"].map((x) => x)),
    Tab_My_Demandes: json["Tab_My_Demandes"] == null ? null : List<String>.from(json["Tab_My_Demandes"].map((x) => x)),
    Tableau_Id_Save: json["Tableau_Id_Save"] == null ? null : List<String>.from(json["Tableau_Id_Save"].map((x) => x)),
    variable1: json["Variable1"] == null ? null : json["Variable1"],
    idSave: json["Id_Save"] == null ? null : json["Id_Save"],
    tab: json["Tab"] == null ? null : List<TabEagence>.from(json["Tab"].map((x) => TabEagence.fromJson(x))),
    numDemv3: json["Num_Demv3"] == null ? null : json["Num_Demv3"],
    Num_Dem_Temp: json["Num_Dem_Temp"] == null ? null : json["Num_Dem_Temp"],
    gs2e_motifdedemandego: json["gs2e_motifdedemandego"] == null ? null : json["gs2e_motifdedemandego"],
  );

  Map<String, dynamic> toJson() => {
    "Ref_Individu": refIndividu == null ? null : refIndividu,
    "Valeur": valeur == null ? null : valeur,
    "retour": retour == null ? null : retour,
    "Id_Usr": idUser == null ? null : idUser,
    "Ref": RefClient == null ? null : RefClient,
    "Variable1": variable1 == null ? null : variable1,
    "Id_Save": idSave == null ? null : idSave,
    "Num_Demv3": numDemv3 == null ? null : numDemv3,
    "Num_Dem_Temp": Num_Dem_Temp == null ? null : Num_Dem_Temp,
    "gs2e_motifdedemandego": gs2e_motifdedemandego == null ? null : gs2e_motifdedemandego,
    "contracts": contracts == null ? null : List<dynamic>.from(contracts.map((x) => x)),
    "Tableau_Id_Save": Tableau_Id_Save == null ? null : List<dynamic>.from(Tableau_Id_Save.map((x) => x)),
    "Tab_My_Demandes": Tab_My_Demandes == null ? null : List<dynamic>.from(Tab_My_Demandes.map((x) => x)),
    "Tab": tab == null ? null : List<dynamic>.from(tab.map((x) => x.toJson())),
  };

}