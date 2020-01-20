import 'package:dio/dio.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/models/UrlPayement.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';

class ConsommationBloc {
  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();

  Stream<UrlPayement> get paymentStream => _payementSubject.stream;
  final _payementSubject = BehaviorSubject<UrlPayement>();
  BehaviorSubject<UrlPayement> get payementSubject => _payementSubject;

  LoginBloc(){
    //_loadingSubject.add(false);

  }

  Future<void> makePayement(FormData data){
    String url = "inc/mmbr/imp/aggregator_pay.php";
    _loadingSubject.add(Loading(message: "Intialisation du payement ...",loading: true));

    RequestExtensionGs2e<UrlPayement> _rext = RequestExtensionGs2e();

    Future response = _rext.postWithEAgence(url,data);
    response.then((resp){
      UrlPayement rep = resp as UrlPayement;
      if(rep.url == "#"){
        _loadingSubject.add(Loading(loading: false,hasError: true,message: rep.description ?? "Impossible d'initier le payemet"),);

      }else {
        _loadingSubject.add(Loading(loading: false,hasError: false),);
        _payementSubject.add(rep);
      }

    }).catchError((error){
      print(error);
      _loadingSubject.add(Loading(loading: false,hasError: true,message: "Une erreur c'est produite"),);
    });

  }
}