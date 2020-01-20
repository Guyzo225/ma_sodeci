import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/ui/incident/incident_reseau_form_page.dart';
import 'package:sodeci_mobile/ui/incident/incident_reseau_form_page_new.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IncidentReseauPage extends StatefulWidget {
  @override
  _IncidentReseauPageState createState() => _IncidentReseauPageState();
}

class _IncidentReseauPageState extends State<IncidentReseauPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle(),
          ),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(name: "Incident sur le réseau", icon: "assets/images/SIGNALER_UN_INCIDENT/cam_vert.svg"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Aidez-nous à améliorer la qualité de service en signalant ici, les incidents que vous observez sur le réseau",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 5,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Type d'incident",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            height: 5,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 170,
                      child: GridView(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 15 / 10),
                        children: <Widget>[
                          GestureDetector(
                            child: buildIncidentType(name: "Eau potable",icon: "assets/images/SIGNALER_UN_INCIDENT/eau_potable.svg"),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IncidentReseauFormNewPage(type: 1,)));
                            },
                          ),
                          GestureDetector(
                            child: buildIncidentType(name: "Assainissement",icon: "assets/images/SIGNALER_UN_INCIDENT/assainissement.svg"),
                            onTap: (){
                              print("ici");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IncidentReseauFormNewPage(type: 2,)));
                            },
                          ),
                          GestureDetector(
                            child: buildIncidentType(name: "Fraude",icon: "assets/images/SIGNALER_UN_INCIDENT/fraude.svg"),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IncidentReseauFormNewPage(type: 3,)));
                            },
                          ),
                        ],
                      ),
                    )
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
  Widget buildIncidentType({String name, String icon,int index,BuildContext ctx}) {
    return Center(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(color_primary), width: 1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon,
                  height: 30,
                  width: 30,
                  color: Color(color_primary),
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              name == null ? "Eclairage Public" : name,
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 10),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
