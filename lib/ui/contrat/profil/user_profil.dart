import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/ui/contrat/profil/profil_bloc.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserProfilPage extends StatefulWidget {
  @override
  _UserProfilPageState createState() => _UserProfilPageState();
}

class _UserProfilPageState extends State<UserProfilPage> {






  ProfilBloc _bloc = new ProfilBloc();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Contrat"),
          centerTitle: true,
          leading: new InkWell(
            splashColor: Colors.orange,
            child: new Icon(Icons.arrow_back),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: new Column(
          children: <Widget>[
            buildHeader(
                name: "Mes infos",
                icon:
                "assets/images/CONTRAT/infos/mes_infos_vert.png"),
            new Expanded(child: new ListView(
              children: <Widget>[
                StreamBuilder<Contactbases>(
                  stream: _bloc.userInfoStream,
                  builder: (context, snapshot) {
                    return new Container(
                      margin: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.grey,width: 1)
                      ),
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Icon(FontAwesomeIcons.userCircle,color: Color(color_primary),),
                                new SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: new Text("Mes infos personnelles",style: TextStyle(color: Color(color_primary)),),
                                )
                              ],
                            ),
                          ),
                          new Container(height: 2,color: Colors.grey,),
                          new Container(
                            padding: EdgeInsets.all(8),
                            child: new Column(
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    new Text("Nom :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text(snapshot.data != null ? snapshot.data.lastname : "Aucun",)
                                  ],
                                ),
                                new SizedBox(height: 10,),
                                new Divider(height: 1,),
                                new SizedBox(height: 10,),
                                new Row(
                                  children: <Widget>[
                                    new Text("Prenoms :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text(snapshot.data != null ? snapshot.data.firstname : "Aucun",)
                                  ],
                                ),
                                new SizedBox(height: 10,),
                                new Divider(height: 1,),
                                new SizedBox(height: 10,),
                                new Row(
                                  children: <Widget>[
                                    new Text("Telephone :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text(snapshot.data != null && snapshot.data.mobilephone != null ? snapshot.data.mobilephone : "Aucun",)
                                  ],
                                ),
                                new SizedBox(height: 10,),
                                new Divider(height: 1,),
                                new SizedBox(height: 10,),
                                new Row(
                                  children: <Widget>[
                                    new Text("E-mail :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text(snapshot.data != null && snapshot.data.emailaddress1 != null ? snapshot.data.emailaddress1 : "Aucun",)
                                  ],
                                ),
                                new SizedBox(height: 5,),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
                new SizedBox(height: 30,),
                new Container(
                  margin: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.grey,width: 1)
                  ),
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(FontAwesomeIcons.suitcase,color: Color(color_primary),),
                            new SizedBox(width: 10,),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: new Text("Mes infos contractuelles",style: TextStyle(color: Color(color_primary)),),
                            )
                          ],
                        ),
                      ),
                      new Container(height: 2,color: Colors.grey,),
                      StreamBuilder<Contactbases>(
                        stream: _bloc.userInfoStream,
                        builder: (context, snapshot) {
                          return new Container(
                            padding: EdgeInsets.all(8),
                            child: new Column(
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    new Text("Référence client :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text(snapshot.data != null ? snapshot.data.jfaReferenceclient : "Aucun",)
                                  ],
                                ),
                                new SizedBox(height: 10,),
                                new Divider(height: 1,),
                                new SizedBox(height: 10,),
                                new Row(
                                  children: <Widget>[
                                    new Text("Date Abonnement :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text("Incconu",)
                                  ],
                                ),
                                new SizedBox(height: 10,),
                                new Divider(height: 1,),
                                new SizedBox(height: 10,),
                                new Row(
                                  children: <Widget>[
                                    new Text("Diamètre souscrit :",style: TextStyle(fontWeight: FontWeight.bold),),
                                    new SizedBox(width: 10,),
                                    new Text("Inconnu",)
                                  ],
                                ),
                                new SizedBox(height: 5,),
                              ],
                            ),
                          );
                        }
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
