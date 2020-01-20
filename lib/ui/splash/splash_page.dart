import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/models/DataService.dart';
import 'package:sodeci_mobile/models/DatasDetailCategorieService.dart';
import 'package:sodeci_mobile/models/TokenResponse.dart';
import 'package:sodeci_mobile/models/data_response.dart';
import 'package:sodeci_mobile/ui/accueil/accueil_page.dart';
import 'package:sodeci_mobile/ui/accueil/container_page.dart';
import 'package:sodeci_mobile/utils/requestExtension.dart';
import 'package:sodeci_mobile/utils/requestExtensionGs2e.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connectivity/connectivity.dart';
//import 'package:toast/toast.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  double height = 500;
  double width = 300;
  Color color = Colors.white.withOpacity(0.2);

  bool _haError = false;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    init();

    Future.delayed(Duration(seconds: 1),(){
      height = 300;
      width = 300;
      color = Colors.white;
      setState(() {
      });
    });

    /*Timer timer = Timer.periodic(Duration(seconds: 3), (Timer timer){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContainerPage(), maintainState: false),
      );
      timer.cancel();
    });*/
  }

  void init() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      _getAllBonReflexe();
    }else {
      setState(() {
        _haError = true;
        _errorMessage  = "Veuillez activer votre connexion internet svp";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.green[600],
                Colors.green[400],
                Colors.green[200],
                Colors.green[200],
              ],
            )
          ),
          child: Center(
            child: AnimatedContainer(
              //color: color,
              height: height,
              width: width,
              duration: Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset("assets/images/logo_sodeci.png",width: 200,),
                    SizedBox(height: 30,),
                    _haError ? GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: new Row(
                          children: <Widget>[
                            new Icon(FontAwesomeIcons.redoAlt,color: Color(color_primary),),
                            new SizedBox(width: 30,),
                            Flexible(child: new Text(_errorMessage,style: TextStyle(fontStyle: FontStyle.italic),))
                          ],
                        ),
                      ),
                      onTap: (){
                        _getAllBonReflexe();
                        setState(() {
                          _haError = false;
                        });
                      },
                    ): CircularProgressIndicator()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getAllBonReflexe(){
    RequestExtension<DataReflex> _rext = RequestExtension();
    DataReflex data = new DataReflex();
    Future response = _rext.post('bonReflexe/getByCriteriaBonReflexe',jsonEncode(data.toJson()),true);
    response.then((resp){
      DataResponse<DataReflex> result = resp as DataResponse<DataReflex>;
      if(result.hasError == false){
        Utils.saveData(AppConstant.ALL_BON_REFLEX, jsonEncode(result.itemsBonReflexes));
      }
      _getAllServiceWithDetail();

    }).catchError((error){
      //Utils.showErrorToast(error.toString(), context);
      print(error);
      setState(() {
        _haError = true;
        _errorMessage  = "Impossible d'atteindre le serveur, cliquez pour réésayer";
      });
      //SystemNavigator.pop();
    });
  }

  _getToken(){
    RequestExtensionGs2e _rext = RequestExtensionGs2e();
    Future response = _rext.getToken();
    response.then((resp){
      TokenResponse tokenResponse = resp;
      print("TOKENNNNNN");
      print(tokenResponse.accessToken);
      Utils.saveData(AppConstant.TOKEN_LINK, "${tokenResponse.accessToken}");
      _getAllServiceWithDetail();
    }).catchError((error){
      //Utils.showErrorToast("Une erreur c'est produite", context);
      setState(() {
        _haError = true;
        _errorMessage  = "Impossible d'atteindre le serveur, cliquez pour réésayer";
      });
      //SystemNavigator.pop();
      //_getAllServiceWithDetail();

    });
  }

  _getAllServiceWithDetail(){
    RequestExtension<DataService> _rext = RequestExtension();
    DataService data = new DataService(datasDetailCategorieService: [new DatasDetailCategorieService()]);
    Future response = _rext.post('detailService/getByCriteria',jsonEncode(data.toJson()),true);
    response.then((resp){
      DataResponse<DataService> result = resp as DataResponse<DataService>;
      if(result.hasError == false){
        Utils.saveData(AppConstant.ALL_SERVICE, jsonEncode(result.itemsDetailCategorieService));
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContainerPage(), maintainState: false),
      );

    }).catchError((error){
      //Utils.showErrorToast(error.toString(), context);
      print(error);
      setState(() {
        _haError = true;
        _errorMessage  = "Impossible d'atteindre le serveur, cliquez pour réésayer";
      });
      //SystemNavigator.pop();
    });
  }
}
