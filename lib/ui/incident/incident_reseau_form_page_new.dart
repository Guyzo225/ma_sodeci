import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class IncidentReseauFormNewPage extends StatefulWidget {


  final int type;

  IncidentReseauFormNewPage({Key key, this.type}):super(key:key);

  @override
  _IncidentReseauFormNewPageState createState() =>
      _IncidentReseauFormNewPageState();
}

class _IncidentReseauFormNewPageState extends State<IncidentReseauFormNewPage> {
  bool isAccepted = false;


  List<String> _listOfType_eau_potable = [
    "fuite avant compteur",
    "fuite après compteur",
    "fuite au robinet d'arrêt",
    "compteur cassé",
    "branchement cassé",
    "compteur volé",
    "compteur calé",
    "manque d'eau",
    "manque d'eau général",
    "autres"
  ];

  List<String> _listOfType_assainissement = [
    "égout bouché",
    "regard sans couvercle",
    "autres",
  ];

  List<String> _listType = [];

  String _currentType = "autres";

  String _title = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.type == 1){
      _listType = _listOfType_eau_potable;
      _currentType = _listOfType_eau_potable[0];
      _title = "Eau potable";
    }else if(widget.type == 2){
      _listType = _listOfType_assainissement;
      _currentType = _listOfType_assainissement[0];
      _title = "Assainissement";
    }else {
      _listType = ["autres"];
      _currentType = "autres";
      _title = "Fraude";
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Center(
            child: new Text("Signaler un incident / $_title",style: TextStyle(fontSize: 15),),
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
            //buildHeader(name: "Incident sur le réseau", icon: "assets/images/SIGNALER UN INCIDENT/cam_vert.svg"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    /*Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.link_off, color: Colors.green)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Branchement dangereux"),
                      ],
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        color: Color(color_gray_light),
                        padding: EdgeInsets.all(10),
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: new TextFormField(
                                style: TextStyle(fontSize: 13),
                                decoration: InputDecoration(
                                  labelText: "Titre de l'Alerte",
                                  hintText: "Saisir le titre",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(color_primary),
                                    ),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      top: 10, left: 5, right: 5, bottom: 10),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Motif *", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                Flexible(
                                  child: new DropdownButton(
                                    items:
                                    _listType.map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value, ),
                                      );
                                    }).toList(),
                                    value: _currentType,
                                    onChanged: (String value) {
                                      setState(() {

                                      });
                                    },
                                    //style: white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Prendre une photo",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Colors.grey[300],
                                              Colors.white,
                                              Colors.grey[300],
                                            ]),
                                            border: Border.all(
                                                color: Colors.green, width: 1),
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.camera_alt,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              style: TextStyle(fontSize: 13),
                              maxLength: 100,
                              decoration: InputDecoration(
                                hintText: "Veuillez décrire l'Alerte photo ...",
                                hintStyle: TextStyle(fontSize: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(color_primary),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                              maxLines: 7,
                            ),
                            /*SizedBox(
                              height: 5,
                            ),
                            Text("Nombre restant de caractères autorisé : 1000",
                                style: TextStyle(fontSize: 13)),*/

                            SizedBox(
                              height: 10,
                            ),
                            new TextFormField(
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                  hintText: "Saisir le contact",
                                  labelText: "Contacts",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(color_primary),
                                    ),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      top: 10, left: 5, right: 5, bottom: 10)),
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Aidez nous à identifier précisement la zone d'intervention",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 11)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.map, color: Colors.grey),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text("Partager ma localisation"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  value: isAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      isAccepted = value;
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MaterialButton(
                color: Color(color_primary),
                minWidth: double.infinity,
                child: Text(
                  "VALIDER",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget buildEditForm({String hintText}) {
    return Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: TextField(
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                  border: InputBorder.none),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildIncidentType({String name}) {
    return Center(
        child: Column(
      children: <Widget>[
        Icon(Icons.link_off, color: Colors.green),
        SizedBox(
          height: 5,
        ),
        Text(
          name == null ? "Eclairage Public" : name,
          style: TextStyle(color: Colors.green),
        )
      ],
    ));
  }
}
