import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Gs2EDemandebranchementabonnementbase extends ToJsonInterface {
  String context;
  String id;
  String type;
  int statuscode;
  String gs2ENumerodemande;
  bool gs2EAlertedo;
  bool gs2EAppliquerairsido;
  bool gs2EAppliquerlagratuitedo;
  bool gs2EAppliquertvado;
  bool gs2EAscspecialePourMajContratdo;
  int gs2EAutorisationdiffererreglementfraisgo;
  bool gs2EBranchementeligiblesubventiondo;
  dynamic gs2ECarateristiquealimentationgo;
  int gs2EClassificationdusouscripteurgo;
  bool gs2EClientdebiteurdo;
  String gs2ECodesystemeduproduit;
  String gs2ECodesystemeduproduitdirige;
  bool gs2ECoffretcahorsdo;
  String transactioncurrencyid;
  String exchangerate;
  bool gs2ECreationlistebeneficiairedo;
  DateTime gs2EDaterdvmetre;
  DateTime gs2EDateretraitdevis;
  bool gs2EDcevalidationrequisedo;
  bool gs2EDretatvalidationdo;
  int gs2EEtapeactuellego;
  int gs2EEtapesuivantego;
  bool gs2EEtatrealisationdevisextensiondo;
  bool gs2EEtatrealisationdevistravauxdo;
  bool gs2EExonrationentretiencelluleetcabledo;
  bool gs2EExonrationlocationautrematriel;
  bool gs2EExonrationlocationtfogo;
  bool gs2EFactureascechelonnabledo;
  bool gs2EFacturedevisechelonnabledo;
  bool gs2EFacturedroitdesuiteechelonnabledo;
  bool gs2EFactureparticipationhtechelonnabledo;
  bool gs2EFacturesouscriptionechelonnabledo;
  bool gs2EFintravauxnecessairedo;
  dynamic gs2EIlot;
  dynamic gs2ELot;
  int gs2EMetrefacturablego;
  bool gs2EModedistributionadomiciledo;
  bool gs2EModedistributioncahiertransmissiondo;
  bool gs2EModedistributionemaildo;
  bool gs2EModedistributionvoiepostaledo;
  int gs2EModereglementfactures;
  int gs2EMotifdedemandego;
  int gs2EMotifdentreeenstockgo;
  bool gs2ENotificationemissionfacturesdo;
  String gs2EOrganisationencours;
  String gs2EParamAscSpecial;
  int gs2EParamGenererFraisEchelonnement;
  String gs2EReferenceduclient;
  bool gs2ERegroupedo;
  int gs2ERegroupego;
  bool gs2ESecteurenzoneassaisiniedo;
  int gs2EStatutdemandego;
  int gs2EStatutdocumentsgo;
  String gs2ETauxcoeffeloignement;
  String gs2ETauxinteret;
  bool gs2ETransformateurenlocationdo;
  bool gs2EValidationregroupementnecessairedo;
  bool gs2EValidationuniquemetredevisdo;
  bool gs2EReprisesaisiecrido;
  bool gs2EReprisesaisiedevisdo;
  bool gs2EProvenanceEagencedo;
  String gs2ENumerodemandeEagence;
  String gs2EDemandebranchementabonnementid;
  dynamic gs2ESecteuractiviteid;
  String gs2ECategoriecontractuelleid;
  String gs2EUsageid;
  String gs2EProduitdirigeid;
  String gs2EProduitid;
  String gs2EComptedemessagerieid;
  String gs2eDemandeabonnementid;
  String gs2EBranchedactiviteid;
  String gs2EUodedestinationid;
  String gs2EClientid;
  String gs2EMandataireid;
  String gs2EDecoupagegeographiqueid;
  dynamic gs2ENiveaudecoupageid;
  String gs2ETypecontrattravauxid;
  String gs2ECategorieclientid;
  String gs2EModelecontratid;
  String gs2EModeledecontratdirigeid;
  String gs2ETypecomptageid;
  String gs2ETypecontratid;
  dynamic gs2EModecommunicationgo;
  dynamic gs2EDecisionclientgo;
  String gs2EComplementdadresse;

  Gs2EDemandebranchementabonnementbase({
    this.context,
    this.id,
    this.type,
    this.statuscode,
    this.gs2ENumerodemande,
    this.gs2EAlertedo,
    this.gs2EAppliquerairsido,
    this.gs2EAppliquerlagratuitedo,
    this.gs2EAppliquertvado,
    this.gs2EAscspecialePourMajContratdo,
    this.gs2EAutorisationdiffererreglementfraisgo,
    this.gs2EBranchementeligiblesubventiondo,
    this.gs2ECarateristiquealimentationgo,
    this.gs2EClassificationdusouscripteurgo,
    this.gs2EClientdebiteurdo,
    this.gs2ECodesystemeduproduit,
    this.gs2ECodesystemeduproduitdirige,
    this.gs2ECoffretcahorsdo,
    this.transactioncurrencyid,
    this.exchangerate,
    this.gs2ECreationlistebeneficiairedo,
    this.gs2EDaterdvmetre,
    this.gs2EDateretraitdevis,
    this.gs2EDcevalidationrequisedo,
    this.gs2EDretatvalidationdo,
    this.gs2EEtapeactuellego,
    this.gs2EEtapesuivantego,
    this.gs2EEtatrealisationdevisextensiondo,
    this.gs2EEtatrealisationdevistravauxdo,
    this.gs2EExonrationentretiencelluleetcabledo,
    this.gs2EExonrationlocationautrematriel,
    this.gs2EExonrationlocationtfogo,
    this.gs2EFactureascechelonnabledo,
    this.gs2EFacturedevisechelonnabledo,
    this.gs2EFacturedroitdesuiteechelonnabledo,
    this.gs2EFactureparticipationhtechelonnabledo,
    this.gs2EFacturesouscriptionechelonnabledo,
    this.gs2EFintravauxnecessairedo,
    this.gs2EIlot,
    this.gs2ELot,
    this.gs2EMetrefacturablego,
    this.gs2EModedistributionadomiciledo,
    this.gs2EModedistributioncahiertransmissiondo,
    this.gs2EModedistributionemaildo,
    this.gs2EModedistributionvoiepostaledo,
    this.gs2eDemandeabonnementid,
    this.gs2EModereglementfactures,
    this.gs2EMotifdedemandego,
    this.gs2EMotifdentreeenstockgo,
    this.gs2ENotificationemissionfacturesdo,
    this.gs2EOrganisationencours,
    this.gs2EParamAscSpecial,
    this.gs2EParamGenererFraisEchelonnement,
    this.gs2EReferenceduclient,
    this.gs2ERegroupedo,
    this.gs2ERegroupego,
    this.gs2ESecteurenzoneassaisiniedo,
    this.gs2EStatutdemandego,
    this.gs2EStatutdocumentsgo,
    this.gs2ETauxcoeffeloignement,
    this.gs2ETauxinteret,
    this.gs2ETransformateurenlocationdo,
    this.gs2EValidationregroupementnecessairedo,
    this.gs2EValidationuniquemetredevisdo,
    this.gs2EReprisesaisiecrido,
    this.gs2EReprisesaisiedevisdo,
    this.gs2EProvenanceEagencedo,
    this.gs2ENumerodemandeEagence,
    this.gs2EDemandebranchementabonnementid,
    this.gs2ESecteuractiviteid,
    this.gs2ECategoriecontractuelleid,
    this.gs2EUsageid,
    this.gs2EProduitdirigeid,
    this.gs2EProduitid,
    this.gs2EComptedemessagerieid,
    this.gs2EBranchedactiviteid,
    this.gs2EUodedestinationid,
    this.gs2EClientid,
    this.gs2EMandataireid,
    this.gs2EDecoupagegeographiqueid,
    this.gs2ENiveaudecoupageid,
    this.gs2ETypecontrattravauxid,
    this.gs2ECategorieclientid,
    this.gs2EModelecontratid,
    this.gs2EModeledecontratdirigeid,
    this.gs2ETypecomptageid,
    this.gs2ETypecontratid,
    this.gs2EModecommunicationgo,
    this.gs2EDecisionclientgo,
    this.gs2EComplementdadresse,
  });

  factory Gs2EDemandebranchementabonnementbase.fromJson(Map<String, dynamic> json) => Gs2EDemandebranchementabonnementbase(
    context: json["@context"] == null ? null : json["@context"],
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    gs2ENumerodemande: json["gs2eNumerodemande"] == null ? null : json["gs2eNumerodemande"],
    gs2EAlertedo: json["gs2eAlertedo"] == null ? null : json["gs2eAlertedo"],
    gs2eDemandeabonnementid: json["gs2eDemandeabonnementid"] == null ? null : json["gs2eDemandeabonnementid"],
    gs2EAppliquerairsido: json["gs2eAppliquerairsido"] == null ? null : json["gs2eAppliquerairsido"],
    gs2EAppliquerlagratuitedo: json["gs2eAppliquerlagratuitedo"] == null ? null : json["gs2eAppliquerlagratuitedo"],
    gs2EAppliquertvado: json["gs2eAppliquertvado"] == null ? null : json["gs2eAppliquertvado"],
    gs2EAscspecialePourMajContratdo: json["gs2eAscspecialePourMajContratdo"] == null ? null : json["gs2eAscspecialePourMajContratdo"],
    gs2EAutorisationdiffererreglementfraisgo: json["gs2eAutorisationdiffererreglementfraisgo"] == null ? null : json["gs2eAutorisationdiffererreglementfraisgo"],
    gs2EBranchementeligiblesubventiondo: json["gs2eBranchementeligiblesubventiondo"] == null ? null : json["gs2eBranchementeligiblesubventiondo"],
    gs2ECarateristiquealimentationgo: json["gs2eCarateristiquealimentationgo"],
    gs2EClassificationdusouscripteurgo: json["gs2eClassificationdusouscripteurgo"] == null ? null : json["gs2eClassificationdusouscripteurgo"],
    gs2EClientdebiteurdo: json["gs2eClientdebiteurdo"] == null ? null : json["gs2eClientdebiteurdo"],
    gs2ECodesystemeduproduit: json["gs2eCodesystemeduproduit"] == null ? null : json["gs2eCodesystemeduproduit"],
    gs2ECodesystemeduproduitdirige: json["gs2eCodesystemeduproduitdirige"] == null ? null : json["gs2eCodesystemeduproduitdirige"],
    gs2ECoffretcahorsdo: json["gs2eCoffretcahorsdo"] == null ? null : json["gs2eCoffretcahorsdo"],
    transactioncurrencyid: json["transactioncurrencyid"] == null ? null : json["transactioncurrencyid"],
    exchangerate: json["exchangerate"] == null ? null : json["exchangerate"],
    gs2ECreationlistebeneficiairedo: json["gs2eCreationlistebeneficiairedo"] == null ? null : json["gs2eCreationlistebeneficiairedo"],
    gs2EDaterdvmetre: json["gs2eDaterdvmetre"] == null ? null : DateTime.parse(json["gs2eDaterdvmetre"]),
    gs2EDateretraitdevis: json["gs2eDateretraitdevis"] == null ? null : DateTime.parse(json["gs2eDateretraitdevis"]),
    gs2EDcevalidationrequisedo: json["gs2eDcevalidationrequisedo"] == null ? null : json["gs2eDcevalidationrequisedo"],
    gs2EDretatvalidationdo: json["gs2eDretatvalidationdo"] == null ? null : json["gs2eDretatvalidationdo"],
    gs2EEtapeactuellego: json["gs2eEtapeactuellego"] == null ? null : json["gs2eEtapeactuellego"],
    gs2EEtapesuivantego: json["gs2eEtapesuivantego"] == null ? null : json["gs2eEtapesuivantego"],
    gs2EEtatrealisationdevisextensiondo: json["gs2eEtatrealisationdevisextensiondo"] == null ? null : json["gs2eEtatrealisationdevisextensiondo"],
    gs2EEtatrealisationdevistravauxdo: json["gs2eEtatrealisationdevistravauxdo"] == null ? null : json["gs2eEtatrealisationdevistravauxdo"],
    gs2EExonrationentretiencelluleetcabledo: json["gs2eExonrationentretiencelluleetcabledo"] == null ? null : json["gs2eExonrationentretiencelluleetcabledo"],
    gs2EExonrationlocationautrematriel: json["gs2eExonrationlocationautrematriel"] == null ? null : json["gs2eExonrationlocationautrematriel"],
    gs2EExonrationlocationtfogo: json["gs2eExonrationlocationtfogo"] == null ? null : json["gs2eExonrationlocationtfogo"],
    gs2EFactureascechelonnabledo: json["gs2eFactureascechelonnabledo"] == null ? null : json["gs2eFactureascechelonnabledo"],
    gs2EFacturedevisechelonnabledo: json["gs2eFacturedevisechelonnabledo"] == null ? null : json["gs2eFacturedevisechelonnabledo"],
    gs2EFacturedroitdesuiteechelonnabledo: json["gs2eFacturedroitdesuiteechelonnabledo"] == null ? null : json["gs2eFacturedroitdesuiteechelonnabledo"],
    gs2EFactureparticipationhtechelonnabledo: json["gs2eFactureparticipationhtechelonnabledo"] == null ? null : json["gs2eFactureparticipationhtechelonnabledo"],
    gs2EFacturesouscriptionechelonnabledo: json["gs2eFacturesouscriptionechelonnabledo"] == null ? null : json["gs2eFacturesouscriptionechelonnabledo"],
    gs2EFintravauxnecessairedo: json["gs2eFintravauxnecessairedo"] == null ? null : json["gs2eFintravauxnecessairedo"],
    gs2EIlot: json["gs2eIlot"],
    gs2ELot: json["gs2eLot"],
    gs2EMetrefacturablego: json["gs2eMetrefacturablego"] == null ? null : json["gs2eMetrefacturablego"],
    gs2EModedistributionadomiciledo: json["gs2eModedistributionadomiciledo"] == null ? null : json["gs2eModedistributionadomiciledo"],
    gs2EModedistributioncahiertransmissiondo: json["gs2eModedistributioncahiertransmissiondo"] == null ? null : json["gs2eModedistributioncahiertransmissiondo"],
    gs2EModedistributionemaildo: json["gs2eModedistributionemaildo"] == null ? null : json["gs2eModedistributionemaildo"],
    gs2EModedistributionvoiepostaledo: json["gs2eModedistributionvoiepostaledo"] == null ? null : json["gs2eModedistributionvoiepostaledo"],
    gs2EModereglementfactures: json["gs2eModereglementfactures"] == null ? null : json["gs2eModereglementfactures"],
    gs2EMotifdedemandego: json["gs2eMotifdedemandego"] == null ? null : json["gs2eMotifdedemandego"],
    gs2EMotifdentreeenstockgo: json["gs2eMotifdentreeenstockgo"] == null ? null : json["gs2eMotifdentreeenstockgo"],
    gs2ENotificationemissionfacturesdo: json["gs2eNotificationemissionfacturesdo"] == null ? null : json["gs2eNotificationemissionfacturesdo"],
    gs2EOrganisationencours: json["gs2eOrganisationencours"] == null ? null : json["gs2eOrganisationencours"],
    gs2EParamAscSpecial: json["gs2eParamAscSpecial"] == null ? null : json["gs2eParamAscSpecial"],
    gs2EParamGenererFraisEchelonnement: json["gs2eParamGenererFraisEchelonnement"] == null ? null : json["gs2eParamGenererFraisEchelonnement"],
    gs2EReferenceduclient: json["gs2eReferenceduclient"] == null ? null : json["gs2eReferenceduclient"],
    gs2ERegroupedo: json["gs2eRegroupedo"] == null ? null : json["gs2eRegroupedo"],
    gs2ERegroupego: json["gs2eRegroupego"] == null ? null : json["gs2eRegroupego"],
    gs2ESecteurenzoneassaisiniedo: json["gs2eSecteurenzoneassaisiniedo"] == null ? null : json["gs2eSecteurenzoneassaisiniedo"],
    gs2EStatutdemandego: json["gs2eStatutdemandego"] == null ? null : json["gs2eStatutdemandego"],
    gs2EStatutdocumentsgo: json["gs2eStatutdocumentsgo"] == null ? null : json["gs2eStatutdocumentsgo"],
    gs2ETauxcoeffeloignement: json["gs2eTauxcoeffeloignement"] == null ? null : json["gs2eTauxcoeffeloignement"],
    gs2ETauxinteret: json["gs2eTauxinteret"] == null ? null : json["gs2eTauxinteret"],
    gs2ETransformateurenlocationdo: json["gs2eTransformateurenlocationdo"] == null ? null : json["gs2eTransformateurenlocationdo"],
    gs2EValidationregroupementnecessairedo: json["gs2eValidationregroupementnecessairedo"] == null ? null : json["gs2eValidationregroupementnecessairedo"],
    gs2EValidationuniquemetredevisdo: json["gs2eValidationuniquemetredevisdo"] == null ? null : json["gs2eValidationuniquemetredevisdo"],
    gs2EReprisesaisiecrido: json["gs2eReprisesaisiecrido"] == null ? null : json["gs2eReprisesaisiecrido"],
    gs2EReprisesaisiedevisdo: json["gs2eReprisesaisiedevisdo"] == null ? null : json["gs2eReprisesaisiedevisdo"],
    gs2EProvenanceEagencedo: json["gs2eProvenanceEagencedo"] == null ? null : json["gs2eProvenanceEagencedo"],
    gs2ENumerodemandeEagence: json["gs2eNumerodemandeEagence"] == null ? null : json["gs2eNumerodemandeEagence"],
    gs2EDemandebranchementabonnementid: json["gs2eDemandebranchementabonnementid"] == null ? null : json["gs2eDemandebranchementabonnementid"],
    gs2ESecteuractiviteid: json["gs2eSecteuractiviteid"],
    gs2ECategoriecontractuelleid: json["gs2eCategoriecontractuelleid"] == null ? null : json["gs2eCategoriecontractuelleid"],
    gs2EUsageid: json["gs2eUsageid"] == null ? null : json["gs2eUsageid"],
    gs2EProduitdirigeid: json["gs2eProduitdirigeid"] == null ? null : json["gs2eProduitdirigeid"],
    gs2EProduitid: json["gs2eProduitid"] == null ? null : json["gs2eProduitid"],
    gs2EComptedemessagerieid: json["gs2eComptedemessagerieid"] == null ? null : json["gs2eComptedemessagerieid"],
    gs2EBranchedactiviteid: json["gs2eBranchedactiviteid"] == null ? null : json["gs2eBranchedactiviteid"],
    gs2EUodedestinationid: json["gs2eUodedestinationid"] == null ? null : json["gs2eUodedestinationid"],
    gs2EClientid: json["gs2eClientid"] == null ? null : json["gs2eClientid"],
    gs2EMandataireid: json["gs2eMandataireid"] == null ? null : json["gs2eMandataireid"],
    gs2EDecoupagegeographiqueid: json["gs2eDecoupagegeographiqueid"] == null ? null : json["gs2eDecoupagegeographiqueid"],
    gs2ENiveaudecoupageid: json["gs2eNiveaudecoupageid"],
    gs2ETypecontrattravauxid: json["gs2eTypecontrattravauxid"] == null ? null : json["gs2eTypecontrattravauxid"],
    gs2ECategorieclientid: json["gs2eCategorieclientid"] == null ? null : json["gs2eCategorieclientid"],
    gs2EModelecontratid: json["gs2eModelecontratid"] == null ? null : json["gs2eModelecontratid"],
    gs2EModeledecontratdirigeid: json["gs2eModeledecontratdirigeid"] == null ? null : json["gs2eModeledecontratdirigeid"],
    gs2ETypecomptageid: json["gs2eTypecomptageid"] == null ? null : json["gs2eTypecomptageid"],
    gs2ETypecontratid: json["gs2eTypecontratid"] == null ? null : json["gs2eTypecontratid"],
    gs2EModecommunicationgo: json["gs2eModecommunicationgo"],
    gs2EDecisionclientgo: json["gs2eDecisionclientgo"],
    gs2EComplementdadresse: json["gs2eComplementdadresse"] == null ? null : json["gs2eComplementdadresse"],
  );

  Map<String, dynamic> toJson() => {
    "@context": context == null ? null : context,
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "statuscode": statuscode == null ? null : statuscode,
    "gs2eNumerodemande": gs2ENumerodemande == null ? null : gs2ENumerodemande,
    "gs2eAlertedo": gs2EAlertedo == null ? null : gs2EAlertedo,
    "gs2eAppliquerairsido": gs2EAppliquerairsido == null ? null : gs2EAppliquerairsido,
    "gs2eAppliquerlagratuitedo": gs2EAppliquerlagratuitedo == null ? null : gs2EAppliquerlagratuitedo,
    "gs2eAppliquertvado": gs2EAppliquertvado == null ? null : gs2EAppliquertvado,
    "gs2eAscspecialePourMajContratdo": gs2EAscspecialePourMajContratdo == null ? null : gs2EAscspecialePourMajContratdo,
    "gs2eAutorisationdiffererreglementfraisgo": gs2EAutorisationdiffererreglementfraisgo == null ? null : gs2EAutorisationdiffererreglementfraisgo,
    "gs2eBranchementeligiblesubventiondo": gs2EBranchementeligiblesubventiondo == null ? null : gs2EBranchementeligiblesubventiondo,
    "gs2eCarateristiquealimentationgo": gs2ECarateristiquealimentationgo,
    "gs2eClassificationdusouscripteurgo": gs2EClassificationdusouscripteurgo == null ? null : gs2EClassificationdusouscripteurgo,
    "gs2eClientdebiteurdo": gs2EClientdebiteurdo == null ? null : gs2EClientdebiteurdo,
    "gs2eCodesystemeduproduit": gs2ECodesystemeduproduit == null ? null : gs2ECodesystemeduproduit,
    "gs2eCodesystemeduproduitdirige": gs2ECodesystemeduproduitdirige == null ? null : gs2ECodesystemeduproduitdirige,
    "gs2eCoffretcahorsdo": gs2ECoffretcahorsdo == null ? null : gs2ECoffretcahorsdo,
    "transactioncurrencyid": transactioncurrencyid == null ? null : transactioncurrencyid,
    "exchangerate": exchangerate == null ? null : exchangerate,
    "gs2eCreationlistebeneficiairedo": gs2ECreationlistebeneficiairedo == null ? null : gs2ECreationlistebeneficiairedo,
    "gs2eDaterdvmetre": gs2EDaterdvmetre == null ? null : gs2EDaterdvmetre.toIso8601String(),
    "gs2eDateretraitdevis": gs2EDateretraitdevis == null ? null : gs2EDateretraitdevis.toIso8601String(),
    "gs2eDcevalidationrequisedo": gs2EDcevalidationrequisedo == null ? null : gs2EDcevalidationrequisedo,
    "gs2eDretatvalidationdo": gs2EDretatvalidationdo == null ? null : gs2EDretatvalidationdo,
    "gs2eEtapeactuellego": gs2EEtapeactuellego == null ? null : gs2EEtapeactuellego,
    "gs2eEtapesuivantego": gs2EEtapesuivantego == null ? null : gs2EEtapesuivantego,
    "gs2eEtatrealisationdevisextensiondo": gs2EEtatrealisationdevisextensiondo == null ? null : gs2EEtatrealisationdevisextensiondo,
    "gs2eEtatrealisationdevistravauxdo": gs2EEtatrealisationdevistravauxdo == null ? null : gs2EEtatrealisationdevistravauxdo,
    "gs2eExonrationentretiencelluleetcabledo": gs2EExonrationentretiencelluleetcabledo == null ? null : gs2EExonrationentretiencelluleetcabledo,
    "gs2eExonrationlocationautrematriel": gs2EExonrationlocationautrematriel == null ? null : gs2EExonrationlocationautrematriel,
    "gs2eExonrationlocationtfogo": gs2EExonrationlocationtfogo == null ? null : gs2EExonrationlocationtfogo,
    "gs2eFactureascechelonnabledo": gs2EFactureascechelonnabledo == null ? null : gs2EFactureascechelonnabledo,
    "gs2eFacturedevisechelonnabledo": gs2EFacturedevisechelonnabledo == null ? null : gs2EFacturedevisechelonnabledo,
    "gs2eFacturedroitdesuiteechelonnabledo": gs2EFacturedroitdesuiteechelonnabledo == null ? null : gs2EFacturedroitdesuiteechelonnabledo,
    "gs2eFactureparticipationhtechelonnabledo": gs2EFactureparticipationhtechelonnabledo == null ? null : gs2EFactureparticipationhtechelonnabledo,
    "gs2eFacturesouscriptionechelonnabledo": gs2EFacturesouscriptionechelonnabledo == null ? null : gs2EFacturesouscriptionechelonnabledo,
    "gs2eFintravauxnecessairedo": gs2EFintravauxnecessairedo == null ? null : gs2EFintravauxnecessairedo,
    "gs2eDemandeabonnementid": gs2eDemandeabonnementid == null ? null : gs2eDemandeabonnementid,
    "gs2eIlot": gs2EIlot,
    "gs2eLot": gs2ELot,
    "gs2eMetrefacturablego": gs2EMetrefacturablego == null ? null : gs2EMetrefacturablego,
    "gs2eModedistributionadomiciledo": gs2EModedistributionadomiciledo == null ? null : gs2EModedistributionadomiciledo,
    "gs2eModedistributioncahiertransmissiondo": gs2EModedistributioncahiertransmissiondo == null ? null : gs2EModedistributioncahiertransmissiondo,
    "gs2eModedistributionemaildo": gs2EModedistributionemaildo == null ? null : gs2EModedistributionemaildo,
    "gs2eModedistributionvoiepostaledo": gs2EModedistributionvoiepostaledo == null ? null : gs2EModedistributionvoiepostaledo,
    "gs2eModereglementfactures": gs2EModereglementfactures == null ? null : gs2EModereglementfactures,
    "gs2eMotifdedemandego": gs2EMotifdedemandego == null ? null : gs2EMotifdedemandego,
    "gs2eMotifdentreeenstockgo": gs2EMotifdentreeenstockgo == null ? null : gs2EMotifdentreeenstockgo,
    "gs2eNotificationemissionfacturesdo": gs2ENotificationemissionfacturesdo == null ? null : gs2ENotificationemissionfacturesdo,
    "gs2eOrganisationencours": gs2EOrganisationencours == null ? null : gs2EOrganisationencours,
    "gs2eParamAscSpecial": gs2EParamAscSpecial == null ? null : gs2EParamAscSpecial,
    "gs2eParamGenererFraisEchelonnement": gs2EParamGenererFraisEchelonnement == null ? null : gs2EParamGenererFraisEchelonnement,
    "gs2eReferenceduclient": gs2EReferenceduclient == null ? null : gs2EReferenceduclient,
    "gs2eRegroupedo": gs2ERegroupedo == null ? null : gs2ERegroupedo,
    "gs2eRegroupego": gs2ERegroupego == null ? null : gs2ERegroupego,
    "gs2eSecteurenzoneassaisiniedo": gs2ESecteurenzoneassaisiniedo == null ? null : gs2ESecteurenzoneassaisiniedo,
    "gs2eStatutdemandego": gs2EStatutdemandego == null ? null : gs2EStatutdemandego,
    "gs2eStatutdocumentsgo": gs2EStatutdocumentsgo == null ? null : gs2EStatutdocumentsgo,
    "gs2eTauxcoeffeloignement": gs2ETauxcoeffeloignement == null ? null : gs2ETauxcoeffeloignement,
    "gs2eTauxinteret": gs2ETauxinteret == null ? null : gs2ETauxinteret,
    "gs2eTransformateurenlocationdo": gs2ETransformateurenlocationdo == null ? null : gs2ETransformateurenlocationdo,
    "gs2eValidationregroupementnecessairedo": gs2EValidationregroupementnecessairedo == null ? null : gs2EValidationregroupementnecessairedo,
    "gs2eValidationuniquemetredevisdo": gs2EValidationuniquemetredevisdo == null ? null : gs2EValidationuniquemetredevisdo,
    "gs2eReprisesaisiecrido": gs2EReprisesaisiecrido == null ? null : gs2EReprisesaisiecrido,
    "gs2eReprisesaisiedevisdo": gs2EReprisesaisiedevisdo == null ? null : gs2EReprisesaisiedevisdo,
    "gs2eProvenanceEagencedo": gs2EProvenanceEagencedo == null ? null : gs2EProvenanceEagencedo,
    "gs2eNumerodemandeEagence": gs2ENumerodemandeEagence == null ? null : gs2ENumerodemandeEagence,
    "gs2eDemandebranchementabonnementid": gs2EDemandebranchementabonnementid == null ? null : gs2EDemandebranchementabonnementid,
    "gs2eSecteuractiviteid": gs2ESecteuractiviteid,
    "gs2eCategoriecontractuelleid": gs2ECategoriecontractuelleid == null ? null : gs2ECategoriecontractuelleid,
    "gs2eUsageid": gs2EUsageid == null ? null : gs2EUsageid,
    "gs2eProduitdirigeid": gs2EProduitdirigeid == null ? null : gs2EProduitdirigeid,
    "gs2eProduitid": gs2EProduitid == null ? null : gs2EProduitid,
    "gs2eComptedemessagerieid": gs2EComptedemessagerieid == null ? null : gs2EComptedemessagerieid,
    "gs2eBranchedactiviteid": gs2EBranchedactiviteid == null ? null : gs2EBranchedactiviteid,
    "gs2eUodedestinationid": gs2EUodedestinationid == null ? null : gs2EUodedestinationid,
    "gs2eClientid": gs2EClientid == null ? null : gs2EClientid,
    "gs2eMandataireid": gs2EMandataireid == null ? null : gs2EMandataireid,
    "gs2eDecoupagegeographiqueid": gs2EDecoupagegeographiqueid == null ? null : gs2EDecoupagegeographiqueid,
    "gs2eNiveaudecoupageid": gs2ENiveaudecoupageid,
    "gs2eTypecontrattravauxid": gs2ETypecontrattravauxid == null ? null : gs2ETypecontrattravauxid,
    "gs2eCategorieclientid": gs2ECategorieclientid == null ? null : gs2ECategorieclientid,
    "gs2eModelecontratid": gs2EModelecontratid == null ? null : gs2EModelecontratid,
    "gs2eModeledecontratdirigeid": gs2EModeledecontratdirigeid == null ? null : gs2EModeledecontratdirigeid,
    "gs2eTypecomptageid": gs2ETypecomptageid == null ? null : gs2ETypecomptageid,
    "gs2eTypecontratid": gs2ETypecontratid == null ? null : gs2ETypecontratid,
    "gs2eModecommunicationgo": gs2EModecommunicationgo,
    "gs2eDecisionclientgo": gs2EDecisionclientgo,
    "gs2eComplementdadresse": gs2EComplementdadresse == null ? null : gs2EComplementdadresse,
  };
}