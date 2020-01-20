import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:flutter_html/flutter_html.dart';

class MonCompteurInfoPage extends StatefulWidget {

  int index;

  MonCompteurInfoPage({Key key, @required this.index}):super(key:key);

  @override
  _MonCompteurInfoPageState createState() => _MonCompteurInfoPageState();
}

class _MonCompteurInfoPageState extends State<MonCompteurInfoPage> {




  List<String> listOfTips = [
    "comment consulter votre index consommation ?",
    "comment suivre votre consommation au jour le jour ?"
  ];

  List<String> _content = [
    "",
    ""
  ];

  int _currentIndex = 0;
  List<DataReflex> _listAllReflex = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.index);
    //print("xxxxxxxxxxxx");
    _currentIndex = widget.index;
    Utils.getData(AppConstant.ALL_BON_REFLEX).then((value) {
      //print(jsonDecode(value));
      //jsonDecode(value).map((x) => print(x));
      _listAllReflex = List<DataReflex>.from(
          jsonDecode(value).map((x) => DataReflex.fromJson(x)));
      _listAllReflex.forEach((it){
        if(it.rubrique.toLowerCase().contains("ma consommation")){
          for (var i = 0; i < it.sousRubriqueBonReflexesDto.length; i++) {
            var el = it.sousRubriqueBonReflexesDto[i];
            if(el.sousRubrique.toLowerCase() == "suivre ma consommation"){
              setState(() {
                print("icicicicicicicic");
                print(el.conseil[0].conseil);
                //_content = ["",el.conseil[0].conseil ?? ""];
                _content = ["","<p>${el.conseil[0].conseil.replaceAll("font", "div") ?? ""}</p>"];
              });

              break;
            }

          }
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle(),
          ),
          leading: new InkWell(splashColor: Color(color_primary),child: Icon(Icons.arrow_back),onTap: ()=>{Navigator.of(context).pop()},),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Colors.green,
                    child: new GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          "< Précédent",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: (){
                        if(_currentIndex==1){
                          setState(() {
                            _currentIndex--;
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Card(
                    color: Colors.green,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          "Suivant >",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: (){
                        if(_currentIndex==0){
                          setState(() {
                            _currentIndex++;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.green, width: 1),
                          shape: BoxShape.circle),
                      child: Text(
                        "${_currentIndex + 1}",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      listOfTips[_currentIndex],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Html(data: _content[_currentIndex],defaultTextStyle: TextStyle(fontFamily: 'serif',fontSize: 8,fontWeight: FontWeight.normal),),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    /*Text(
                      "Pour obtenir votre  index à 00h la veille composez le code << 451 >> et appuyez sur la touche bleue",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          "Consulter l'ensemble des fonctionnalités",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
              buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCell({String name}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.lightbulb_outline, color: Colors.green),
                    Expanded(
                      child: Text(
                        name == null ? "Tarifs" : name,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 5,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
