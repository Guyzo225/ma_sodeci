import 'package:flutter/material.dart';

class MesFacturesPage extends StatefulWidget {
  @override
  _MesFacturesPageState createState() => _MesFacturesPageState();
}

class _MesFacturesPageState extends State<MesFacturesPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            "Mes factures",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildFactureCell(regle: true),
                _buildFactureCell(),
                _buildFactureCell(),
                _buildFactureCell(),
                _buildFactureCell(regle: true),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFactureCell({bool regle = false}){
    return Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                regle ? Container() : Icon(Icons.warning, size: 16, color: Colors.red,),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Ref: 0000123421312"),
                      SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                          Expanded(child: Text("20 000 F")),
                          Text("${!regle ? "Délai" : "Payé le"}: 31/10/2019", style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 1,
                      color: Colors.grey[300],
                      height: 40,
                    ),
                    SizedBox(width: 5,),
                    Column(
                      children: <Widget>[
                        Text(!regle ? "Facture" : "Reçu", style: TextStyle(fontSize: 12),),
                        Icon(Icons.file_download, size: 20,),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 5,),
                regle ? Container() : Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                  color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(
                    "Régler",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
