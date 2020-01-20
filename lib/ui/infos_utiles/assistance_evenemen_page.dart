import 'package:flutter/material.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';

class AssistanceEvenementPage extends StatefulWidget {
  @override
  _AssistanceEvenementPageState createState() => _AssistanceEvenementPageState();
}

class _AssistanceEvenementPageState extends State<AssistanceEvenementPage> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.info_outline),
              SizedBox(
                width: 10,
              ),
              Text("Infos utiles")
            ],
          ),
          leading: Icon(Icons.arrow_back),
        ),

        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
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
      padding: const EdgeInsets.only(bottom: 16.0),
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
