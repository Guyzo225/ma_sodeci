import 'dart:convert';

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

class ModifyProfilBloc {

  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<EagenceResponse> get userStream => _userSubject.stream;
  final _userSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get userSubject => _userSubject;

  Stream<Contactbases> get userInfoStream => _userInfoSubject.stream;
  final _userInfoSubject = BehaviorSubject<Contactbases>();
  BehaviorSubject<Contactbases> get  userInfoSubject => _userInfoSubject;

  Stream<List<IndicatifItem>> get indicatifStream => _indicatifSubject.stream;
  final _indicatifSubject = BehaviorSubject<List<IndicatifItem>>();


  ModifyProfilBloc(){
    Utils.getData(AppConstant.USER_LINK).then((value) {
      if (value != null) {
        //print(jsonEncode(EagenceResponse.fromJson(jsonDecode(value))));
        _userSubject.add(EagenceResponse.fromJson(jsonDecode(value)));
      }
    });

    Utils.getData(AppConstant.USER_INFO).then((value) {
      if (value != null) {
        _userInfoSubject.add(Contactbases.fromJson(jsonDecode(value)));
      }
    });

    getAllIndicatif();

  }

  Future<void> getAllIndicatif(){
    _loadingSubject.add(Loading(message: "Initialisation en cours",loading: true));
    RequestExtensionGs2e<IndicatifItem> _rext = RequestExtensionGs2e();

    Future response = _rext.getIndicatif2(RequestExtensionGs2e.url_eagence + 'Ajx_Load_Ind.php',false);
    response.then((resp){
      //_loadingSubject.add(Loading(loading: false));
      var result = resp as DataResponse<IndicatifItem>;
      if(result.Tab_Indicatif == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Impossible de récuperer les indicatifs"));
      }else {
        print("indicatif::::::");
        print((resp as DataResponse<IndicatifItem>).Tab_Indicatif);
        _loadingSubject.add(Loading(loading: false,hasError: false));
        _indicatifSubject.add((resp as DataResponse<IndicatifItem>).Tab_Indicatif);
      }

    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });

  }

  Future<void> updateUser(FormData data){
    print(data.fields);
    _loadingSubject.add(Loading(message: "Mise a jour en cours ...",loading: true));
    print(jsonEncode(data.toString()));
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();

    Future response = _rext.postWithDioInscription(RequestExtensionGs2e.url_eagence+"inc/acc/Ajx_Send_Data_String_Update_Indiv_eagence.php",data);
    response.then((resp){
      print(jsonEncode(resp));
      print("ici");
      EagenceResponse rep = resp as EagenceResponse;
      if(rep.refIndividu == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Mise à jour du profil échouée"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Mise à jour du profil effectuée"),);
      }
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Mise à jour échouée"),);
    });

  }

}