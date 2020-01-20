import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/props.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_login_bloc.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_login_page.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_password_page.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_profil_page.dart';
import 'package:sodeci_mobile/ui/demandes/demande_menu_detail.dart';
import 'package:sodeci_mobile/ui/demandes/historique_demande_page.dart';
import 'package:sodeci_mobile/ui/demandes/nouvelle_demande_page.dart';
import 'package:sodeci_mobile/ui/demandes/resiliation_page.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class ModifyMenuPage extends StatefulWidget {
  final Contactbases userInfo;

  ModifyMenuPage({key, @required this.userInfo}) : super(key: key);

  @override
  _DemandeMenuPageState createState() => _DemandeMenuPageState();
}

class _DemandeMenuPageState extends State<ModifyMenuPage> {


  List<Props> _list = [
    Props(id: 1,libelle: "Informations personnelles"),
    Props(id: 2,libelle: "Login"),
    Props(id: 3,libelle: "Mot de passe")
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Menu Modification"),
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
                name: "Modification de profil",
                icon:
                    "assets/images/CONTRAT/infos/modification_info_vert.png"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildSubInfoCell(index: index);
                  },
                  itemCount: _list.length,
                ),
              ),
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubInfoCell({String name, int index}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              gradient: LinearGradient(colors: [
                Colors.grey[300],
                Colors.grey[100],
                Colors.grey[300]
              ])),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.green),
                            borderRadius:
                            BorderRadius.all(Radius.circular(3.0)),
                            color: Colors.white),
                        padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          _list[index].libelle,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstant.MenutextSize),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 6,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        if(_list[index].id == 1){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ModifyProfilPage()),
          );
        }
        else if(_list[index].id == 3){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ModifyPasswordPage()),
          );
        }
        else if(_list[index].id == 2){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ModifyLoginPage()),
          );
        }


      },
    );
  }
}
