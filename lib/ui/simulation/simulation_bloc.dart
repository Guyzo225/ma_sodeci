


import 'dart:convert';

import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/DernierIndex.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Contractbase.dart';
import 'package:sodeci_mobile/models/saphirV3/saphirv3_response.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';

class SimulationBloc {
  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<String> get simulationStream => _simulationSubject.stream;
  final _simulationSubject = BehaviorSubject<String>();
  BehaviorSubject<String> get simulationSubject  => _simulationSubject;



  Stream<List<Contractbase>> get contractIdStream => _contractIdSubject.stream;
  final _contractIdSubject = BehaviorSubject<List<Contractbase>>();
  BehaviorSubject<List<Contractbase>> get contractIdSubject  => _contractIdSubject;


  Stream<Contractbase> get currentContractIdStream => _currentContractIdSubject.stream;
  final _currentContractIdSubject = BehaviorSubject<Contractbase>();
  BehaviorSubject<Contractbase> get currentContractIdSubject  => _currentContractIdSubject;


  Stream<Contactbases> get userStream => _userSubject.stream;
  final _userSubject = BehaviorSubject<Contactbases>();
  BehaviorSubject<Contactbases> get userSubject  => _userSubject;


  Stream<int> get dernierIndexStream => _dernierIndexSubject.stream;
  final _dernierIndexSubject = BehaviorSubject<int>();
  BehaviorSubject<int> get dernierIndexSubject  => _dernierIndexSubject;






  SimulationBloc(){
    //_loadingSubject.add(false);
    Utils.getData(AppConstant.USER_INFO).then((value){
      if(value != null){
        _userSubject.add(Contactbases.fromJson(jsonDecode(value)));
        if(_userSubject != null) {
          print(_userSubject.value);
          getIdContrat();
        }

      }
    });


  }

  Future<void> simulate(int difference ){
    _loadingSubject.add(Loading(loading: true,message: "Simulation en cours..."));
    print(_currentContractIdSubject.value);
    RequestExtensionGs2e<String> _rext = RequestExtensionGs2e();
    //Future response = _rext.postWithDioInscription('https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/inc/auth/Ajx_Check_auth_in_DB.php',data);
    //Future response = _rext.postWithDioInscription('http://10.108.34.177/eagence/inc/auth/Ajx_Check_auth_in_DB.php',data);
    Future response = _rext.simulate("jfa_conventionfacturationbases?idContrat=${_currentContractIdSubject.value.contractid}&nConsommation=$difference");
    response.then((resp){
      String rep = resp ;
      if(rep  == ""){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Paramètre incorrecte"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false),);
        print(rep);
        String mont = jsonDecode((rep)).toString().split(new RegExp(r"montant|lignedecompte"))[1];
        print(jsonDecode((rep)).toString().split(new RegExp(r"montant|lignedecompte"))[1]);
        String newString = "";
        String ref = "0123456789";
        for(var i=0; i<mont.length; i++){
          if(ref.contains(mont[i])){
            newString+=mont[i];
          }
        }
        print(newString);
       _simulationSubject.add(newString);

      }
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Erreur sur le réseau"),);
    });

  }

  Future<void> getIdContrat(){
    _loadingSubject.add(Loading(loading: true,message: "Initilaisation en cours..."));
    RequestExtensionGs2e<Contractbase> _rext = RequestExtensionGs2e();
    //Future response = _rext.postWithDioInscription('https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/inc/auth/Ajx_Check_auth_in_DB.php',data);
    //Future response = _rext.postWithDioInscription('http://10.108.34.177/eagence/inc/auth/Ajx_Check_auth_in_DB.php',data);
    Future response = _rext.getSaphirV3("contractbases?customerid=${_userSubject.value.contactid}");
    response.then((resp){
      SaphirV3Response<Contractbase> rep = resp as SaphirV3Response<Contractbase>;
      if(rep.totalItems  == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Une erreur est survenue"),);
      }else {
        print(rep.hydraMember);
        /*for( var i = 0 ; i < rep.hydraMember.length; i++ ) {
          if(rep.hydraMember[i].jfaReferencecontrat == ) {
          }
        }*/
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Login ok"),);
        _contractIdSubject.add(rep.hydraMember);
      }
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Erreur sur le réseau"),);
    });

  }

  Future<void> getLastIndex(String refContrat){
    //_loadingSubject.add(Loading(loading: true,message: "Initilaisation en cours..."));
    RequestExtensionGs2e<DernierIndex> _rext = RequestExtensionGs2e();
    //Future response = _rext.postWithDioInscription('https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/inc/auth/Ajx_Check_auth_in_DB.php',data);
    //Future response = _rext.postWithDioInscription('http://10.108.34.177/eagence/inc/auth/Ajx_Check_auth_in_DB.php',data);
    Future response = _rext.getWithToken("https://apinmpfea.sodeci.ci/SODECIEAGENCE_EAGENCE/api/eagence/dernierindex?RefContrat=$refContrat");
    response.then((resp){
      print("ppppp");
      DernierIndex rep = resp as DernierIndex;
      if(rep.codeTraitement  != 0){
        //_loadingSubject.add(Loading(loading: false,hasError: true,message: "Une erreur est survenue"),);
      }else {
        _dernierIndexSubject.add(rep.dernierindex.round());
      }
    }).catchError((error){
      print(error);
      //_loadingSubject.add(Loading(loading: false,hasError: true,message: "Erreur sur le réseau"),);
    });

  }
}