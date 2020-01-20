import 'package:flutter/material.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_bloc.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_facture_page.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_puissance_page.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class SimulationPage extends StatefulWidget {

  final String refContract;

  SimulationPage({key, @required this.refContract}): super(key:key);

  @override
  _SimulationPageState createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {



  SimulationBloc _bloc = new SimulationBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }









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
            buildHeader(
                name: "Simulation de facture",
                icon: "assets/images/PAGE_ACCUEIL/simulation_vert.svg",
                onTap: () {}),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      child: _buildInfoCell(name: "Simulation de facture"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SimulationFacturePage()));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: _buildInfoCell(name: "Simulation de puissance"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SimulateurPuissancePage(),
                          ),
                        );
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
