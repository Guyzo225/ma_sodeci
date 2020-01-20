import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/saphirV3/CategorieClientItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Categoriecontractuelleclientbases.dart';
import 'package:sodeci_mobile/models/saphirV3/CommuneItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EBranchementbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EDemandebranchementabonnementbase.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EDemandebranchementbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EModeledecontratclientbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2ETypededocumentdumodelebases.dart';
import 'package:sodeci_mobile/models/saphirV3/Productbases.dart';
import 'package:sodeci_mobile/models/saphirV3/QuartierItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Salesliteraturebases.dart';
import 'package:sodeci_mobile/models/saphirV3/Secteuractivitebases.dart';
import 'package:sodeci_mobile/models/saphirV3/TypeUsage.dart';
import 'package:sodeci_mobile/models/saphirV3/saphirv3_response.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:dio/dio.dart';


class DemandeBloc{

  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<List<CommuneItem>> get communeStream => _communeSubject.stream;
  final _communeSubject = BehaviorSubject<List<CommuneItem>>();
  BehaviorSubject<List<CommuneItem>> get communeSubject => _communeSubject;


  //FOR QURTIER ITEM
  Stream<List<QuartierItem>> get quartierStream => _quartierSubject.stream;
  final _quartierSubject = BehaviorSubject<List<QuartierItem>>();
  BehaviorSubject<List<QuartierItem>> get quartierSubject => _quartierSubject;

  //FOR CATEGORIE CLIENT ITEM
  Stream<List<CategorieClientItem>> get catClienStream => _catClienSubject.stream;
  final _catClienSubject = BehaviorSubject<List<CategorieClientItem>>();
  BehaviorSubject<List<CategorieClientItem>> get catClienSubject => _catClienSubject;

  Stream<List<Productbases>> get productBaseStream => _productBaseSubject.stream;
  final _productBaseSubject = BehaviorSubject<List<Productbases>>();
  BehaviorSubject<List<Productbases>> get productBaseSubject => _productBaseSubject;


  //RESPONSE FOR FIRST API CALL
  Stream<EagenceResponse> get firstResponseStream => _firstResponseSubject.stream;
  final _firstResponseSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get firstResponseSubject => _firstResponseSubject;


  //SAVED USER
  Stream<EagenceResponse> get userFromDbStream => _userFromDbSubject.stream;
  final _userFromDbSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get userFromDbSubject => _userFromDbSubject;


  //FOR SAVE FIRST STEP RESULT
  Stream<EagenceResponse> get firsStepStream => _firsStepSubject.stream;
  final _firsStepSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get firsStepSubject => _firsStepSubject;

  Stream<Gs2EDemandebranchementbases> get demandeBranchementStream => _demandeBranchementSubject.stream;
  final _demandeBranchementSubject = BehaviorSubject<Gs2EDemandebranchementbases>();
  BehaviorSubject<Gs2EDemandebranchementbases> get demandeBranchementSubject => _demandeBranchementSubject;

  Stream<Gs2EDemandebranchementabonnementbase> get demandeBrancAbonnementStream => _demandeBranchAbonnementSubject.stream;
  final _demandeBranchAbonnementSubject = BehaviorSubject<Gs2EDemandebranchementabonnementbase>();
  BehaviorSubject<Gs2EDemandebranchementabonnementbase> get demandeBranchAbonnementSubject => _demandeBranchAbonnementSubject;


  Stream<Gs2EModeledecontratclientbases> get modelContratStream => _modelContatSubject.stream;
  final _modelContatSubject = BehaviorSubject<Gs2EModeledecontratclientbases>();
  BehaviorSubject<Gs2EModeledecontratclientbases> get modelContatSubject => _modelContatSubject;


  Stream<EagenceResponse> get motifGoStream => _motifGoSubject.stream;
  final _motifGoSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get motifGoSubject => _motifGoSubject;

  Stream<List<Gs2ETypededocumentdumodelebases>> get typeDocStream => _typeDocSubject.stream;
  final _typeDocSubject = BehaviorSubject<List<Gs2ETypededocumentdumodelebases>>();
  BehaviorSubject<List<Gs2ETypededocumentdumodelebases>> get typeDocSubject => _typeDocSubject;


  Stream<List<Gs2EBranchementbases>> get branchementStream => _branchementSubject.stream;
  final _branchementSubject = BehaviorSubject<List<Gs2EBranchementbases>>();
  BehaviorSubject<List<Gs2EBranchementbases>> get branchementSubject => _branchementSubject;


  Stream<List<Salesliteraturebases>> get saleLitteratureStream => _saleLitteratureSubject.stream;
  final _saleLitteratureSubject = BehaviorSubject<List<Salesliteraturebases>>();
  BehaviorSubject<List<Salesliteraturebases>> get saleLitteratureSubject => _saleLitteratureSubject;
  
  Stream<int> get typeDemandeStream => _typeDemandeSubject.stream;
  final _typeDemandeSubject = BehaviorSubject<int>();
  BehaviorSubject<int> get typeDemandeSubject => _typeDemandeSubject;

  ///////////////////////////////////////////////////////////////////////
  ////////////////////// FOR ABONNEMENT/BRANCHEMENT
  ///////////////////////////////////////////////////////////////////////
  Stream<List<Categoriecontractuelleclientbases>> get catContractuelStream => _catContractuelSubject.stream;
  final _catContractuelSubject = BehaviorSubject<List<Categoriecontractuelleclientbases>>();
  BehaviorSubject<List<Categoriecontractuelleclientbases>> get catContractuelSubject => _catContractuelSubject;


  Stream<TypeUsage> get typeUsageStream => _typeUsageSubject.stream;
  final _typeUsageSubject = BehaviorSubject<TypeUsage>();
  BehaviorSubject<TypeUsage> get typeUsageSubject => _typeUsageSubject;

  Stream<Secteuractivitebases> get secteurActiviteStream => _secteurActiviteSubject.stream;
  final _secteurActiviteSubject = BehaviorSubject<Secteuractivitebases>();
  BehaviorSubject<Secteuractivitebases> get secteurActiviteSubject => _secteurActiviteSubject;



  DemandeBloc(){
    Utils.getData(AppConstant.USER_LINK).then((value){
      _userFromDbSubject.add(EagenceResponse.fromJson(jsonDecode(value)));
    });
  }

  void initialise(Contactbases userInfo){
    //print(jsonEncode(userInfo));
    getCommunes();
    getCategoriClient(userInfo.gs2EGenreclientid);

  }


  Future<void> getCommunes(){
    _loadingSubject.add(Loading(message: "Initialisation ...",loading: true));
    RequestExtensionGs2e<CommuneItem> _rext = RequestExtensionGs2e();

    Future response = _rext.getSaphirV3("fan_dcoupagegographiquebases?fanNiveaudecoupage=4147C0A7-FC59-43CC-8781-1DD438585C6D&order[fanDecoupage]=asc&itemsPerPage=240");
    response.then((resp){
      SaphirV3Response<CommuneItem> result = resp as SaphirV3Response<CommuneItem>;

      if(result.totalItems == 0){
        //_loadingSubject.add(Loading(loading: false,hasError: true,message: "Communes introuvable"));
      }else {
        //_loadingSubject.add(Loading(loading: false,hasError: false));
        List<CommuneItem> list = [];
        result.hydraMember.forEach((it){
          if(it.fanDecoupage.toUpperCase() == "COCODY" || it.fanDecoupage.toUpperCase() == "PLATEAU"){
            list.add(it);
          }
        });
        _communeSubject.add(list);

      }
    }).catchError((error){
      print(error);
      //_loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }
  Future<void> getQuartier(String idCommune){
    RequestExtensionGs2e<QuartierItem> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Chargement des quartiers ...",loading: true));
    Future response = _rext.getSaphirV3("fan_dcoupagegographiquebases?fanDecoupagegograhique=AE036547-5D48-44AD-85EF-A75F7D8DDA51&fanIdtechniquerecherche=$idCommune&order[fanDecoupage]=asc");
    response.then((resp){
      SaphirV3Response<QuartierItem> result = resp as SaphirV3Response<QuartierItem>;

      if(result.totalItems == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Quartier introuvable"));
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false));
        _quartierSubject.add(result.hydraMember);

      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  Future<void> getCatContractuelle(String categoriClient){
    RequestExtensionGs2e<Categoriecontractuelleclientbases> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Chargement des catégorie contractuelle ...",loading: true));
    Future response = _rext.getSaphirV3("jfa_categoriecontractuelleclientbases?statecode=0&gs2eCatgorieclientlie=$categoriClient&gs2eSoumisearegroupement=false&gs2eCategoriereserveeagent=false&itemsPerPage=240&order[jfaName]=asc");
    response.then((resp){
      SaphirV3Response<Categoriecontractuelleclientbases> result = resp as SaphirV3Response<Categoriecontractuelleclientbases>;

      if(result.totalItems == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Catégorie introuvable"));
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false));
        _catContractuelSubject.add(result.hydraMember);

      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  Future<void> getTypeUsage(String produitId,String catContraId){
    RequestExtensionGs2e<TypeUsage> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Chargement des type d'usage ...",loading: true));
    Future response = _rext.getSimple(RequestExtensionGs2e.root_url_saphirV3 + "jfa_categoriecontractuelleclientbases?produitCible=$produitId&categorieContractuelClientid=$catContraId");
    response.then((resp){
      TypeUsage result = resp as TypeUsage;

      if(result.data == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Type usage introuvable"));
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false));
        _typeUsageSubject.add(result);

      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  Future<void> getBranchementActivite(String idTypeUsage){
    RequestExtensionGs2e<Secteuractivitebases> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Chargement des Branches d'activité ...",loading: true));
    Future response = _rext.getSimple(RequestExtensionGs2e.root_url_saphirV3 + "jfa_secteuractivitebases?newUsageId=$idTypeUsage");
    response.then((resp){
      Secteuractivitebases result = resp as Secteuractivitebases;

      if(result.data == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Type usage introuvable"));
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false));
        _secteurActiviteSubject.add(result);

      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }







  Future<void> getCategoriClient(String genreClientId){
    RequestExtensionGs2e<CategorieClientItem> _rext = RequestExtensionGs2e();
    Future response = _rext.getSaphirV3("gs2e_categorieclientbases?statuscode=1&gs2eGenreclientid=$genreClientId");
    response.then((resp){
      SaphirV3Response<CategorieClientItem> result = resp as SaphirV3Response<CategorieClientItem>;

      if(result.totalItems == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Catégorie client introuvable"));
      }else {
        //_loadingSubject.add(Loading(loading: false,hasError: false));
        catClienSubject.add(result.hydraMember);
        getTypeProduct();

      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  Future<void> getTypeProduct(){
    RequestExtensionGs2e<Productbases> _rext = RequestExtensionGs2e();
    Future response = _rext.getSaphirV3("productbases");
    response.then((resp){
      SaphirV3Response<Productbases> result = resp as SaphirV3Response<Productbases>;

      if(result.totalItems == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Catégorie client introuvable"));
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false));
        List<Productbases> list = [];
        list = result.hydraMember.where((it) => it.name.toLowerCase().contains("potable")).toList();
        _productBaseSubject.add(list);

      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  Future<void> sendFirstPart(String data){
    _loadingSubject.add(Loading(message: "Soumission en cours ...",loading: true));
    print(jsonEncode(data.toString()));
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();
    String endpoint = "";
    if(_typeDemandeSubject.value == 1){
      endpoint = "inc/demandes_membres/brchmnt/Ajx_Send_Data_String.php";
    }else if(_typeDemandeSubject.value == 3){
      endpoint = "inc/demandes_membres/brchmnt_ab/Ajx_Send_Data_String.php";
    }else if(_typeDemandeSubject.value == 2){
      endpoint = "inc/demandes_membres/abnmt/Ajx_Send_Data_String.php";
    }
    print(RequestExtensionGs2e.url_eagence+"$endpoint");
    Future response = _rext.getSimple(RequestExtensionGs2e.url_eagence+"$endpoint?$data");
    response.then((resp){
      EagenceResponse rep = resp as EagenceResponse;
      print(rep.numDemv3);
      if(rep.numDemv3 == null || rep.numDemv3 == "" || rep.numDemv3  == "null"){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "La demande échoué. Vérifié les informations"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Information soumise avec succès. \n Votre code demande est : ${rep.numDemv3} \n. Veuillez poursuivre et soumettre vos documents"),);
        _firstResponseSubject.add(rep);
      }
      _firsStepSubject.add(resp as EagenceResponse);
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Opération echoué"),);
    });

  }

  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET LA DEMANDE BRANCHEMENT
  ///////////////////////////////////////////////////////////////////////////////

  Future<void> findDemande(String id){
    RequestExtensionGs2e<Gs2EDemandebranchementbases> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Initialisation en cours ...",loading: true));
    print(RequestExtensionGs2e.root_url_saphirV3+"gs2e_demandebranchementbases/$id");
    Future response = _rext.getSimple(RequestExtensionGs2e.root_url_saphirV3+"gs2e_demandebranchementbases/$id");
    response.then((resp){
      Gs2EDemandebranchementbases result = resp as Gs2EDemandebranchementbases;
      print(result);
      if(result == null || result.gs2EDemandebranchementid == null){
        print("error 1");
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        _demandeBranchementSubject.add(result);
        getContractModel();
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET LA DEMANDE GENERYQUE
  ///////////////////////////////////////////////////////////////////////////////

  /*Future<void> findDemandeAbonnementBranchement(String id){
    RequestExtensionGs2e<Gs2EDemandebranchementabonnementbase> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Initialisation en cours ...",loading: true));
    print(RequestExtensionGs2e.root_url_saphirV3+"gs2e_demandebranchementabonnementbases/$id");
    Future response = _rext.getSimple(RequestExtensionGs2e.root_url_saphirV3+"gs2e_demandebranchementabonnementbases/$id");
    response.then((resp){
      Gs2EDemandebranchementabonnementbase result = resp as Gs2EDemandebranchementabonnementbase;
      print(result);
      if(result == null || result.gs2EDemandebranchementabonnementid == null){
        print("error 1");
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        _demandeBranchAbonnementSubject.add(result);
        getContractModel();
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }*/

  Future<void> findDemandeAbonnement(String id){
    String endpoint = "";
    switch(_typeDemandeSubject.value){
      case 3:
        endpoint = "gs2e_demandebranchementabonnementbases";
        break;
      case 2:
        endpoint = "gs2e_demandeabonnementbases";
        break;
      default:
        endpoint = "gs2e_demandebranchementabonnementbases";
    }
    RequestExtensionGs2e<Gs2EDemandebranchementabonnementbase> _rext = RequestExtensionGs2e();
    _loadingSubject.add(Loading(message: "Initialisation en cours ...",loading: true));
    print(RequestExtensionGs2e.root_url_saphirV3+"$endpoint/$id");
    Future response = _rext.getSimple(RequestExtensionGs2e.root_url_saphirV3+"$endpoint/$id");
    response.then((resp){
      Gs2EDemandebranchementabonnementbase result = resp as Gs2EDemandebranchementabonnementbase;
      print(result);
      if(result == null || (_typeDemandeSubject.value == 3 && result.gs2EDemandebranchementabonnementid == null) || (_typeDemandeSubject.value == 2 && result.gs2eDemandeabonnementid == null)){
        print("error 1");
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        _demandeBranchAbonnementSubject.add(result);
        //print(result)
        getContractModel();
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET LE MODELE DE CONTRAT
  ///////////////////////////////////////////////////////////////////////////////
  Future<void> getContractModel(){
    print("geting contract");
    String gs2eProductid = "";
    switch (_typeDemandeSubject.value){
      case 1:
        gs2eProductid = _demandeBranchementSubject.value.gs2EProduitid;
        break;
      case 2:
      case 3:
        gs2eProductid = _demandeBranchAbonnementSubject.value.gs2EProduitid;
        break;
      default:
        gs2eProductid = _demandeBranchementSubject.value.gs2EProduitid;
    }
    RequestExtensionGs2e<Gs2EModeledecontratclientbases> _rext = RequestExtensionGs2e();
    Future response = _rext.getSaphirV3("gs2e_modeledecontratclientbases?gs2eProductid=$gs2eProductid");
    response.then((resp){
      SaphirV3Response<Gs2EModeledecontratclientbases> result = resp as SaphirV3Response<Gs2EModeledecontratclientbases>;

      if(result.totalItems == 0 || result.totalItems == null || result.totalItems <3){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        _modelContatSubject.add(result.hydraMember[2]);
        getMotifDemande();
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET MOTIF DE LA DEMANDE
  ///////////////////////////////////////////////////////////////////////////////

  Future<void> getMotifDemande(){
    print("geting Motif");
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();
    FormData formdata = new FormData.fromMap({
      "idTypeDeAgence_" : "${_typeDemandeSubject.value}"
    });
    Future response = _rext.postWithEAgence("inc/demandes_membres/Ajx_Return_gs2eMotifDemandeGo.php",formdata);
    response.then((resp){
      EagenceResponse result = resp as EagenceResponse;

      if(result.gs2e_motifdedemandego == "0"){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        getTypeDocuments(result.gs2e_motifdedemandego);
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET LA LISTE DES DOCS A FOURNIR
  ///////////////////////////////////////////////////////////////////////////////
  Future<void> getTypeDocuments(String motif){
    print("getTypeDoc");
    RequestExtensionGs2e<Gs2ETypededocumentdumodelebases> _rext = RequestExtensionGs2e();
    Future response = _rext.getSaphirV3("gs2e_typededocumentdumodelebases?gs2eModeledecontratclientid=${_modelContatSubject.value.gs2EModeledecontratclientid}&gs2eObligatoireDo=true&statuscode=1&gs2eMotifdedemandego=$motif");
    response.then((resp){
      SaphirV3Response<Gs2ETypededocumentdumodelebases> result = resp as SaphirV3Response<Gs2ETypededocumentdumodelebases>;

      if(result.totalItems == 0 || result.totalItems == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        print(jsonEncode(result.hydraMember));
        _typeDocSubject.add(result.hydraMember);
        //getMotifDemande();
        result.hydraMember.forEach((it){
          getSaleLiterratureId(it.gs2ETypededocumentid);
        });
        _loadingSubject.add(Loading(loading: false,hasError: false));
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET LA BRANCHEMENT ID WITH  BRANCHEMENT REFERENCE
  ///////////////////////////////////////////////////////////////////////////////
  Future<void> getBranchementByRefBranche(String ref){
    print("getBranchementByRefBranche");
    _loadingSubject.add(Loading(loading: true,message: "Vérification en cours ..."));
    RequestExtensionGs2e<Gs2EBranchementbases> _rext = RequestExtensionGs2e();
    Future response = _rext.getSaphirV3("gs2e_branchementbases?gs2eReferencedubranchement=$ref");
    response.then((resp){
      SaphirV3Response<Gs2EBranchementbases> result = resp as SaphirV3Response<Gs2EBranchementbases>;
      if(result.totalItems == 0 || result.totalItems == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        print(jsonEncode(result.hydraMember));
        _branchementSubject.add(result.hydraMember);
        //getMotifDemande();
        _loadingSubject.add(Loading(loading: false,hasError: false));
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  ////////////////////////////////////////////////////////////////////////////////
  /////////// GET LA LISTE DES ID TABLE A FOURNIR
  ///////////////////////////////////////////////////////////////////////////////
  Future<void> getSaleLiterratureId(String gs2eTypededocumentid){
    print("getSaleLiterature");
    String gs2eDemandebranchementid = "";
    String endpoint = "";
    switch(_typeDemandeSubject.value){
      case 1:
        gs2eDemandebranchementid = _demandeBranchementSubject.value.gs2EDemandebranchementid;
        endpoint = "gs2eDemandebranchementid";
        break;
      case 2:
        gs2eDemandebranchementid = _demandeBranchAbonnementSubject.value.gs2eDemandeabonnementid;
        endpoint = "CritereTypeDemandeId";
        break;
      case 3:
        gs2eDemandebranchementid = _demandeBranchAbonnementSubject.value.gs2EDemandebranchementabonnementid;
        endpoint = "CritereTypeDemandeId";
    }

    RequestExtensionGs2e<Salesliteraturebases> _rext = RequestExtensionGs2e();
    Future response = _rext.getSaphirV3("salesliteraturebases?gs2eTypedocumentid=$gs2eTypededocumentid&$endpoint=$gs2eDemandebranchementid");
    response.then((resp){
      SaphirV3Response<Salesliteraturebases> result = resp as SaphirV3Response<Salesliteraturebases>;

      if(result.totalItems == 0 || result.totalItems == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
      }else {
        List<Salesliteraturebases> list = _saleLitteratureSubject.value;
        if(list != null){
          list.addAll(result.hydraMember);
        }else {
          list = result.hydraMember;
        }
        _saleLitteratureSubject.add(list);
        //_loadingSubject.add(Loading(loading: false,hasError: false));
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  Future<void> soumettreDocument(FormData data){
    print(data.fields);
    print(data.files);
    _loadingSubject.add(Loading(message: "Soumission en cours ...",loading: true));
    print(jsonEncode(data.toString()));
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();

    Future response = _rext.postWithDioInscription(RequestExtensionGs2e.url_eagence+"inc/demandes_membres/PJ_upload.php",data);
    response.then((resp){
      EagenceResponse rep = resp as EagenceResponse;
      if(rep == null || rep.refIndividu == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Soumission echoué"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Document soumis avec succès"),);
      }
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Inscription echoué"),);
    });

  }




}