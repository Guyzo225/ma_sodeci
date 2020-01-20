import 'package:flutter/material.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class SimulateurPuissancePage extends StatefulWidget {
  @override
  _SimulateurPuissancePageState createState() =>
      _SimulateurPuissancePageState();
}

class _SimulateurPuissancePageState extends State<SimulateurPuissancePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle(),
          ),
          leading: buildBackButton(context),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(name: "Simulateur de puissance", iconInfo: Icons.info),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Simulation N° 12321"),
                          ),
                        ],
                      ),
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
