import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/models/CiviliteItem.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/Login.dart';
import 'package:sodeci_mobile/models/data_response.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/gs2e_civilitebases.dart';
import 'package:sodeci_mobile/models/saphirV3/saphirv3_response.dart';
import 'package:sodeci_mobile/utils/requestExtension.dart';
import 'package:dio/dio.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';


class InscriptionBloc{
  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<EagenceResponse> get connectUser => _connectUserSubject.stream;
  final _connectUserSubject = BehaviorSubject<EagenceResponse>();

  Stream<List<IndicatifItem>> get indicatifStream => _indicatifSubject.stream;
  final _indicatifSubject = BehaviorSubject<List<IndicatifItem>>();

  Stream<List<Civilitebases>> get civiliteStream => _civiliteSubject.stream;
  final _civiliteSubject = BehaviorSubject<List<Civilitebases>>();

  Stream<List<Contactbases>> get contactStream => _contactSubject.stream;
  final _contactSubject = BehaviorSubject<List<Contactbases>>();
  BehaviorSubject<List<Contactbases>> get contactSubjet => _contactSubject;




  InscriptionBloc(){
    //_loadingSubject.add(Loading(loading: false));
  }

  Future<void> inscriptUser(FormData data){
    _loadingSubject.add(Loading(message: "Inscription en cours ...",loading: true));
    print(jsonEncode(data.toString()));
    RequestExtensionGs2e<Login> _rext = RequestExtensionGs2e();

    Future response = _rext.postWithDioInscription(RequestExtensionGs2e.url_eagence+"inc/pages/inscr/Ajx_Send_Data_String_Inscr.php",data);
    response.then((resp){
      EagenceResponse rep = resp as EagenceResponse;
      if(rep.refIndividu == ""){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Inscription echoué"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Inscription effectué"),);
      }
      _connectUserSubject.add(resp as EagenceResponse);
    }).catchError((error){
      print(error);
    _loadingSubject.add(Loading(loading: false,hasError: true,message: "Inscription echoué"),);
    });

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
        //_loadingSubject.add(Loading(loading: false,hasError: false));
        _indicatifSubject.add((resp as DataResponse<IndicatifItem>).Tab_Indicatif);
        getAllCivilite();
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });

  }

  /*Future<void> getAllCivilite(){
    //_loadingSubject.add(Loading(message: "Initialisation en cours",loading: true));
    RequestExtension<CiviliteItem> _rext = RequestExtension();

    Future response = _rext.getNew('getAllCivility');
    response.then((resp){
      _loadingSubject.add(Loading(loading: false,hasError: false));
      _civiliteSubject.add((resp as DataResponse<CiviliteItem>).items);
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true));
    });
  }*/

  Future<void> getAllCivilite(){
    //_loadingSubject.add(Loading(message: "Initialisation en cours",loading: true));
    RequestExtensionGs2e<Civilitebases> _rext = RequestExtensionGs2e();

    Future response = _rext.getSaphirV3('gs2e_civilitebases');
    response.then((resp){
      _loadingSubject.add(Loading(loading: false,hasError: false));
      _civiliteSubject.add((resp as SaphirV3Response<Civilitebases>).hydraMember);
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  Future<void> checkId(String id){
    _loadingSubject.add(Loading(message: "Vérification du client ...",loading: true));
    RequestExtensionGs2e<Contactbases> _rext = RequestExtensionGs2e();

    Future response = _rext.getSaphirV3('contactbases?jfaReferenceclient=$id');
    response.then((resp){
      SaphirV3Response<Contactbases> result = resp as SaphirV3Response<Contactbases>;

      if(result.totalItems == 0){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Reference invalide"));
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false));
        _contactSubject.add(result.hydraMember);
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

}