import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/utils/utils.dart';

class ProfilBloc {

  Stream<EagenceResponse> get userStream => _userSubject.stream;
  final _userSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get userSubject => _userSubject;

  Stream<Contactbases> get userInfoStream => _userInfoSubject.stream;
  final _userInfoSubject = BehaviorSubject<Contactbases>();
  BehaviorSubject<Contactbases> get  userInfoSubject => _userInfoSubject;

  ProfilBloc(){
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

  }
}