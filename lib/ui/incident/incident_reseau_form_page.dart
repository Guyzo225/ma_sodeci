import 'package:flutter/material.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class IncidentReseauFormPage extends StatefulWidget {
  @override
  _IncidentReseauFormPageState createState() => _IncidentReseauFormPageState();
}

class _IncidentReseauFormPageState extends State<IncidentReseauFormPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: new Text("Signaler un incident"),
          ),
          leading: GestureDetector(child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pop(context);
            },),
        ),
        body: Column(
          children: <Widget>[
            //buildHeader(name: "Incident sur le réseau", icon: "assets/images/SIGNALER UN INCIDENT/cam_vert.svg"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[200],
                        padding: EdgeInsets.all(10),
                        child: ListView(
                          children: <Widget>[
                            Text(
                              "Veuillez préciser le problème observé",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text("Problème*", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          hintText: "Choisir",
                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                          border : InputBorder.none
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10,),
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
                                          border: Border.all(color: Colors.green, width: 1),
                                          shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.camera_alt, color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildEditForm(
                                hintText: "Saisir vos nom et prénom(s)"),
                            buildEditForm(
                                hintText: "Saisir votre numéro de téléphone"),
                            buildEditForm(
                                hintText: "Saisir votre adresse email"),
                            Text("Nombre restant de caractères autorisé : 1000",
                                style: TextStyle(fontSize: 13)),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 13),
                                  decoration: InputDecoration(
                                      hintText: "Commentaire ...",
                                      hintStyle: TextStyle(fontSize: 13),
                                      border: InputBorder.none),
                                  maxLines: 7,
                                ),
                              ),
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
                                  value: true,
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
                color: Colors.orange,
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
