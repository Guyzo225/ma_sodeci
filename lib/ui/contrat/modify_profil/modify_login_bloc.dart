import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/data_response.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:dio/dio.dart';

class ModifyLoginBloc {

  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<EagenceResponse> get userStream => _userSubject.stream;
  final _userSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get userSubject => _userSubject;

  Stream<Contactbases> get userInfoStream => _userInfoSubject.stream;
  final _userInfoSubject = BehaviorSubject<Contactbases>();
  BehaviorSubject<Contactbases> get  userInfoSubject => _userInfoSubject;


  Stream<bool> get loginStream => _loginSubject.stream;
  final _loginSubject = BehaviorSubject<bool>();
  BehaviorSubject<bool> get loginSubject => _loginSubject;


  ModifyLoginBloc(){
    Utils.getData(AppConstant.USER_LINK).then((value) {
      if (value != null) {
        _userSubject.add(EagenceResponse.fromJson(jsonDecode(value)));
      }
    });

    Utils.getData(AppConstant.USER_INFO).then((value) {
      if (value != null) {
        _userInfoSubject.add(Contactbases.fromJson(jsonDecode(value)));
      }
    });

    _loginSubject.add(false);

  }

  Future<void> verifyLogin(FormData data,BuildContext ctx,bool isNew){
    //_loadingSubject.add(Loading(message: "Vérification du mot de passe en cours...",loading: true));
    print(data.fields);
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();

    Future response = _rext.postWithDioInscription(RequestExtensionGs2e.url_eagence + 'inc/acc/Ajx_Check_lgn.php',data);
    response.then((resp){
      //_loadingSubject.add(Loading(loading: false));
      var result = resp as EagenceResponse;
      if(isNew){
        if(result.retour == null || result.retour != 0){
          //_loadingSubject.add(Loading(loading: false,hasError: true,message: "Mot de passe incorrect"));
          _loginSubject.add(false);
          Utils.showErrorToast("Login indisponible", ctx);
        }else {
          _loginSubject.add(true);
          //_loadingSubject.add(Loading(hasError: false,loading: false));
        }
      }else {
        if(result.retour == null || result.retour == 0){
          //_loadingSubject.add(Loading(loading: false,hasError: true,message: "Mot de passe incorrect"));
          _loginSubject.add(false);
          Utils.showErrorToast("Login incorrect", ctx);
        }else {
          _loginSubject.add(true);
          //_loadingSubject.add(Loading(hasError: false,loading: false));
        }

      }

    }).catchError((error){
      Utils.showErrorToast(error.toString(), ctx);
      //_loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });

  }

  Future<void> updateLogin(FormData data){
    print(data.fields);
    _loadingSubject.add(Loading(message: "Modification du Login en cours ...",loading: true));
    print(jsonEncode(data.toString()));
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();

    Future response = _rext.postWithDioInscription(RequestExtensionGs2e.url_eagence+"inc/acc/Ajx_Updt_Lgn.php",data);
    response.then((resp){
      print(jsonEncode(resp));
      EagenceResponse rep = resp as EagenceResponse;
      if(rep.refIndividu == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Modification échouée"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Modification effectuée"),);
      }
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Modification échoué"),);
    });

  }

}