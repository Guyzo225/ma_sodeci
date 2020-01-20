
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/StatusDemande.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';

class HistoriqueDemandeBloc {


  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<EagenceResponse> get userStream => _userSubject.stream;
  final _userSubject = BehaviorSubject<EagenceResponse>();

  Stream<List<String>> get statusDemandesStream => _statusDemandeSubject.stream;
  final _statusDemandeSubject = BehaviorSubject<List<String>>();
  BehaviorSubject<List<String>> get statusDemandeSubject => _statusDemandeSubject;

  Stream<List<String>> get listDemandesStream => _listDemandeSubject.stream;
  final _listDemandeSubject = BehaviorSubject<List<String>>();
  BehaviorSubject<List<String>> get listDemandeSubject => _listDemandeSubject;

  Stream<List<String>> get listAllDemandesStream => _listAllDemandesSubject.stream;
  final _listAllDemandesSubject = BehaviorSubject<List<String>>();
  BehaviorSubject<List<String>> get listAllDemandesSubject => _listAllDemandesSubject;

  Stream<bool> get isRefreshStream => _isRefreshSubject.stream;
  final _isRefreshSubject = BehaviorSubject<bool>();
  BehaviorSubject<bool> get isRefreshSubject => _isRefreshSubject;

  HistoriqueDemandeBloc(){
    Utils.getData(AppConstant.USER_LINK).then((value) {
      if (value != null) {
        _userSubject.add(EagenceResponse.fromJson(jsonDecode(value)));
        getListDemande();
      }
    });
    _isRefreshSubject.add(false);
  }



  Future<void> getListDemande(){
    print("geting Motif");

    if(!_isRefreshSubject.value){
      _loadingSubject.add(Loading(message: "Chargement des demande en cours ...",loading: true));
    }

    RequestExtensionGs2e<EagenceResponse> _rext = RequestExtensionGs2e();
    Future response = _rext.getSimple(RequestExtensionGs2e.url_eagence+"inc/mmbr/Ajx_List_All_v3_DmdList_User.php?Id_Individu=${_userSubject.value.idUser}");
    response.then((resp){
      EagenceResponse result = resp as EagenceResponse;

      if(result.Tab_My_Demandes == null){
        if(!_isRefreshSubject.value){
          _loadingSubject.add(Loading(loading: false,hasError: true,message: "Initialisation impossible"));
        }else {
          _isRefreshSubject.add(false);
        }

      }else {
        _listDemandeSubject.add(result.Tab_My_Demandes);
        _listAllDemandesSubject.add(result.Tab_My_Demandes);
        _listDemandeSubject.value.forEach((it) async{
          await getStatusDemande(it);
        });
        if(!_isRefreshSubject.value){
          _loadingSubject.add(Loading(loading: false,hasError: false));
        }else{
          _isRefreshSubject.add(false);
        }

      }
    }).catchError((error){
      if(!_isRefreshSubject.value){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
      }else{
        _isRefreshSubject.add(false);
      }
    });
  }

  Future<void> getStatusDemande(String num){
    print("geting status demande");
    print(num);
    RequestExtensionGs2e<StatusDemande> _rext = RequestExtensionGs2e();
    Future response = _rext.getSimple("https://apinmpfea.sodeci.ci/SODECIEAGENCE_EAGENCE/api/eagence/statutdemande?NumDemande=$num");
    response.then((resp){
      StatusDemande result = resp as StatusDemande;
      print("geting status demande");
      if(result.codeTraitement == null ){
        //_loadingSubject.add(Loading(loading: false,hasError: true,message: "Impossible d'avoir le status"));
      }else {
        List<String> list = [];
        if(_statusDemandeSubject.value != null){
          list = _statusDemandeSubject.value;
          list.add(result.messageTraitement);
        }
        else {
          list.add(result.messageTraitement);

        }
        _statusDemandeSubject.add(list);
        _isRefreshSubject.add(false);
      }
    }).catchError((error){
      if(!_isRefreshSubject.value){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: error.toString()));
      }else{
        _isRefreshSubject.add(false);
      }

    });
  }

  void filterList(String req){
    List<String> list = [];
    if(req.isNotEmpty){
      if(_listAllDemandesSubject.value.length > 0) {
        list = _listAllDemandesSubject.value.where((it) => it.toLowerCase().contains(req.toLowerCase())).toList();
        _listDemandeSubject.add(list);
      }
    }else {
      _listDemandeSubject.add(_listAllDemandesSubject.value);
    }


  }
}