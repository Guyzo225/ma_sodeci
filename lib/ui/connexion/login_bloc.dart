import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/Login.dart';
import 'package:sodeci_mobile/models/data_response.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/utils/requestExtension.dart';
import 'package:dio/dio.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';

class LoginBloc {

  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<EagenceResponse> get connectUser => _connectUserSubject.stream;
  final _connectUserSubject = BehaviorSubject<EagenceResponse>();

  Stream<Contactbases> get userInfoStream => _userInfoSubject.stream;
  final _userInfoSubject = BehaviorSubject<Contactbases>();
  BehaviorSubject<Contactbases> get userInfoSubject => _userInfoSubject;


  Stream<String> get userLoginStream => _userLoginSubject.stream;
  final _userLoginSubject = BehaviorSubject<String>();
  BehaviorSubject<String> get userLoginSubject => _userLoginSubject;



  LoginBloc(){
    Utils.getData(AppConstant.USER_INFO).then((value){
      _userInfoSubject.add(Contactbases.fromJson(jsonDecode(value)));
    });

    Utils.getData(AppConstant.USER_LOGIN).then((value){
      _userLoginSubject.add(value);
    });
  }

  Future<void> logUser(FormData data){
    _loadingSubject.add(Loading(loading: true,message: "Connexion en cour..."));
    RequestExtensionGs2e<Login> _rext = RequestExtensionGs2e();
    //Future response = _rext.postWithDioInscription('https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/inc/auth/Ajx_Check_auth_in_DB.php',data);
    //Future response = _rext.postWithDioInscription('http://10.108.34.177/eagence/inc/auth/Ajx_Check_auth_in_DB.php',data);
    Future response = _rext.postWithDioInscription('https://eagencesodeci.westeurope.cloudapp.azure.com/inc/auth/Ajx_Check_auth_in_DB.php',data);
    response.then((resp){
      EagenceResponse rep = resp as EagenceResponse;
      if(rep.valeur  == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Paramètre incorrect"),);
      }else {
        print(rep.idUser);
        debugPrint("xxxxxxxxxxxxxxxx");
        Utils.saveData(AppConstant.USER_LINK, jsonEncode(rep));
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Login ok"),);
      }
      _connectUserSubject.add(resp as EagenceResponse);
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Erreur sur le réseau"),);
    });

  }

}