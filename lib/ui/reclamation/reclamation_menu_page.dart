import "package:flutter/material.dart";
import 'package:sodeci_mobile/ui/incident/signaler_incident_page.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class ReclamationtMenuPage extends StatefulWidget {
  @override
  _ReclamationtMenuPageState createState() => _ReclamationtMenuPageState();
}

class _ReclamationtMenuPageState extends State<ReclamationtMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: SimpleMaterialAppBar(appTitle: "Espace personnel", context: context),
        body: new Column(
          children: <Widget>[
            buildHeader(name: "Réclamation et incidents", icon: "assets/images/ESPACE_PERSONNEL/Reclamations/file.png"),
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
                              name: "Signaler un incdent",
                              icon:
                              "assets/images/ESPACE_PERSONNEL/Reclamations/signaler_incident_vert.svg"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignalerIncidentPage()),
                            );
                          },
                        ),
                      ),
                      new Flexible(
                        child: GestureDetector(
                          // Infos utiles
                          child: menuButtonConnected(
                              name: "Faire une réclamation",
                              icon:
                              "assets/images/ESPACE_PERSONNEL/Reclamations/reclamations_vert.svg"),
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
                              name: "Historique",
                              icon:
                              "assets/images/ESPACE_PERSONNEL/Reclamations/historiques_vert.svg"),
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
