import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class MonCompteurPage extends StatefulWidget {
  @override
  _MonCompteurPageState createState() => _MonCompteurPageState();
}

class _MonCompteurPageState extends State<MonCompteurPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle(),
          ),
          leading: InkWell(child: Icon(Icons.arrow_back),splashColor: Color(color_primary),onTap: ()=>{Navigator.of(context).pop()},),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Bienvenu sur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(width: 5,),
                  Text("Mon Compteur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),),
                ],
              ),
              Container(
                height: 150,
              ),
              Text("Tout savoir sur votre compteur.", style: TextStyle(fontSize: 16),),
              SizedBox(height: 5,),
              Text("2 astuces à partager.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              /*Expanded(
                child: Container(
                ),
              )*/,
              SizedBox(height: 20,),
              Expanded(
                child: GridView(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 10 / 7, mainAxisSpacing: 10),
                  children: <Widget>[
                    buildIncidentType(name: "Mon index",icon: "assets/images/Compteur3D/index.svg",index: 0,ctx: context),
                    buildIncidentType(name: "Mon suivi\nquotidien",icon: "assets/images/Compteur3D/suivie_conso.svg",index: 1,ctx: context),
                    //buildIncidentType(name: "Mon solde*"),
                    //buildIncidentType(name: "Ma puissance"),
                    //buildIncidentType(name: "Plus d'infos"),
                  ],
                ),
              ),
              //Align(child: Text("* réservé aux clients prépayés", style: TextStyle(fontSize: 12)), alignment: Alignment.topRight,),
              buildFooter(),
            ],
          ),
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
