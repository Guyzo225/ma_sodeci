import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Contractbase extends ToJsonInterface {
  String id;
  String type;
  String contracttemplateid;
  int contractservicelevelcode;
  dynamic serviceaddress;
  dynamic billtoaddress;
  String contractnumber;
  String title;
  dynamic contractlanguage;
  DateTime billingstarton;
  String effectivitycalendar;
  DateTime billingendon;
  int billingfrequencycode;
  dynamic totalprice;
  dynamic totaldiscount;
  dynamic netprice;
  int statuscode;
  dynamic totaldiscountBase;
  dynamic netpriceBase;
  dynamic totalpriceBase;
  String customerid;
  String billingcustomerid;
  int customeridtype;
  String customeridname;
  String billingcustomeridname;
  String customeridyominame;
  String billingcustomeridyominame;
  dynamic entityimageid;
  dynamic gs2EAncienneavancesurconsommation;
  dynamic gs2EAncienneavancesurconsommationBase;
  bool gs2EAscspecialedo;
  bool gs2EAvenantdo;
  dynamic gs2EBascule5Ago;
  int gs2EClassificationsouscripteurgo;
  bool gs2ECntIssuBranchementabonnementdo;
  bool gs2ECntIssuMutationdo;
  String gs2ECodetarif;
  int gs2ECodetarifgo;
  dynamic gs2ECoefficientPenaliteMauvaisFacteurps;
  dynamic gs2ECoefficientPenalitedepassementps;
  dynamic gs2ECoefficientperte;
  dynamic gs2ECoefficientperteavide;
  dynamic gs2ECoefficientperteencharge;
  dynamic gs2ECoefficientpuissancesollicitephjour;
  dynamic gs2ECoefficientpuissancesollicitephnuit;
  dynamic gs2ECoefficientpuissancesollicitephpointe;
  dynamic gs2EDateBasculement;
  dynamic gs2EDateModificationContrat;
  dynamic gs2EDatedebutsuspension;
  dynamic gs2EDatedecomptabilisation;
  dynamic gs2EDatedecomptabilisationresilie;
  dynamic gs2EDatedemarlocationautremateriel;
  dynamic gs2EDatedemarlocationtfo;
  dynamic gs2EDateeffetquota;
  dynamic gs2EDatefinquota;
  dynamic gs2EDatefinsuspension;
  dynamic gs2EDatemodificationstatut;
  bool gs2EExonerationentretientcelluleetcable;
  bool gs2EExonerationlocationautremateriel;
  bool gs2EExonerationlocationtfo;
  bool gs2EGratuiteApplicable;
  dynamic gs2EMaraichere;
  dynamic gs2EMontantAscSpeciale;
  dynamic gs2EMontantAscSpecialeBase;
  dynamic gs2ENaturecommercialego;
  dynamic gs2ENbreheureutilisation;
  dynamic gs2ENombremoisdelocationtfo;
  dynamic gs2EPrixmoisentretientcelluleetcable;
  dynamic gs2EPrixmoisentretientcelluleetcableBase;
  dynamic gs2EPrixmoislocationautremateriel;
  dynamic gs2EPrixmoislocationautrematerielBase;
  dynamic gs2EPrixmoislocationtfo;
  dynamic gs2EPrixmoislocationtfoBase;
  dynamic gs2ESoldedetoutcompte;
  dynamic gs2ESoldedetoutcompteBase;
  dynamic gs2ESoldedetoutcomptecrediteur;
  dynamic gs2ESoldedetoutcomptecrediteurBase;
  dynamic gs2EStatutrecouvrementgo;
  bool gs2ETransformateurenlocation;
  dynamic gs2ETypeOuverture;
  dynamic gs2ETypeSimulationDo;
  dynamic gs2ETypeValue;
  int gs2ETypecontratgo;
  dynamic gs2ETypedesubventionpromotiongo;
  bool jfaAccordpourmiseenservice;
  int jfaAvancesurconsommation;
  int jfaAvancesurconsommationBase;
  bool jfaContratsigne;
  DateTime jfaDateabonnement;
  dynamic jfaDatedesignature;
  DateTime jfaDateeffet;
  dynamic jfaDateremboursement;
  dynamic jfaDateresiliation;
  bool jfaIndicateuraccord;
  bool jfaPftemporaire;
  String jfaReferenceanciensysteme;
  String jfaReferencecontrat;
  int jfaStatutsaphir;
  bool jfaValidationhierarchiquedemandee;
  bool jfaValideparhierarchie;
  int jfaVersion;
  dynamic gs2EBranchementabonnementid;
  dynamic gs2EContratdegreve;
  dynamic gs2EDureeannuellecontractuelleid;
  dynamic gs2ELotcampagnerenouvellementid;
  String gs2EModeledecontratclientid;
  dynamic gs2ERegimedetarificationid;
  String gs2EDiametrecompteurid;
  dynamic gs2EPuissancesouscritephjour;
  dynamic gs2EPuissancesouscritephnuit;
  dynamic gs2EPuissancesouscritephpointe;
  String jfaPointdefourniture;
  String jfaBrancheactivite;
  dynamic jfaPuissancesouscrite;
  dynamic jfaReglagedisjoncteur;
  String jfaSecteuractivite;
  String jfaUsage;
  String gs2EFraisDeRecouvrement;
  dynamic gs2EContratsuspenduid;
  dynamic gs2EEncoursdemodification;
  dynamic gs2ESegmentid;
  dynamic gs2ESoussegmentid;
  String contractid;
  dynamic originatingcontract;
  String gs2ECategorieclientid;
  dynamic gs2EDemandebranchementid;
  String gs2ETypedecontratautoriseid;
  dynamic gs2ECategorieContractuelleComptaid;
  String gs2EConventionfacturationid;
  dynamic gs2EConventionregroupementid;
  String jfaUodestination;
  String jfaContratdirecteur;
  String jfaCategoriecontractuelle;
  String jfaProduit;

  Contractbase({
    this.id,
    this.type,
    this.contracttemplateid,
    this.contractservicelevelcode,
    this.serviceaddress,
    this.billtoaddress,
    this.contractnumber,
    this.title,
    this.contractlanguage,
    this.billingstarton,
    this.effectivitycalendar,
    this.billingendon,
    this.billingfrequencycode,
    this.totalprice,
    this.totaldiscount,
    this.netprice,
    this.statuscode,
    this.totaldiscountBase,
    this.netpriceBase,
    this.totalpriceBase,
    this.customerid,
    this.billingcustomerid,
    this.customeridtype,
    this.customeridname,
    this.billingcustomeridname,
    this.customeridyominame,
    this.billingcustomeridyominame,
    this.entityimageid,
    this.gs2EAncienneavancesurconsommation,
    this.gs2EAncienneavancesurconsommationBase,
    this.gs2EAscspecialedo,
    this.gs2EAvenantdo,
    this.gs2EBascule5Ago,
    this.gs2EClassificationsouscripteurgo,
    this.gs2ECntIssuBranchementabonnementdo,
    this.gs2ECntIssuMutationdo,
    this.gs2ECodetarif,
    this.gs2ECodetarifgo,
    this.gs2ECoefficientPenaliteMauvaisFacteurps,
    this.gs2ECoefficientPenalitedepassementps,
    this.gs2ECoefficientperte,
    this.gs2ECoefficientperteavide,
    this.gs2ECoefficientperteencharge,
    this.gs2ECoefficientpuissancesollicitephjour,
    this.gs2ECoefficientpuissancesollicitephnuit,
    this.gs2ECoefficientpuissancesollicitephpointe,
    this.gs2EDateBasculement,
    this.gs2EDateModificationContrat,
    this.gs2EDatedebutsuspension,
    this.gs2EDatedecomptabilisation,
    this.gs2EDatedecomptabilisationresilie,
    this.gs2EDatedemarlocationautremateriel,
    this.gs2EDatedemarlocationtfo,
    this.gs2EDateeffetquota,
    this.gs2EDatefinquota,
    this.gs2EDatefinsuspension,
    this.gs2EDatemodificationstatut,
    this.gs2EExonerationentretientcelluleetcable,
    this.gs2EExonerationlocationautremateriel,
    this.gs2EExonerationlocationtfo,
    this.gs2EGratuiteApplicable,
    this.gs2EMaraichere,
    this.gs2EMontantAscSpeciale,
    this.gs2EMontantAscSpecialeBase,
    this.gs2ENaturecommercialego,
    this.gs2ENbreheureutilisation,
    this.gs2ENombremoisdelocationtfo,
    this.gs2EPrixmoisentretientcelluleetcable,
    this.gs2EPrixmoisentretientcelluleetcableBase,
    this.gs2EPrixmoislocationautremateriel,
    this.gs2EPrixmoislocationautrematerielBase,
    this.gs2EPrixmoislocationtfo,
    this.gs2EPrixmoislocationtfoBase,
    this.gs2ESoldedetoutcompte,
    this.gs2ESoldedetoutcompteBase,
    this.gs2ESoldedetoutcomptecrediteur,
    this.gs2ESoldedetoutcomptecrediteurBase,
    this.gs2EStatutrecouvrementgo,
    this.gs2ETransformateurenlocation,
    this.gs2ETypeOuverture,
    this.gs2ETypeSimulationDo,
    this.gs2ETypeValue,
    this.gs2ETypecontratgo,
    this.gs2ETypedesubventionpromotiongo,
    this.jfaAccordpourmiseenservice,
    this.jfaAvancesurconsommation,
    this.jfaAvancesurconsommationBase,
    this.jfaContratsigne,
    this.jfaDateabonnement,
    this.jfaDatedesignature,
    this.jfaDateeffet,
    this.jfaDateremboursement,
    this.jfaDateresiliation,
    this.jfaIndicateuraccord,
    this.jfaPftemporaire,
    this.jfaReferenceanciensysteme,
    this.jfaReferencecontrat,
    this.jfaStatutsaphir,
    this.jfaValidationhierarchiquedemandee,
    this.jfaValideparhierarchie,
    this.jfaVersion,
    this.gs2EBranchementabonnementid,
    this.gs2EContratdegreve,
    this.gs2EDureeannuellecontractuelleid,
    this.gs2ELotcampagnerenouvellementid,
    this.gs2EModeledecontratclientid,
    this.gs2ERegimedetarificationid,
    this.gs2EDiametrecompteurid,
    this.gs2EPuissancesouscritephjour,
    this.gs2EPuissancesouscritephnuit,
    this.gs2EPuissancesouscritephpointe,
    this.jfaPointdefourniture,
    this.jfaBrancheactivite,
    this.jfaPuissancesouscrite,
    this.jfaReglagedisjoncteur,
    this.jfaSecteuractivite,
    this.jfaUsage,
    this.gs2EFraisDeRecouvrement,
    this.gs2EContratsuspenduid,
    this.gs2EEncoursdemodification,
    this.gs2ESegmentid,
    this.gs2ESoussegmentid,
    this.contractid,
    this.originatingcontract,
    this.gs2ECategorieclientid,
    this.gs2EDemandebranchementid,
    this.gs2ETypedecontratautoriseid,
    this.gs2ECategorieContractuelleComptaid,
    this.gs2EConventionfacturationid,
    this.gs2EConventionregroupementid,
    this.jfaUodestination,
    this.jfaContratdirecteur,
    this.jfaCategoriecontractuelle,
    this.jfaProduit,
  });

  factory Contractbase.fromJson(Map<String, dynamic> json) => Contractbase(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    contracttemplateid: json["contracttemplateid"] == null ? null : json["contracttemplateid"],
    contractservicelevelcode: json["contractservicelevelcode"] == null ? null : json["contractservicelevelcode"],
    serviceaddress: json["serviceaddress"],
    billtoaddress: json["billtoaddress"],
    contractnumber: json["contractnumber"] == null ? null : json["contractnumber"],
    title: json["title"] == null ? null : json["title"],
    contractlanguage: json["contractlanguage"],
    billingstarton: json["billingstarton"] == null ? null : DateTime.parse(json["billingstarton"]),
    effectivitycalendar: json["effectivitycalendar"] == null ? null : json["effectivitycalendar"],
    billingendon: json["billingendon"] == null ? null : DateTime.parse(json["billingendon"]),
    billingfrequencycode: json["billingfrequencycode"] == null ? null : json["billingfrequencycode"],
    totalprice: json["totalprice"],
    totaldiscount: json["totaldiscount"],
    netprice: json["netprice"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    totaldiscountBase: json["totaldiscountBase"],
    netpriceBase: json["netpriceBase"],
    totalpriceBase: json["totalpriceBase"],
    customerid: json["customerid"] == null ? null : json["customerid"],
    billingcustomerid: json["billingcustomerid"] == null ? null : json["billingcustomerid"],
    customeridtype: json["customeridtype"] == null ? null : json["customeridtype"],
    customeridname: json["customeridname"] == null ? null : json["customeridname"],
    billingcustomeridname: json["billingcustomeridname"] == null ? null : json["billingcustomeridname"],
    customeridyominame: json["customeridyominame"] == null ? null : json["customeridyominame"],
    billingcustomeridyominame: json["billingcustomeridyominame"] == null ? null : json["billingcustomeridyominame"],
    entityimageid: json["entityimageid"],
    gs2EAncienneavancesurconsommation: json["gs2eAncienneavancesurconsommation"],
    gs2EAncienneavancesurconsommationBase: json["gs2eAncienneavancesurconsommationBase"],
    gs2EAscspecialedo: json["gs2eAscspecialedo"] == null ? null : json["gs2eAscspecialedo"],
    gs2EAvenantdo: json["gs2eAvenantdo"] == null ? null : json["gs2eAvenantdo"],
    gs2EBascule5Ago: json["gs2eBascule5ago"],
    gs2EClassificationsouscripteurgo: json["gs2eClassificationsouscripteurgo"] == null ? null : json["gs2eClassificationsouscripteurgo"],
    gs2ECntIssuBranchementabonnementdo: json["gs2eCntIssuBranchementabonnementdo"] == null ? null : json["gs2eCntIssuBranchementabonnementdo"],
    gs2ECntIssuMutationdo: json["gs2eCntIssuMutationdo"] == null ? null : json["gs2eCntIssuMutationdo"],
    gs2ECodetarif: json["gs2eCodetarif"] == null ? null : json["gs2eCodetarif"],
    gs2ECodetarifgo: json["gs2eCodetarifgo"] == null ? null : json["gs2eCodetarifgo"],
    gs2ECoefficientPenaliteMauvaisFacteurps: json["gs2eCoefficientPenaliteMauvaisFacteurps"],
    gs2ECoefficientPenalitedepassementps: json["gs2eCoefficientPenalitedepassementps"],
    gs2ECoefficientperte: json["gs2eCoefficientperte"],
    gs2ECoefficientperteavide: json["gs2eCoefficientperteavide"],
    gs2ECoefficientperteencharge: json["gs2eCoefficientperteencharge"],
    gs2ECoefficientpuissancesollicitephjour: json["gs2eCoefficientpuissancesollicitephjour"],
    gs2ECoefficientpuissancesollicitephnuit: json["gs2eCoefficientpuissancesollicitephnuit"],
    gs2ECoefficientpuissancesollicitephpointe: json["gs2eCoefficientpuissancesollicitephpointe"],
    gs2EDateBasculement: json["gs2eDateBasculement"],
    gs2EDateModificationContrat: json["gs2eDateModificationContrat"],
    gs2EDatedebutsuspension: json["gs2eDatedebutsuspension"],
    gs2EDatedecomptabilisation: json["gs2eDatedecomptabilisation"],
    gs2EDatedecomptabilisationresilie: json["gs2eDatedecomptabilisationresilie"],
    gs2EDatedemarlocationautremateriel: json["gs2eDatedemarlocationautremateriel"],
    gs2EDatedemarlocationtfo: json["gs2eDatedemarlocationtfo"],
    gs2EDateeffetquota: json["gs2eDateeffetquota"],
    gs2EDatefinquota: json["gs2eDatefinquota"],
    gs2EDatefinsuspension: json["gs2eDatefinsuspension"],
    gs2EDatemodificationstatut: json["gs2eDatemodificationstatut"],
    gs2EExonerationentretientcelluleetcable: json["gs2eExonerationentretientcelluleetcable"] == null ? null : json["gs2eExonerationentretientcelluleetcable"],
    gs2EExonerationlocationautremateriel: json["gs2eExonerationlocationautremateriel"] == null ? null : json["gs2eExonerationlocationautremateriel"],
    gs2EExonerationlocationtfo: json["gs2eExonerationlocationtfo"] == null ? null : json["gs2eExonerationlocationtfo"],
    gs2EGratuiteApplicable: json["gs2eGratuiteApplicable"] == null ? null : json["gs2eGratuiteApplicable"],
    gs2EMaraichere: json["gs2eMaraichere"],
    gs2EMontantAscSpeciale: json["gs2eMontantAscSpeciale"],
    gs2EMontantAscSpecialeBase: json["gs2eMontantAscSpecialeBase"],
    gs2ENaturecommercialego: json["gs2eNaturecommercialego"],
    gs2ENbreheureutilisation: json["gs2eNbreheureutilisation"],
    gs2ENombremoisdelocationtfo: json["gs2eNombremoisdelocationtfo"],
    gs2EPrixmoisentretientcelluleetcable: json["gs2ePrixmoisentretientcelluleetcable"],
    gs2EPrixmoisentretientcelluleetcableBase: json["gs2ePrixmoisentretientcelluleetcableBase"],
    gs2EPrixmoislocationautremateriel: json["gs2ePrixmoislocationautremateriel"],
    gs2EPrixmoislocationautrematerielBase: json["gs2ePrixmoislocationautrematerielBase"],
    gs2EPrixmoislocationtfo: json["gs2ePrixmoislocationtfo"],
    gs2EPrixmoislocationtfoBase: json["gs2ePrixmoislocationtfoBase"],
    gs2ESoldedetoutcompte: json["gs2eSoldedetoutcompte"],
    gs2ESoldedetoutcompteBase: json["gs2eSoldedetoutcompteBase"],
    gs2ESoldedetoutcomptecrediteur: json["gs2eSoldedetoutcomptecrediteur"],
    gs2ESoldedetoutcomptecrediteurBase: json["gs2eSoldedetoutcomptecrediteurBase"],
    gs2EStatutrecouvrementgo: json["gs2eStatutrecouvrementgo"],
    gs2ETransformateurenlocation: json["gs2eTransformateurenlocation"] == null ? null : json["gs2eTransformateurenlocation"],
    gs2ETypeOuverture: json["gs2eTypeOuverture"],
    gs2ETypeSimulationDo: json["gs2eTypeSimulationDo"],
    gs2ETypeValue: json["gs2eTypeValue"],
    gs2ETypecontratgo: json["gs2eTypecontratgo"] == null ? null : json["gs2eTypecontratgo"],
    gs2ETypedesubventionpromotiongo: json["gs2eTypedesubventionpromotiongo"],
    jfaAccordpourmiseenservice: json["jfaAccordpourmiseenservice"] == null ? null : json["jfaAccordpourmiseenservice"],
    jfaAvancesurconsommation: json["jfaAvancesurconsommation"] == null ? null : json["jfaAvancesurconsommation"],
    jfaAvancesurconsommationBase: json["jfaAvancesurconsommationBase"] == null ? null : json["jfaAvancesurconsommationBase"],
    jfaContratsigne: json["jfaContratsigne"] == null ? null : json["jfaContratsigne"],
    jfaDateabonnement: json["jfaDateabonnement"] == null ? null : DateTime.parse(json["jfaDateabonnement"]),
    jfaDatedesignature: json["jfaDatedesignature"],
    jfaDateeffet: json["jfaDateeffet"] == null ? null : DateTime.parse(json["jfaDateeffet"]),
    jfaDateremboursement: json["jfaDateremboursement"],
    jfaDateresiliation: json["jfaDateresiliation"],
    jfaIndicateuraccord: json["jfaIndicateuraccord"] == null ? null : json["jfaIndicateuraccord"],
    jfaPftemporaire: json["jfaPftemporaire"] == null ? null : json["jfaPftemporaire"],
    jfaReferenceanciensysteme: json["jfaReferenceanciensysteme"] == null ? null : json["jfaReferenceanciensysteme"],
    jfaReferencecontrat: json["jfaReferencecontrat"] == null ? null : json["jfaReferencecontrat"],
    jfaStatutsaphir: json["jfaStatutsaphir"] == null ? null : json["jfaStatutsaphir"],
    jfaValidationhierarchiquedemandee: json["jfaValidationhierarchiquedemandee"] == null ? null : json["jfaValidationhierarchiquedemandee"],
    jfaValideparhierarchie: json["jfaValideparhierarchie"] == null ? null : json["jfaValideparhierarchie"],
    jfaVersion: json["jfaVersion"] == null ? null : json["jfaVersion"],
    gs2EBranchementabonnementid: json["gs2eBranchementabonnementid"],
    gs2EContratdegreve: json["gs2eContratdegreve"],
    gs2EDureeannuellecontractuelleid: json["gs2eDureeannuellecontractuelleid"],
    gs2ELotcampagnerenouvellementid: json["gs2eLotcampagnerenouvellementid"],
    gs2EModeledecontratclientid: json["gs2eModeledecontratclientid"] == null ? null : json["gs2eModeledecontratclientid"],
    gs2ERegimedetarificationid: json["gs2eRegimedetarificationid"],
    gs2EDiametrecompteurid: json["gs2eDiametrecompteurid"] == null ? null : json["gs2eDiametrecompteurid"],
    gs2EPuissancesouscritephjour: json["gs2ePuissancesouscritephjour"],
    gs2EPuissancesouscritephnuit: json["gs2ePuissancesouscritephnuit"],
    gs2EPuissancesouscritephpointe: json["gs2ePuissancesouscritephpointe"],
    jfaPointdefourniture: json["jfaPointdefourniture"] == null ? null : json["jfaPointdefourniture"],
    jfaBrancheactivite: json["jfaBrancheactivite"] == null ? null : json["jfaBrancheactivite"],
    jfaPuissancesouscrite: json["jfaPuissancesouscrite"],
    jfaReglagedisjoncteur: json["jfaReglagedisjoncteur"],
    jfaSecteuractivite: json["jfaSecteuractivite"] == null ? null : json["jfaSecteuractivite"],
    jfaUsage: json["jfaUsage"] == null ? null : json["jfaUsage"],
    gs2EFraisDeRecouvrement: json["gs2eFraisDeRecouvrement"] == null ? null : json["gs2eFraisDeRecouvrement"],
    gs2EContratsuspenduid: json["gs2eContratsuspenduid"],
    gs2EEncoursdemodification: json["gs2eEncoursdemodification"],
    gs2ESegmentid: json["gs2eSegmentid"],
    gs2ESoussegmentid: json["gs2eSoussegmentid"],
    contractid: json["contractid"] == null ? null : json["contractid"],
    originatingcontract: json["originatingcontract"],
    gs2ECategorieclientid: json["gs2eCategorieclientid"] == null ? null : json["gs2eCategorieclientid"],
    gs2EDemandebranchementid: json["gs2eDemandebranchementid"],
    gs2ETypedecontratautoriseid: json["gs2eTypedecontratautoriseid"] == null ? null : json["gs2eTypedecontratautoriseid"],
    gs2ECategorieContractuelleComptaid: json["gs2eCategorieContractuelleComptaid"],
    gs2EConventionfacturationid: json["gs2eConventionfacturationid"] == null ? null : json["gs2eConventionfacturationid"],
    gs2EConventionregroupementid: json["gs2eConventionregroupementid"],
    jfaUodestination: json["jfaUodestination"] == null ? null : json["jfaUodestination"],
    jfaContratdirecteur: json["jfaContratdirecteur"] == null ? null : json["jfaContratdirecteur"],
    jfaCategoriecontractuelle: json["jfaCategoriecontractuelle"] == null ? null : json["jfaCategoriecontractuelle"],
    jfaProduit: json["jfaProduit"] == null ? null : json["jfaProduit"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "contracttemplateid": contracttemplateid == null ? null : contracttemplateid,
    "contractservicelevelcode": contractservicelevelcode == null ? null : contractservicelevelcode,
    "serviceaddress": serviceaddress,
    "billtoaddress": billtoaddress,
    "contractnumber": contractnumber == null ? null : contractnumber,
    "title": title == null ? null : title,
    "contractlanguage": contractlanguage,
    "billingstarton": billingstarton == null ? null : billingstarton.toIso8601String(),
    "effectivitycalendar": effectivitycalendar == null ? null : effectivitycalendar,
    "billingendon": billingendon == null ? null : billingendon.toIso8601String(),
    "billingfrequencycode": billingfrequencycode == null ? null : billingfrequencycode,
    "totalprice": totalprice,
    "totaldiscount": totaldiscount,
    "netprice": netprice,
    "statuscode": statuscode == null ? null : statuscode,
    "totaldiscountBase": totaldiscountBase,
    "netpriceBase": netpriceBase,
    "totalpriceBase": totalpriceBase,
    "customerid": customerid == null ? null : customerid,
    "billingcustomerid": billingcustomerid == null ? null : billingcustomerid,
    "customeridtype": customeridtype == null ? null : customeridtype,
    "customeridname": customeridname == null ? null : customeridname,
    "billingcustomeridname": billingcustomeridname == null ? null : billingcustomeridname,
    "customeridyominame": customeridyominame == null ? null : customeridyominame,
    "billingcustomeridyominame": billingcustomeridyominame == null ? null : billingcustomeridyominame,
    "entityimageid": entityimageid,
    "gs2eAncienneavancesurconsommation": gs2EAncienneavancesurconsommation,
    "gs2eAncienneavancesurconsommationBase": gs2EAncienneavancesurconsommationBase,
    "gs2eAscspecialedo": gs2EAscspecialedo == null ? null : gs2EAscspecialedo,
    "gs2eAvenantdo": gs2EAvenantdo == null ? null : gs2EAvenantdo,
    "gs2eBascule5ago": gs2EBascule5Ago,
    "gs2eClassificationsouscripteurgo": gs2EClassificationsouscripteurgo == null ? null : gs2EClassificationsouscripteurgo,
    "gs2eCntIssuBranchementabonnementdo": gs2ECntIssuBranchementabonnementdo == null ? null : gs2ECntIssuBranchementabonnementdo,
    "gs2eCntIssuMutationdo": gs2ECntIssuMutationdo == null ? null : gs2ECntIssuMutationdo,
    "gs2eCodetarif": gs2ECodetarif == null ? null : gs2ECodetarif,
    "gs2eCodetarifgo": gs2ECodetarifgo == null ? null : gs2ECodetarifgo,
    "gs2eCoefficientPenaliteMauvaisFacteurps": gs2ECoefficientPenaliteMauvaisFacteurps,
    "gs2eCoefficientPenalitedepassementps": gs2ECoefficientPenalitedepassementps,
    "gs2eCoefficientperte": gs2ECoefficientperte,
    "gs2eCoefficientperteavide": gs2ECoefficientperteavide,
    "gs2eCoefficientperteencharge": gs2ECoefficientperteencharge,
    "gs2eCoefficientpuissancesollicitephjour": gs2ECoefficientpuissancesollicitephjour,
    "gs2eCoefficientpuissancesollicitephnuit": gs2ECoefficientpuissancesollicitephnuit,
    "gs2eCoefficientpuissancesollicitephpointe": gs2ECoefficientpuissancesollicitephpointe,
    "gs2eDateBasculement": gs2EDateBasculement,
    "gs2eDateModificationContrat": gs2EDateModificationContrat,
    "gs2eDatedebutsuspension": gs2EDatedebutsuspension,
    "gs2eDatedecomptabilisation": gs2EDatedecomptabilisation,
    "gs2eDatedecomptabilisationresilie": gs2EDatedecomptabilisationresilie,
    "gs2eDatedemarlocationautremateriel": gs2EDatedemarlocationautremateriel,
    "gs2eDatedemarlocationtfo": gs2EDatedemarlocationtfo,
    "gs2eDateeffetquota": gs2EDateeffetquota,
    "gs2eDatefinquota": gs2EDatefinquota,
    "gs2eDatefinsuspension": gs2EDatefinsuspension,
    "gs2eDatemodificationstatut": gs2EDatemodificationstatut,
    "gs2eExonerationentretientcelluleetcable": gs2EExonerationentretientcelluleetcable == null ? null : gs2EExonerationentretientcelluleetcable,
    "gs2eExonerationlocationautremateriel": gs2EExonerationlocationautremateriel == null ? null : gs2EExonerationlocationautremateriel,
    "gs2eExonerationlocationtfo": gs2EExonerationlocationtfo == null ? null : gs2EExonerationlocationtfo,
    "gs2eGratuiteApplicable": gs2EGratuiteApplicable == null ? null : gs2EGratuiteApplicable,
    "gs2eMaraichere": gs2EMaraichere,
    "gs2eMontantAscSpeciale": gs2EMontantAscSpeciale,
    "gs2eMontantAscSpecialeBase": gs2EMontantAscSpecialeBase,
    "gs2eNaturecommercialego": gs2ENaturecommercialego,
    "gs2eNbreheureutilisation": gs2ENbreheureutilisation,
    "gs2eNombremoisdelocationtfo": gs2ENombremoisdelocationtfo,
    "gs2ePrixmoisentretientcelluleetcable": gs2EPrixmoisentretientcelluleetcable,
    "gs2ePrixmoisentretientcelluleetcableBase": gs2EPrixmoisentretientcelluleetcableBase,
    "gs2ePrixmoislocationautremateriel": gs2EPrixmoislocationautremateriel,
    "gs2ePrixmoislocationautrematerielBase": gs2EPrixmoislocationautrematerielBase,
    "gs2ePrixmoislocationtfo": gs2EPrixmoislocationtfo,
    "gs2ePrixmoislocationtfoBase": gs2EPrixmoislocationtfoBase,
    "gs2eSoldedetoutcompte": gs2ESoldedetoutcompte,
    "gs2eSoldedetoutcompteBase": gs2ESoldedetoutcompteBase,
    "gs2eSoldedetoutcomptecrediteur": gs2ESoldedetoutcomptecrediteur,
    "gs2eSoldedetoutcomptecrediteurBase": gs2ESoldedetoutcomptecrediteurBase,
    "gs2eStatutrecouvrementgo": gs2EStatutrecouvrementgo,
    "gs2eTransformateurenlocation": gs2ETransformateurenlocation == null ? null : gs2ETransformateurenlocation,
    "gs2eTypeOuverture": gs2ETypeOuverture,
    "gs2eTypeSimulationDo": gs2ETypeSimulationDo,
    "gs2eTypeValue": gs2ETypeValue,
    "gs2eTypecontratgo": gs2ETypecontratgo == null ? null : gs2ETypecontratgo,
    "gs2eTypedesubventionpromotiongo": gs2ETypedesubventionpromotiongo,
    "jfaAccordpourmiseenservice": jfaAccordpourmiseenservice == null ? null : jfaAccordpourmiseenservice,
    "jfaAvancesurconsommation": jfaAvancesurconsommation == null ? null : jfaAvancesurconsommation,
    "jfaAvancesurconsommationBase": jfaAvancesurconsommationBase == null ? null : jfaAvancesurconsommationBase,
    "jfaContratsigne": jfaContratsigne == null ? null : jfaContratsigne,
    "jfaDateabonnement": jfaDateabonnement == null ? null : jfaDateabonnement.toIso8601String(),
    "jfaDatedesignature": jfaDatedesignature,
    "jfaDateeffet": jfaDateeffet == null ? null : jfaDateeffet.toIso8601String(),
    "jfaDateremboursement": jfaDateremboursement,
    "jfaDateresiliation": jfaDateresiliation,
    "jfaIndicateuraccord": jfaIndicateuraccord == null ? null : jfaIndicateuraccord,
    "jfaPftemporaire": jfaPftemporaire == null ? null : jfaPftemporaire,
    "jfaReferenceanciensysteme": jfaReferenceanciensysteme == null ? null : jfaReferenceanciensysteme,
    "jfaReferencecontrat": jfaReferencecontrat == null ? null : jfaReferencecontrat,
    "jfaStatutsaphir": jfaStatutsaphir == null ? null : jfaStatutsaphir,
    "jfaValidationhierarchiquedemandee": jfaValidationhierarchiquedemandee == null ? null : jfaValidationhierarchiquedemandee,
    "jfaValideparhierarchie": jfaValideparhierarchie == null ? null : jfaValideparhierarchie,
    "jfaVersion": jfaVersion == null ? null : jfaVersion,
    "gs2eBranchementabonnementid": gs2EBranchementabonnementid,
    "gs2eContratdegreve": gs2EContratdegreve,
    "gs2eDureeannuellecontractuelleid": gs2EDureeannuellecontractuelleid,
    "gs2eLotcampagnerenouvellementid": gs2ELotcampagnerenouvellementid,
    "gs2eModeledecontratclientid": gs2EModeledecontratclientid == null ? null : gs2EModeledecontratclientid,
    "gs2eRegimedetarificationid": gs2ERegimedetarificationid,
    "gs2eDiametrecompteurid": gs2EDiametrecompteurid == null ? null : gs2EDiametrecompteurid,
    "gs2ePuissancesouscritephjour": gs2EPuissancesouscritephjour,
    "gs2ePuissancesouscritephnuit": gs2EPuissancesouscritephnuit,
    "gs2ePuissancesouscritephpointe": gs2EPuissancesouscritephpointe,
    "jfaPointdefourniture": jfaPointdefourniture == null ? null : jfaPointdefourniture,
    "jfaBrancheactivite": jfaBrancheactivite == null ? null : jfaBrancheactivite,
    "jfaPuissancesouscrite": jfaPuissancesouscrite,
    "jfaReglagedisjoncteur": jfaReglagedisjoncteur,
    "jfaSecteuractivite": jfaSecteuractivite == null ? null : jfaSecteuractivite,
    "jfaUsage": jfaUsage == null ? null : jfaUsage,
    "gs2eFraisDeRecouvrement": gs2EFraisDeRecouvrement == null ? null : gs2EFraisDeRecouvrement,
    "gs2eContratsuspenduid": gs2EContratsuspenduid,
    "gs2eEncoursdemodification": gs2EEncoursdemodification,
    "gs2eSegmentid": gs2ESegmentid,
    "gs2eSoussegmentid": gs2ESoussegmentid,
    "contractid": contractid == null ? null : contractid,
    "originatingcontract": originatingcontract,
    "gs2eCategorieclientid": gs2ECategorieclientid == null ? null : gs2ECategorieclientid,
    "gs2eDemandebranchementid": gs2EDemandebranchementid,
    "gs2eTypedecontratautoriseid": gs2ETypedecontratautoriseid == null ? null : gs2ETypedecontratautoriseid,
    "gs2eCategorieContractuelleComptaid": gs2ECategorieContractuelleComptaid,
    "gs2eConventionfacturationid": gs2EConventionfacturationid == null ? null : gs2EConventionfacturationid,
    "gs2eConventionregroupementid": gs2EConventionregroupementid,
    "jfaUodestination": jfaUodestination == null ? null : jfaUodestination,
    "jfaContratdirecteur": jfaContratdirecteur == null ? null : jfaContratdirecteur,
    "jfaCategoriecontractuelle": jfaCategoriecontractuelle == null ? null : jfaCategoriecontractuelle,
    "jfaProduit": jfaProduit == null ? null : jfaProduit,
  };
}