import "package:flutter/material.dart";
import 'package:sodeci_mobile/ui/alertes/alerte_page.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_menu_page.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_profil_page.dart';
import 'package:sodeci_mobile/ui/contrat/profil/user_profil.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class ContractMenuPage extends StatefulWidget {
  @override
  _ContractMenuPageState createState() => _ContractMenuPageState();
}

class _ContractMenuPageState extends State<ContractMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: SimpleMaterialAppBar(appTitle: "Contrat", context: context),
        body: new Column(
          children: <Widget>[
            buildHeader(name: "Mon contrat & mes infos", icon: "assets/images/PAGE_ACCUEIL/info_utiles_vert.png"),
            new Container(
              margin: EdgeInsets.only(top: 10),
              padding:
              EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Consulter mes infos",
                              icon:
                              "assets/images/CONTRAT/infos/mes_infos_vert.svg"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserProfilPage()),
                            );
                          },
                        ),
                      ),
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Supprimer mes références",
                              icon:
                              "assets/images/CONTRAT/infos/user_remove_vert.svg"),
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
                              name: "Modifier mes infos",
                              icon:
                              "assets/images/CONTRAT/infos/modification_info_vert.svg"),
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ModifyMenuPage()),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                  new SizedBox(height: 30,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Alertes",
                              icon:
                              "assets/images/CONTRAT/infos/alertes_vert.svg"),
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AlertPage()),
                                  );
                          },
                        ),
                      ),
                      new Flexible(
                        child: new Container(width: 60,),
                      ),
                    ],
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
