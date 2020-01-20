import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/ui/connexion/login_page.dart';
import 'package:sodeci_mobile/ui/contact/contact_page.dart';
import 'package:sodeci_mobile/ui/incident/signaler_incident_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/infos_utiles_page.dart';
import 'package:sodeci_mobile/ui/mon_compteur/mon_compteur_page.dart';
import 'package:sodeci_mobile/ui/reseau_agence/reseau_agence.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_facture_page.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset("assets/images/PAGE_ACCUEIL/bg_sodeci_3.png",width: double.maxFinite,fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              // Infos utiles
                              child: _menuButton(
                                  name: "Infos utiles",
                                  icon: "assets/images/PAGE_ACCUEIL/info_utiles_vert.svg"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InfosUtilesPage()),
                                );
                              },
                            ),
                          ),
                          Expanded(
                              child: new GestureDetector(
                                  child: _menuButton(
                                      name: "Réseau d'agences",
                                      icon:"assets/images/PAGE_ACCUEIL/reseau_agence_vert.svg"),
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReseauAgence()),
                                  )

                                },
                              ),

                          ),
                          Expanded(
                            child: GestureDetector(
                              child: _menuButton(
                                  name: "Signaler\nun incident",icon: "assets/images/PAGE_ACCUEIL/signaler_un_incident_vert.svg"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignalerIncidentPage()));
                              },
                            ),
                          ),
                            ],
                          ),
                          new SizedBox(height: 15,),
                          Expanded(
                              child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  child: _menuButton(
                                      name: "Simulation",
                                      icon: "assets/images/PAGE_ACCUEIL/simulation_vert.svg"),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPage()));
                                  },
                                ),
                              ),
                              Expanded(
                                  child: GestureDetector(
                                child: _menuButton(name: "Mon Compteur",icon: "assets/images/PAGE_ACCUEIL/compteurAR_vert.svg"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MonCompteurPage()));
                                },
                              )),
                              Expanded(
                                  child: GestureDetector(
                                child: _menuButton(
                                    name: "Contacts",
                                    icon: "assets/images/PAGE_ACCUEIL/contact_vert.svg"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ContactPage()));
                                },
                              )),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: GestureDetector(
                      child: _loginButton(),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _menuButton({String name, String icon}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(color_primary))

          ),
          child: SvgPicture.asset(
            icon,
            height: 30,
            width: 30,
            color: Colors.red,
          ),
        ),
          SizedBox(
            height: 5,
          ),
          Text(
            name == null ? "Infos utiles" : name,
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12,),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  // Bouton de connexion
  Widget _loginButton() {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.green.shade400,
              Colors.green.shade400,
              Colors.green,
            ]
          )
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Center(child: Icon(FontAwesomeIcons.userLock, color: Colors.white)),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 2,
              color: Colors.white,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("CONNEXION",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Accéder aux services",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
