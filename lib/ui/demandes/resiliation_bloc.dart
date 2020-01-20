import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/TabEagence.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/DataRefContract.dart';
import 'package:sodeci_mobile/models/saphirV3/ReferenceContractItems.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';


class ResiliationBloc {

  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();
  
  Stream<List<DataRefContract>> get refContractStream => _refContractSubject.stream;
  final _refContractSubject = BehaviorSubject<List<DataRefContract>>();
  BehaviorSubject<List<DataRefContract>> get refContractSubject => _refContractSubject;

  Stream<List<TabEagence>> get motifStream => _motifSubject.stream;
  final _motifSubject = BehaviorSubject<List<TabEagence>>();
  BehaviorSubject<List<TabEagence>> get motifSubject => _motifSubject;

  //SAVED USER FULL
  Stream<Contactbases> get userFromDbStream => _userFromDbSubject.stream;
  final _userFromDbSubject = BehaviorSubject<Contactbases>();
  BehaviorSubject<Contactbases> get userFromDbSubject => _userFromDbSubject;

  Stream<EagenceResponse> get userSimpleStream => _userSimpleSubject.stream;
  final _userSimpleSubject = BehaviorSubject<EagenceResponse>();
  BehaviorSubject<EagenceResponse> get userSimpleSubject => _userSimpleSubject;



  ResiliationBloc(){
    Utils.getData(AppConstant.USER_LINK).then((value){
      _userSimpleSubject.add(EagenceResponse.fromJson(jsonDecode(value)));
    });
    Utils.getData(AppConstant.USER_INFO).then((value){
      _userFromDbSubject.add(Contactbases.fromJson(jsonDecode(value)));
      getAllContract();
    });

  }


  Future<void> getAllMotif(){
    print("geting Motif");
    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();
    Future response = _rext.getSimple(RequestExtensionGs2e.url_eagence +"inc/demandes_membres/Ajx_Load_MotifResiliation_V3.php");
    response.then((resp){
      EagenceResponse result = resp as EagenceResponse;
      if(result.tab == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Impossible de récuperer les motif de résiliation"));
      }
      else {
        _motifSubject.add(result.tab);
        _loadingSubject.add(Loading(loading: false,hasError: false));
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }

  Future<void> getAllContract(){
    print("getAllContract");
    _loadingSubject.add(Loading(message: "Initialisation en cours...",loading: true));
    RequestExtensionGs2e<ReferenceContractItems> _rext = RequestExtensionGs2e();
    Future response = _rext.getSimple(RequestExtensionGs2e.root_url_saphirV3 +"contactbases?contactId=${_userFromDbSubject.value.contactid}");
    response.then((resp){
      ReferenceContractItems result = resp as ReferenceContractItems;
      if(result.data == null){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "Impossible de récuperer les références de l'utilisateur"));
      }
      else {
        _refContractSubject.add(result.data);
        getAllMotif();
        //_loadingSubject.add(Loading(loading: false,hasError: false));
      }
    }).catchError((error){
      _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
    });
  }


  Future<void> sendResiliation(String data){
    _loadingSubject.add(Loading(message: "Soumission en cours ...",loading: true));

    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();
    print(RequestExtensionGs2e.url_eagence+"inc/demandes_membres/resil/Ajx_Send_Data_String.php?$data");
    Future response = _rext.getSimple(RequestExtensionGs2e.url_eagence+"inc/demandes_membres/resil/Ajx_Send_Data_String.php?$data");
    response.then((resp){
      EagenceResponse rep = resp as EagenceResponse;
      if(rep.numDemv3 == null || rep.numDemv3 == "" || rep.numDemv3  == "null"){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: "La demande a échoué. Vérifiez les informations"),);
      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false,message: "Demande soumise avec succès."),);
      }
    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Opération echoué"),);
    });

  }

}