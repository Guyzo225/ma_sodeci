import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Gs2EDemandebranchementbases extends ToJsonInterface {
  String context;
  String id;
  String type;
  String gs2EDemandebranchementid;
  String gs2ENumerodemande;
  String gs2EAdressegeographique;
  bool gs2EAppliquerairsido;
  bool gs2EAppliquertvado;
  int gs2EAutorisationdiffererreglementfraisgo;
  String gs2ECodesytmeproduit;
  bool gs2ECoffretcahorsdo;
  String transactioncurrencyid;
  String exchangerate;
  DateTime gs2EDaterdvmetre;
  DateTime gs2EDateretraitdevis;
  bool gs2EEditioneffectueego;
  int gs2EEtapeactuellego;
  bool gs2EEtatrealisationdevisextensiondo;
  bool gs2EEtatrealisationdevistravauxdo;
  bool gs2EFacturedevisechelonnabledo;
  bool gs2EFacturedroitdesuiteechelonnabledo;
  bool gs2EFacturefraisparticipationhtechelonnabledo;
  bool gs2EFintravauxnecessairedo;
  bool gs2EGenererfraisechelonnementdo;
  int gs2EMetrefacturablego;
  int gs2EMotifdedemandego;
  int gs2ENaturecommercialego;
  int gs2ENombrepointdefourniture;
  String gs2EOrganisationencours;
  String gs2EReferenceclient;
  bool gs2ESecteurenzoneassaisiniedo;
  int gs2EStatutdemande;
  int gs2EStatutdocumentsgo;
  String gs2ETauxasdiapplique;
  String gs2ETauxcoeffeloignement;
  String gs2ETauxinteret;
  String gs2EDivisionid;
  String gs2EClientid;
  String gs2EMandataireid;
  String gs2EContratid;
  String gs2ECategorieclientid;
  String gs2EModelecontratclientid;
  String gs2ETypecomptageid;
  String gs2EConventiondefacturationid;
  String gs2EProduitdirigeid;
  String gs2EProduitid;
  String gs2EComptedemessagerieid;
  String gs2ETypecontratid;
  dynamic gs2EReprisesaisiecrido;
  bool gs2EValidationuniquemetredevisdo;
  dynamic gs2EProvenanceEagencedo;
  dynamic gs2ENumerodemandeEagence;
  String gs2EDecoupagegeographiqueid;
  String gs2ENiveaudecoupageid;
  dynamic gs2EComplementdadresse;
  dynamic gs2EDecisionclient;

  Gs2EDemandebranchementbases({
    this.context,
    this.id,
    this.type,
    this.gs2EDemandebranchementid,
    this.gs2ENumerodemande,
    this.gs2EAdressegeographique,
    this.gs2EAppliquerairsido,
    this.gs2EAppliquertvado,
    this.gs2EAutorisationdiffererreglementfraisgo,
    this.gs2ECodesytmeproduit,
    this.gs2ECoffretcahorsdo,
    this.transactioncurrencyid,
    this.exchangerate,
    this.gs2EDaterdvmetre,
    this.gs2EDateretraitdevis,
    this.gs2EEditioneffectueego,
    this.gs2EEtapeactuellego,
    this.gs2EEtatrealisationdevisextensiondo,
    this.gs2EEtatrealisationdevistravauxdo,
    this.gs2EFacturedevisechelonnabledo,
    this.gs2EFacturedroitdesuiteechelonnabledo,
    this.gs2EFacturefraisparticipationhtechelonnabledo,
    this.gs2EFintravauxnecessairedo,
    this.gs2EGenererfraisechelonnementdo,
    this.gs2EMetrefacturablego,
    this.gs2EMotifdedemandego,
    this.gs2ENaturecommercialego,
    this.gs2ENombrepointdefourniture,
    this.gs2EOrganisationencours,
    this.gs2EReferenceclient,
    this.gs2ESecteurenzoneassaisiniedo,
    this.gs2EStatutdemande,
    this.gs2EStatutdocumentsgo,
    this.gs2ETauxasdiapplique,
    this.gs2ETauxcoeffeloignement,
    this.gs2ETauxinteret,
    this.gs2EDivisionid,
    this.gs2EClientid,
    this.gs2EMandataireid,
    this.gs2EContratid,
    this.gs2ECategorieclientid,
    this.gs2EModelecontratclientid,
    this.gs2ETypecomptageid,
    this.gs2EConventiondefacturationid,
    this.gs2EProduitdirigeid,
    this.gs2EProduitid,
    this.gs2EComptedemessagerieid,
    this.gs2ETypecontratid,
    this.gs2EReprisesaisiecrido,
    this.gs2EValidationuniquemetredevisdo,
    this.gs2EProvenanceEagencedo,
    this.gs2ENumerodemandeEagence,
    this.gs2EDecoupagegeographiqueid,
    this.gs2ENiveaudecoupageid,
    this.gs2EComplementdadresse,
    this.gs2EDecisionclient,
  });

  factory Gs2EDemandebranchementbases.fromJson(Map<String, dynamic> json) => Gs2EDemandebranchementbases(
    context: json["@context"] == null ? null : json["@context"],
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    gs2EDemandebranchementid: json["gs2eDemandebranchementid"] == null ? null : json["gs2eDemandebranchementid"],
    gs2ENumerodemande: json["gs2eNumerodemande"] == null ? null : json["gs2eNumerodemande"],
    gs2EAdressegeographique: json["gs2eAdressegeographique"] == null ? null : json["gs2eAdressegeographique"],
    gs2EAppliquerairsido: json["gs2eAppliquerairsido"] == null ? null : json["gs2eAppliquerairsido"],
    gs2EAppliquertvado: json["gs2eAppliquertvado"] == null ? null : json["gs2eAppliquertvado"],
    gs2EAutorisationdiffererreglementfraisgo: json["gs2eAutorisationdiffererreglementfraisgo"] == null ? null : json["gs2eAutorisationdiffererreglementfraisgo"],
    gs2ECodesytmeproduit: json["gs2eCodesytmeproduit"] == null ? null : json["gs2eCodesytmeproduit"],
    gs2ECoffretcahorsdo: json["gs2eCoffretcahorsdo"] == null ? null : json["gs2eCoffretcahorsdo"],
    transactioncurrencyid: json["transactioncurrencyid"] == null ? null : json["transactioncurrencyid"],
    exchangerate: json["exchangerate"] == null ? null : json["exchangerate"],
    gs2EDaterdvmetre: json["gs2eDaterdvmetre"] == null ? null : DateTime.parse(json["gs2eDaterdvmetre"]),
    gs2EDateretraitdevis: json["gs2eDateretraitdevis"] == null ? null : DateTime.parse(json["gs2eDateretraitdevis"]),
    gs2EEditioneffectueego: json["gs2eEditioneffectueego"] == null ? null : json["gs2eEditioneffectueego"],
    gs2EEtapeactuellego: json["gs2eEtapeactuellego"] == null ? null : json["gs2eEtapeactuellego"],
    gs2EEtatrealisationdevisextensiondo: json["gs2eEtatrealisationdevisextensiondo"] == null ? null : json["gs2eEtatrealisationdevisextensiondo"],
    gs2EEtatrealisationdevistravauxdo: json["gs2eEtatrealisationdevistravauxdo"] == null ? null : json["gs2eEtatrealisationdevistravauxdo"],
    gs2EFacturedevisechelonnabledo: json["gs2eFacturedevisechelonnabledo"] == null ? null : json["gs2eFacturedevisechelonnabledo"],
    gs2EFacturedroitdesuiteechelonnabledo: json["gs2eFacturedroitdesuiteechelonnabledo"] == null ? null : json["gs2eFacturedroitdesuiteechelonnabledo"],
    gs2EFacturefraisparticipationhtechelonnabledo: json["gs2eFacturefraisparticipationhtechelonnabledo"] == null ? null : json["gs2eFacturefraisparticipationhtechelonnabledo"],
    gs2EFintravauxnecessairedo: json["gs2eFintravauxnecessairedo"] == null ? null : json["gs2eFintravauxnecessairedo"],
    gs2EGenererfraisechelonnementdo: json["gs2eGenererfraisechelonnementdo"] == null ? null : json["gs2eGenererfraisechelonnementdo"],
    gs2EMetrefacturablego: json["gs2eMetrefacturablego"] == null ? null : json["gs2eMetrefacturablego"],
    gs2EMotifdedemandego: json["gs2eMotifdedemandego"] == null ? null : json["gs2eMotifdedemandego"],
    gs2ENaturecommercialego: json["gs2eNaturecommercialego"] == null ? null : json["gs2eNaturecommercialego"],
    gs2ENombrepointdefourniture: json["gs2eNombrepointdefourniture"] == null ? null : json["gs2eNombrepointdefourniture"],
    gs2EOrganisationencours: json["gs2eOrganisationencours"] == null ? null : json["gs2eOrganisationencours"],
    gs2EReferenceclient: json["gs2eReferenceclient"] == null ? null : json["gs2eReferenceclient"],
    gs2ESecteurenzoneassaisiniedo: json["gs2eSecteurenzoneassaisiniedo"] == null ? null : json["gs2eSecteurenzoneassaisiniedo"],
    gs2EStatutdemande: json["gs2eStatutdemande"] == null ? null : json["gs2eStatutdemande"],
    gs2EStatutdocumentsgo: json["gs2eStatutdocumentsgo"] == null ? null : json["gs2eStatutdocumentsgo"],
    gs2ETauxasdiapplique: json["gs2eTauxasdiapplique"] == null ? null : json["gs2eTauxasdiapplique"],
    gs2ETauxcoeffeloignement: json["gs2eTauxcoeffeloignement"] == null ? null : json["gs2eTauxcoeffeloignement"],
    gs2ETauxinteret: json["gs2eTauxinteret"] == null ? null : json["gs2eTauxinteret"],
    gs2EDivisionid: json["gs2eDivisionid"] == null ? null : json["gs2eDivisionid"],
    gs2EClientid: json["gs2eClientid"] == null ? null : json["gs2eClientid"],
    gs2EMandataireid: json["gs2eMandataireid"] == null ? null : json["gs2eMandataireid"],
    gs2EContratid: json["gs2eContratid"] == null ? null : json["gs2eContratid"],
    gs2ECategorieclientid: json["gs2eCategorieclientid"] == null ? null : json["gs2eCategorieclientid"],
    gs2EModelecontratclientid: json["gs2eModelecontratclientid"] == null ? null : json["gs2eModelecontratclientid"],
    gs2ETypecomptageid: json["gs2eTypecomptageid"] == null ? null : json["gs2eTypecomptageid"],
    gs2EConventiondefacturationid: json["gs2eConventiondefacturationid"] == null ? null : json["gs2eConventiondefacturationid"],
    gs2EProduitdirigeid: json["gs2eProduitdirigeid"] == null ? null : json["gs2eProduitdirigeid"],
    gs2EProduitid: json["gs2eProduitid"] == null ? null : json["gs2eProduitid"],
    gs2EComptedemessagerieid: json["gs2eComptedemessagerieid"] == null ? null : json["gs2eComptedemessagerieid"],
    gs2ETypecontratid: json["gs2eTypecontratid"] == null ? null : json["gs2eTypecontratid"],
    gs2EReprisesaisiecrido: json["gs2eReprisesaisiecrido"],
    gs2EValidationuniquemetredevisdo: json["gs2eValidationuniquemetredevisdo"] == null ? null : json["gs2eValidationuniquemetredevisdo"],
    gs2EProvenanceEagencedo: json["gs2eProvenanceEagencedo"],
    gs2ENumerodemandeEagence: json["gs2eNumerodemandeEagence"],
    gs2EDecoupagegeographiqueid: json["gs2eDecoupagegeographiqueid"] == null ? null : json["gs2eDecoupagegeographiqueid"],
    gs2ENiveaudecoupageid: json["gs2eNiveaudecoupageid"] == null ? null : json["gs2eNiveaudecoupageid"],
    gs2EComplementdadresse: json["gs2eComplementdadresse"],
    gs2EDecisionclient: json["gs2eDecisionclient"],
  );

  Map<String, dynamic> toJson() => {
    "@context": context == null ? null : context,
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "gs2eDemandebranchementid": gs2EDemandebranchementid == null ? null : gs2EDemandebranchementid,
    "gs2eNumerodemande": gs2ENumerodemande == null ? null : gs2ENumerodemande,
    "gs2eAdressegeographique": gs2EAdressegeographique == null ? null : gs2EAdressegeographique,
    "gs2eAppliquerairsido": gs2EAppliquerairsido == null ? null : gs2EAppliquerairsido,
    "gs2eAppliquertvado": gs2EAppliquertvado == null ? null : gs2EAppliquertvado,
    "gs2eAutorisationdiffererreglementfraisgo": gs2EAutorisationdiffererreglementfraisgo == null ? null : gs2EAutorisationdiffererreglementfraisgo,
    "gs2eCodesytmeproduit": gs2ECodesytmeproduit == null ? null : gs2ECodesytmeproduit,
    "gs2eCoffretcahorsdo": gs2ECoffretcahorsdo == null ? null : gs2ECoffretcahorsdo,
    "transactioncurrencyid": transactioncurrencyid == null ? null : transactioncurrencyid,
    "exchangerate": exchangerate == null ? null : exchangerate,
    "gs2eDaterdvmetre": gs2EDaterdvmetre == null ? null : gs2EDaterdvmetre.toIso8601String(),
    "gs2eDateretraitdevis": gs2EDateretraitdevis == null ? null : gs2EDateretraitdevis.toIso8601String(),
    "gs2eEditioneffectueego": gs2EEditioneffectueego == null ? null : gs2EEditioneffectueego,
    "gs2eEtapeactuellego": gs2EEtapeactuellego == null ? null : gs2EEtapeactuellego,
    "gs2eEtatrealisationdevisextensiondo": gs2EEtatrealisationdevisextensiondo == null ? null : gs2EEtatrealisationdevisextensiondo,
    "gs2eEtatrealisationdevistravauxdo": gs2EEtatrealisationdevistravauxdo == null ? null : gs2EEtatrealisationdevistravauxdo,
    "gs2eFacturedevisechelonnabledo": gs2EFacturedevisechelonnabledo == null ? null : gs2EFacturedevisechelonnabledo,
    "gs2eFacturedroitdesuiteechelonnabledo": gs2EFacturedroitdesuiteechelonnabledo == null ? null : gs2EFacturedroitdesuiteechelonnabledo,
    "gs2eFacturefraisparticipationhtechelonnabledo": gs2EFacturefraisparticipationhtechelonnabledo == null ? null : gs2EFacturefraisparticipationhtechelonnabledo,
    "gs2eFintravauxnecessairedo": gs2EFintravauxnecessairedo == null ? null : gs2EFintravauxnecessairedo,
    "gs2eGenererfraisechelonnementdo": gs2EGenererfraisechelonnementdo == null ? null : gs2EGenererfraisechelonnementdo,
    "gs2eMetrefacturablego": gs2EMetrefacturablego == null ? null : gs2EMetrefacturablego,
    "gs2eMotifdedemandego": gs2EMotifdedemandego == null ? null : gs2EMotifdedemandego,
    "gs2eNaturecommercialego": gs2ENaturecommercialego == null ? null : gs2ENaturecommercialego,
    "gs2eNombrepointdefourniture": gs2ENombrepointdefourniture == null ? null : gs2ENombrepointdefourniture,
    "gs2eOrganisationencours": gs2EOrganisationencours == null ? null : gs2EOrganisationencours,
    "gs2eReferenceclient": gs2EReferenceclient == null ? null : gs2EReferenceclient,
    "gs2eSecteurenzoneassaisiniedo": gs2ESecteurenzoneassaisiniedo == null ? null : gs2ESecteurenzoneassaisiniedo,
    "gs2eStatutdemande": gs2EStatutdemande == null ? null : gs2EStatutdemande,
    "gs2eStatutdocumentsgo": gs2EStatutdocumentsgo == null ? null : gs2EStatutdocumentsgo,
    "gs2eTauxasdiapplique": gs2ETauxasdiapplique == null ? null : gs2ETauxasdiapplique,
    "gs2eTauxcoeffeloignement": gs2ETauxcoeffeloignement == null ? null : gs2ETauxcoeffeloignement,
    "gs2eTauxinteret": gs2ETauxinteret == null ? null : gs2ETauxinteret,
    "gs2eDivisionid": gs2EDivisionid == null ? null : gs2EDivisionid,
    "gs2eClientid": gs2EClientid == null ? null : gs2EClientid,
    "gs2eMandataireid": gs2EMandataireid == null ? null : gs2EMandataireid,
    "gs2eContratid": gs2EContratid == null ? null : gs2EContratid,
    "gs2eCategorieclientid": gs2ECategorieclientid == null ? null : gs2ECategorieclientid,
    "gs2eModelecontratclientid": gs2EModelecontratclientid == null ? null : gs2EModelecontratclientid,
    "gs2eTypecomptageid": gs2ETypecomptageid == null ? null : gs2ETypecomptageid,
    "gs2eConventiondefacturationid": gs2EConventiondefacturationid == null ? null : gs2EConventiondefacturationid,
    "gs2eProduitdirigeid": gs2EProduitdirigeid == null ? null : gs2EProduitdirigeid,
    "gs2eProduitid": gs2EProduitid == null ? null : gs2EProduitid,
    "gs2eComptedemessagerieid": gs2EComptedemessagerieid == null ? null : gs2EComptedemessagerieid,
    "gs2eTypecontratid": gs2ETypecontratid == null ? null : gs2ETypecontratid,
    "gs2eReprisesaisiecrido": gs2EReprisesaisiecrido,
    "gs2eValidationuniquemetredevisdo": gs2EValidationuniquemetredevisdo == null ? null : gs2EValidationuniquemetredevisdo,
    "gs2eProvenanceEagencedo": gs2EProvenanceEagencedo,
    "gs2eNumerodemandeEagence": gs2ENumerodemandeEagence,
    "gs2eDecoupagegeographiqueid": gs2EDecoupagegeographiqueid == null ? null : gs2EDecoupagegeographiqueid,
    "gs2eNiveaudecoupageid": gs2ENiveaudecoupageid == null ? null : gs2ENiveaudecoupageid,
    "gs2eComplementdadresse": gs2EComplementdadresse,
    "gs2eDecisionclient": gs2EDecisionclient,
  };
}