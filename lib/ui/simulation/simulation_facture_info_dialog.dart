import 'package:flutter/material.dart';

class SimulationFactureInfoDialog extends StatefulWidget {
  @override
  _SimulationFactureInfoDialogState createState() =>
      _SimulationFactureInfoDialogState();
}

class _SimulationFactureInfoDialogState
    extends State<SimulationFactureInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withAlpha(20),
        alignment: Alignment.center,
        padding: EdgeInsets.all(24.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.help,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "À propos du simulateur de facture",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Le simulateur de facture vous permet d'estimer le montant de votre facture en renseignant les principales informations suivantes : ",
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "- votre type de branchement\n- votre puissance souscrite\n- votre consommation (nouvel index - ancien index)",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "La simulation est réalisée sur une période fixe d'un bimestre (2 mois correspondant au cycle normal de facturation). Elle ne prend donc pas en compte les éventuels impacts liés aux factures primes fixes, aux avoirs et aux autres factures complémentaires.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withAlpha(150),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(Icons.close, color: Colors.white, size: 12,),
            )
          ],
        ),
      ),
    );
  }
}
