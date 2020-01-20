import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/ui/incident/incident_reseau_form_page_new.dart';
import 'package:sodeci_mobile/ui/incident/incident_reseau_page.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SignalerIncidentPage extends StatefulWidget {
  @override
  _SignalerIncidentPageState createState() => _SignalerIncidentPageState();
}

class _SignalerIncidentPageState extends State<SignalerIncidentPage> {
  bool assistanceVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle(),
          ),
          leading: GestureDetector(child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.pop(context);
          },),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(name: "Signaler un incident",icon: "assets/images/PAGE_ACCUEIL/signaler_un_incident_vert.png"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      child: _buildInfoCell(name: "Assistance dépannage",icon: "assets/images/SIGNALER_UN_INCIDENT/depannage_vert.svg"),
                      onTap: () {
                        setState(() {
                          assistanceVisible = !assistanceVisible;
                        });
                      },
                    ),
                    !assistanceVisible
                        ? Container()
                        : Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "En cas d'interruption de la fourniture de l'eau, avant de nous contacter, nous vous invitons à vérifier :",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                      "\u2022 si votre robinet d'arret n'est pas fermé\n\u2022  si les voisins ont de l'eau\n"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "si la coupure est  générale (manque d'eau dans le quartier ou cité ou chez le voisin), nous vous invitons à nous contacter sur le bouton suivant:",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Image.asset("assets/images/SIGNALER_UN_INCIDENT/contacts_175_vert.png",width: 30,height: 30,),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Contactez-nous",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      onTap: ()=>{launch("tel://175")},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Dans le cas contraire, nous vous invitons à :",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                      "\u2022 Vérifier si l'ensemble de vos factures ont bien été réglées\n\u2022  Consulter un technicien (plombier) pour établir un diagnostic"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: _buildInfoCell(
                          name: "Signaler un incident sur le réseau",icon: "assets/images/SIGNALER_UN_INCIDENT/cam_vert.svg"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => IncidentReseauPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCell({String name,String icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(color_primary),width: 2)
                      ),
                      child: new SvgPicture.asset(
                          icon,
                          width: 30,
                          height: 30,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        name == null ? "Tarifs" : name,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstant.MenutextSize),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 3,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
