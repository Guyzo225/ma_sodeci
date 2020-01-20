import "package:flutter/material.dart";
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool _acceptAll = false;

  bool _alertFacture = true;
  bool _evenement_reseau = false;
  bool _astuce_eco_energi = false;
  bool _info_produit = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: simpleAppBar(appTitle: "Autres services", context: context),
          body: Column(
            children: <Widget>[
              buildHeader(
                  name: "Alertes",
                  icon: "assets/images/CONTRAT/infos/alertes_vert.png"),
              Expanded(
                child: new Container(
                  padding: EdgeInsets.all(20),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(5),
                        width: double.maxFinite,
                        decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                                child: new Text(
                                  "J'accepte de récevoir toutes les alertes mentionné ci-dessous.",
                                  style: TextStyle(fontSize: 14),)),
                            new Checkbox(
                                value: _acceptAll,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptAll = value;
                                  });
                                })
                          ],
                        ),
                      ),
                      new SizedBox(height: 20,),
                      new Expanded(child: new ListView(
                        children: <Widget>[
                          alertItem("Alert Factures",
                              "J'accepte de recévoir des communications par voix électronique sur les alertes factures",
                              _alertFacture),
                          alertItem("Evenements sur le réseau",
                              "J'accepte de recévoir des communications par voix électronique sur les evenements impactant le réseau d'eau et autres actualités",
                              _evenement_reseau),
                          alertItem("Astuces Eco energie",
                              "J'accepte de recévoir des communications par voix électronique sur les astuce eco énergie, les riques et les consigne de sécurité",
                              _astuce_eco_energi),
                          alertItem("Infos produits",
                              "J'accepte de recévoir des communications par voix électronique sur des offres de produits ou service de la SODECI, ou des filiales du groupe",
                              _info_produit)
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget alertItem(String title, String message, bool valeur) {
    return new Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey)
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
            width: double.maxFinite,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey.shade200, Colors.grey.shade100, Colors.white
                ])
            ),
            child: new Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),),
          ),
          new Container(width: double.maxFinite, height: 1, color: Colors.grey,),
          Padding(
            padding: EdgeInsets.only(top: 5,left: 5,right: 5),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                    child: new Text(
                      message,
                      style: TextStyle(fontSize: 10),)),
                new Checkbox(
                    value: valeur,
                    onChanged: (value) {
                      setState(() {
                        valeur = value;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
