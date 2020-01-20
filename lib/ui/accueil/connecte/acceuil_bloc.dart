import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/ListeDesFacture.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/Login.dart';
import 'package:sodeci_mobile/models/RefContractResponse.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Conventionfacturationbases.dart';
import 'package:sodeci_mobile/models/saphirV3/saphirv3_response.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:sodeci_mobile/utils/utils.dart';

class AccueilBloc {
  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<RefContractResponse> get refContraStream => _refContratSubject.stream;
  final _refContratSubject = BehaviorSubject<RefContractResponse>();

  BehaviorSubject<RefContractResponse> get refContrat => _refContratSubject;

  Stream<EagenceResponse> get userStream => _userSubject.stream;
  final _userSubject = BehaviorSubject<EagenceResponse>();

  BehaviorSubject<EagenceResponse> get userSubject => _userSubject;

  Stream<List<String>> get contractsStream => _contractsSubject.stream;
  final _contractsSubject = BehaviorSubject<List<String>>();

  BehaviorSubject<List<String>> get contractsSubject => _contractsSubject;

  Stream<List<Conventionfacturationbases>> get factureStream =>
      _factureSubject.stream;
  final _factureSubject = BehaviorSubject<List<Conventionfacturationbases>>();

  BehaviorSubject<List<Conventionfacturationbases>> get factureSubject =>
      _factureSubject;
  
  

  Stream<List<Conventionfacturationbases>> get allFactureStream =>
      _allFactureSubject.stream;
  final _allFactureSubject =
      BehaviorSubject<List<Conventionfacturationbases>>();

  BehaviorSubject<List<Conventionfacturationbases>> get allFactureSubject =>
      _allFactureSubject;

  Stream<int> get impaySoldeStream =>
      _impaySoldeSubject.stream;
  final _impaySoldeSubject = BehaviorSubject<int>();
  BehaviorSubject<int> get impaySoldeSubject =>
      _impaySoldeSubject;

  Stream<Contactbases> get userInfoStream => _userInfoSubject.stream;
  final _userInfoSubject = BehaviorSubject<Contactbases>();

  BehaviorSubject<Contactbases> get userInfoSubject => _userInfoSubject;

  Stream<String> get currenrRefContratStream =>
      _currentRefContratSubject.stream;
  final _currentRefContratSubject = BehaviorSubject<String>();

  BehaviorSubject<String> get currentRefContratSubject =>
      _currentRefContratSubject;

  static AccueilBloc _instance;

  bool _isLoading = false;

  static AccueilBloc getState() {
    if (_instance == null) {
      _instance = AccueilBloc._internal();
    }

    return _instance;
  }

  AccueilBloc._internal() {
    _impaySoldeSubject.add(0);
  }

  initConnect() {
    _isLoading = true;
    Utils.getData(AppConstant.USER_LINK).then((value) {
      if (value != null) {
        _userSubject.add(EagenceResponse.fromJson(jsonDecode(value)));
        FormData data = new FormData.fromMap({
          "Value_Id_Usr": _userSubject.value.idUser,
        });
        getUserRefCLient(data);
      }
    });
  }

  Future<void> getAllFactureForContrat(String ref) {
    _currentRefContratSubject.add(ref);
    String url =
        "https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/api/nmpf/consultation?RefContrat=$ref";
    if (!_isLoading) {
      _loadingSubject
          .add(Loading(message: "Chargement en cour ...", loading: true));
    }

    RequestExtensionGs2e<RefContractResponse> _rext = RequestExtensionGs2e();

    Future response = _rext.getWithToken(url);
    response.then((resp) {
      _isLoading = false;
      RefContractResponse rep = resp as RefContractResponse;
      if (rep.messageTraitement != "SUCCES") {
        _loadingSubject.add(
          Loading(
              loading: false, hasError: true, message: rep.messageTraitement),
        );
        _refContratSubject.add(resp);
      } else {
        _loadingSubject.add(
          Loading(loading: false, hasError: false),
        );
        if (rep != null &&
            rep.listeDesFactures.length > 0 &&
            rep.listeDesFactures != null) {
          List<ListeDesFacture> list = rep.listeDesFactures;
          list.sort((a, b) => DateFormat("dd/MM/yyyy")
              .parse(b.dateLimit)
              .compareTo(DateFormat("dd/MM/yyyy").parse(a.dateLimit)));
          if (list.length > 3) {
            list = list.take(3).toList();
            list.sort((a, b) => DateFormat("dd/MM/yyyy")
                .parse(a.dateLimit)
                .compareTo(DateFormat("dd/MM/yyyy").parse(b.dateLimit)));
          }
          rep.listeDesFactures = list;
          print(jsonEncode(rep.listeDesFactures));
          _refContratSubject.add(resp);
        }
      }
    }).catchError((error) {
      print(error);
      _loadingSubject.add(
        Loading(
            loading: false,
            hasError: true,
            message: "Une erreur c'est produite"),
      );
    });
  }

  Future<void> getUserRefCLient(FormData data) {
    _loadingSubject
        .add(Loading(loading: true, message: "Actualisation en cour..."));
    RequestExtensionGs2e<Login> _rext = RequestExtensionGs2e();
    Future response = _rext.postWithDioInscription(
        'https://eagencesodeci.westeurope.cloudapp.azure.com/inc/mmbr/imp/Ajx_get_RefCli.php', data);
    print("get user ref client");
    response.then((resp) {
      EagenceResponse rep = resp as EagenceResponse;
      if (rep.RefClient == "0") {
        _loadingSubject.add(
          Loading(
              loading: false,
              hasError: true,
              message: "Impossible de charger la référence client"),
        );
      } else {
        print(rep.RefClient);
        EagenceResponse newRep = _userSubject.value;
        newRep.RefClient = rep.RefClient;
        _userSubject.add(newRep);
        getUserInfo(rep.RefClient);
        //_loadingSubject.add(Loading(loading: false,hasError: false,message: "Login ok"),);
      }
    }).catchError((error) {
      print(error);
      _loadingSubject.add(
        Loading(
            loading: false, hasError: true, message: "Erreur sur le réseau"),
      );
    });
  }

  Future<void> getUserRefContract() {
    //_loadingSubject.add(Loading(loading: true,message: "Initialisation en cour..."));
    RequestExtensionGs2e<Conventionfacturationbases> _rext =
        RequestExtensionGs2e();
    Future response = _rext.getSaphirV3(
        "jfa_conventionfacturationbases?refClient=${_userSubject.value.RefClient}");
    response.then((resp) {
      SaphirV3Response<Conventionfacturationbases> rep =
          resp as SaphirV3Response<Conventionfacturationbases>;
      if (rep.data == null || rep.data.length == 0) {
        _loadingSubject.add(
          Loading(
              loading: false,
              hasError: true,
              message: "Impossible de charger vos références contrat"),
        );
      } else {
        print(rep.data);
        Utils.saveData(AppConstant.ALL_FACTURE, jsonEncode(rep.data));
        _allFactureSubject.add(rep.data);
        List<String> list = [];

        rep.data.forEach((it) {
          if (!list.contains(it.refcontratv3)) {
            list.add(it.refcontratv3);
          }
        });
        EagenceResponse newRep = _userSubject.value;
        newRep.contracts = list;
        _userSubject.add(newRep);
        _currentRefContratSubject.add(list[0]);
        FilterFactureAndSave();
        _contractsSubject.add(list);
        Utils.saveData(AppConstant.USER_LINK, jsonEncode(newRep));
        _loadingSubject.add(
          Loading(loading: false, hasError: false, message: "Login ok"),
        );
        //getAllFactureForContrat(list[0]);
        //_loadingSubject.add(Loading(loading: false,hasError: false,message: "Login ok"),);
      }
    }).catchError((error) {
      print(error);
      _loadingSubject.add(
        Loading(
            loading: false, hasError: true, message: "Erreur sur le réseau"),
      );
    });
  }

  void FilterFactureAndSave() {
    var list = _allFactureSubject.value;
    int tot = 0;
    list.sort((Conventionfacturationbases a, Conventionfacturationbases b) =>
        new DateFormat("MM/yyyy")
            .parse(b.periodeFacturation)
            .compareTo(new DateFormat("MM/yyyy").parse(a.periodeFacturation)));
    List<Conventionfacturationbases> newList = [];
    list.forEach((it) {
      if (it.refcontratv3 == _currentRefContratSubject.value) {
        print(it.statutPaye);
        newList.add(it);
        if(it.statutPaye.trim() == "Non Payée"){
          tot += double.parse(it.montantFacture).toInt();
        }
      }
    });
    _impaySoldeSubject.add(tot);
    print("yyyyyyyyy $tot");

    print("dddddddddd");
    print(jsonEncode(list));
    print(jsonEncode(newList));
    _factureSubject.add(newList);
  }

  Future<void> getUserInfo(String id) {
    //_loadingSubject.add(Loading(message: "Vérification du client ...",loading: true));
    RequestExtensionGs2e<Contactbases> _rext = RequestExtensionGs2e();
    print("get user info");

    Future response = _rext.getSaphirV3('contactbases?jfaReferenceclient=$id');
    response.then((resp) {
      SaphirV3Response<Contactbases> result =
          resp as SaphirV3Response<Contactbases>;

      if (result.totalItems == 0) {
      } else {
        Utils.saveData(
            AppConstant.USER_INFO, jsonEncode(result.hydraMember[0]));
        _userInfoSubject.add(result.hydraMember[0]);
        getUserRefContract();
      }
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> getUserRefContractRefresh(String newRef) {
    //_loadingSubject.add(Loading(loading: true,message: "Initialisation en cour..."));
    RequestExtensionGs2e<Conventionfacturationbases> _rext =
        RequestExtensionGs2e();
    //Future response = _rext.postWithDioInscription('https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/inc/auth/Ajx_Check_auth_in_DB.php',data);
    //Future response = _rext.postWithDioInscription('http://10.108.34.177/eagence/inc/auth/Ajx_Check_auth_in_DB.php',data);
    Future response = _rext.getSaphirV3(
        "jfa_conventionfacturationbases?refClient=${_userSubject.value.RefClient}");
    response.then((resp) {
      SaphirV3Response<Conventionfacturationbases> rep =
          resp as SaphirV3Response<Conventionfacturationbases>;
      if (rep.data == null || rep.data.length == 0) {
        _loadingSubject.add(
          Loading(
              loading: false,
              hasError: true,
              message: "Impossible de charger vos références contrat"),
        );
      } else {
        print(rep.data);
        Utils.saveData(AppConstant.ALL_FACTURE, jsonEncode(rep.data));
        _allFactureSubject.add(rep.data);
        List<String> list = [];
        rep.data.forEach((it) {
          if (!list.contains(it.refcontratv3)) {
            list.add(it.refcontratv3);
          }
        });
        EagenceResponse newRep = _userSubject.value;
        newRep.contracts = list;
        _userSubject.add(newRep);
        _currentRefContratSubject.add(newRef);
        FilterFactureAndSave();
        //_contractsSubject.add(list);
        Utils.saveData(AppConstant.USER_LINK, jsonEncode(newRep));
        _loadingSubject.add(
          Loading(loading: false, hasError: false, message: "Login ok"),
        );
        //getAllFactureForContrat(list[0]);
        //_loadingSubject.add(Loading(loading: false,hasError: false,message: "Login ok"),);
      }
    }).catchError((error) {
      print(error);
      _loadingSubject.add(
        Loading(
            loading: false, hasError: true, message: "Erreur sur le réseau"),
      );
    });
  }
}
