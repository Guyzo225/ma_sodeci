import 'package:flutter/material.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class EcrivezNousPage extends StatefulWidget {
  @override
  _EcrivezNousPageState createState() => _EcrivezNousPageState();
}

class _EcrivezNousPageState extends State<EcrivezNousPage> {




  String motif = "Manque d'eau";


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
            buildHeader(name: "Ecrivez-nous", icon: "assets/images/CONTACTS/ecrivez_nous_vert.png"),
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    _buildFormEditRow("Nom*", "Saisir vos nom et prénom(s)"),
                    _buildFormEditRow("Email*", "Saisir votre adresse mail"),
                    _buildFormEditRow("Téléphone*", "Saisir votre numéro de téléphone"),
                    _buildFormEditRow("Identifiant*", "9 chiffres", info: true, onTap: (){
                      Utils.showIdDialog(context);
                    }),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Motif *", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                              SizedBox(width: 10,),
                              Flexible(
                                child: new DropdownButton(
                                  items:
                                  <String>['Manque d\'eau', 'Baise de pression', 'Reclamation commerciale','Réclamation assainissement','Demande d\'information'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value, ),
                                    );
                                  }).toList(),
                                  value: motif,
                                  onChanged: (String value) {
                                    setState(() {
                                      motif = value;
                                    });
                                  },
                                  //style: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    // Motif
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Votre message", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("Nombre restant de caractères autorisé : 1000", style: TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic, fontSize: 13)),
                          SizedBox(height: 10,),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: TextField(
                                style: TextStyle(fontSize: 13),
                                decoration: InputDecoration(
                                  hintText: "Renseignez ici votre besoin ... *",
                                  hintStyle: TextStyle(fontSize: 13),
                                  border: InputBorder.none
                                ),
                                maxLines: 7,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          /*Text("Pièces jointes", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "PDF-JPEG-PNG-GIF",
                                  ),
                                ),
                              ),
                              MaterialButton(
                                color: Colors.orange,
                                child: Text("AJOUTER", style: TextStyle(color: Colors.white),),
                                onPressed: (){
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("* Nombre max de fichiers autorisés : 3", style: TextStyle( fontStyle: FontStyle.italic, fontSize: 13)),*/
                          SizedBox(height: 10,),
                          //Text("Gagner du temps en nous partageant votre localisation", style: TextStyle(color: Colors.green, fontStyle: FontStyle.italic, fontSize: 13)),
                          //SizedBox(height: 15,),
                          /*Row(
                            children: <Widget>[
                              Icon(Icons.map, color: Colors.grey),
                              SizedBox(width: 10,),
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
                          ),*/
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              MaterialButton(
                                color: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                  child: Text("ANNULER", style: TextStyle(color: Colors.white),),
                                ),
                                onPressed: (){
                                },
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              MaterialButton(
                                color: Colors.blue.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                  child: Text("ENVOYER", style: TextStyle(color: Colors.white),),
                                ),
                                onPressed: (){
                                },
                              )
                            ],
                          )
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

  Column buildContactsCell() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Siege social",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                "1, Avenue Christiani Treichville",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          color: Colors.black,
          height: 0.7,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildFormEditRow(String label, String hintText, {TextEditingController controller,TextInputType keyBoardType,bool info = false, Function onTap}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Text(label, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Expanded(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none
                  ),
                ),
              ),
              !info ? Container() : GestureDetector(
                child: Icon(Icons.help, color: Colors.green,),
                onTap: onTap,
              )
            ],
          ),
        ),
        SizedBox(height: 5,),
        Container(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
