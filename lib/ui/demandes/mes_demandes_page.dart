import 'package:flutter/material.dart';
import 'package:sodeci_mobile/page_interaction_listener.dart';

class MesDemandesPage extends StatefulWidget {
  final PageInteractionListener listener;

  const MesDemandesPage({this.listener});

  @override
  _MesDemandesPageState createState() => _MesDemandesPageState();
}

class _MesDemandesPageState extends State<MesDemandesPage> {
  var services = [
    "J’EMMENAGE, JE VEUX DE L’EAU, JE VEUX UN COMPTEUR",
    "JE DEMENAGE, JE QUITTE LA MAISON, JE NE VEUX PLUS D’EAU",
    "JE VEUX MODIFIER LES INFORMATIONS PERSONNELLES DE MON CONTRAT",
    "JE VEUX PLUS D’EAU OU MOINS D'EAU",
    "PRENDRE UN RENDEZ-VOUS"
  ];

  var servicesColors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.grey
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: _buildServiceCell(
                        services[index],
                        servicesColors[index],
                      ),
                      onTap: () => widget.listener.updatePage(4),
                    );
                  },
                  itemCount: services.length,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Mes factures",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          _buildDemandeCell(),
                          _buildDemandeCell(),
                          _buildDemandeCell(),
                          _buildDemandeCell(),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildDemandeCell() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Text("Demande N° 2142314")),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  )),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Suivi",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _buildServiceCell(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: Colors.blue),
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/noimage.png",
                width: 500,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  color: color),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 12,
                  ),
                  Expanded(
                      child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
