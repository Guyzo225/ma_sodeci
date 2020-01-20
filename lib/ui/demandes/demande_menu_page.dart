import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/props.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/ui/demandes/demande_menu_detail.dart';
import 'package:sodeci_mobile/ui/demandes/historique_demande_page.dart';
import 'package:sodeci_mobile/ui/demandes/nouvelle_demande_page.dart';
import 'package:sodeci_mobile/ui/demandes/resiliation_page.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class DemandeMenuPage extends StatefulWidget {
  final Contactbases userInfo;

  DemandeMenuPage({key, @required this.userInfo}) : super(key: key);

  @override
  _DemandeMenuPageState createState() => _DemandeMenuPageState();
}

class _DemandeMenuPageState extends State<DemandeMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Espace Personnel"),
          centerTitle: true,
          leading: new InkWell(
            splashColor: Colors.orange,
            child: new Icon(Icons.arrow_back),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: new Column(
          children: <Widget>[
            buildHeader(
                name: "Demandes",
                icon:
                    "assets/images/ESPACE_PERSONNEL/Demandes/call_unknow.png"),
            new Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Menu des demandes",
                              icon:
                                  "assets/images/ESPACE_PERSONNEL/Demandes/abonnement_branchement_vert.svg"),
                          onTap: () {
                            List<Props> list = [
                              Props(
                                  id: 1,
                                  libelle: "Branchement",
                                  type: AppConstant.TYPE_ABONNEMENT),
                              Props(
                                  id: 2,
                                  libelle: "Abonnement",
                                  type: AppConstant.TYPE_ABONNEMENT),
                              Props(
                                  id: 3,
                                  libelle: "Branchement-Abonnement",
                                  type: AppConstant.TYPE_AB_REABONNEMENT),
                            ];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DemandeMenuDetail(
                                      menuId: 0,
                                      title: "Branchement / Abonnement",
                                      userInfo: widget.userInfo,
                                      nomIcon:
                                          "assets/images/ESPACE_PERSONNEL/Demandes/abonnement_branchement_vert.png",
                                      propsList: list)),
                            );
                            /*print(jsonEncode(widget.userInfo));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NouvelleDemandePage(userInfo: widget.userInfo,)),
                            );*/
                          },
                        ),
                      ),
                      /*new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Modification Branchement",
                              icon:
                                  "assets/images/ESPACE_PERSONNEL/Demandes/modification_branchement_vert.svg"),
                          onTap: () {
                            /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InfosUtilesPage()),
                                  );*/
                          },
                        ),
                      ),*/
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Resiliation",
                              icon:
                              "assets/images/ESPACE_PERSONNEL/Demandes/resiliation_vert.svg"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResiliationPage()),
                            );
                          },
                        ),
                      ),
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Historique",
                              icon:
                              "assets/images/ESPACE_PERSONNEL/Demandes/historiques_vert.svg"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HistoriqueDemandePage()),
                            );
                          },
                        ),
                      ),
                      /*new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Demande de traveaux",
                              icon:
                                  "assets/images/ESPACE_PERSONNEL/Demandes/demande_travaux_vert.svg"),
                          onTap: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ConsommationPage()),
                            );*/
                          },
                        ),
                      ),*/
                    ],
                  ),
                  new SizedBox(
                    height: 30,
                  ),
                  /*new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /*new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Mutation",
                              icon:
                                  "assets/images/ESPACE_PERSONNEL/Demandes/mutation_vert.svg"),
                          onTap: () {
                            /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InfosUtilesPage()),
                                  );*/
                          },
                        ),
                      ),
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Resiliation",
                              icon:
                                  "assets/images/ESPACE_PERSONNEL/Demandes/resiliation_vert.svg"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResiliationPage()),
                            );
                          },
                        ),
                      ),*/
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Historique",
                              icon:
                                  "assets/images/ESPACE_PERSONNEL/Demandes/historiques_vert.svg"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HistoriqueDemandePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),*/
                  new SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
