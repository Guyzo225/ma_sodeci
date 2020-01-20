import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/models/DataService.dart';
import 'package:sodeci_mobile/models/props.dart';
import 'package:sodeci_mobile/ui/infos_utiles/infos_utile_content_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/info_util_menu_page.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfosUtilesPage extends StatefulWidget {
  @override
  _InfosUtilesPageState createState() => _InfosUtilesPageState();
}

class _InfosUtilesPageState extends State<InfosUtilesPage> {
  List<DataReflex> _listAllReflex = [];
  List<DataService> _listAllService = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Utils.getData(AppConstant.ALL_BON_REFLEX).then((value) {
      //print(jsonDecode(value));
      //jsonDecode(value).map((x) => print(x));
      _listAllReflex = List<DataReflex>.from(
          jsonDecode(value).map((x) => DataReflex.fromJson(x)));
    });
    Utils.getData(AppConstant.ALL_SERVICE).then((value) {
      //print(jsonDecode(value));
      //jsonDecode(value).map((x) => print(x));
      _listAllService = List<DataService>.from(
          jsonDecode(value).map((x) => DataService.fromJson(x)));
    });
  }

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
              print('ici');
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(name: "Info utiles", icon: "assets/images/PAGE_ACCUEIL/info_utiles_vert.png"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView(
                  children: <Widget>[
                    //_buildInfoCell(onTap: ()=>{_goToMenu(0, "Tarif")}),
                    _buildInfoCell(
                        name: "Tarifs",
                        onTap: () {
                          List<Props> list = [
                            Props(id: 1, libelle: "Clients mensuels diamètre 15"),
                            Props(id: 2, libelle: "Clients mensuels diamètre > 20"),
                            Props(
                                id: 3, libelle: "Clients trimestriel diamètre 15 "),
                            Props(
                                id: 4, libelle: "Clients trimestriel diamètre > 20 "),
                          ];
                          _goToMenu(0, "Tarif", list, null, null,"assets/images/INFOS_UTILES/tarifs_vert.png");
                        },icon: "assets/images/INFOS_UTILES/tarifs_vert.svg"),
                    _buildInfoCell(
                        name: "Eco geste",
                        onTap: () {
                          List<Props> list = [];
                          _listAllReflex.forEach((f){
                            if(f.rubrique.toLowerCase() != "santé"){
                              list.add(Props(id: f.idRubrique, libelle: f.rubrique));
                            }

                          });
                          _goToMenu(1, "Eco geste", list, _listAllReflex, null,"assets/images/INFOS_UTILES/eco_energie_vert.png");
                        },icon: "assets/images/INFOS_UTILES/eco_energie_vert.svg"),
                    _buildInfoCell(
                        name: "Santé",
                        onTap: () {
                          List<Props> list = [];
                          _listAllReflex.forEach((f) => list.add(
                              Props(id: f.idRubrique, libelle: f.rubrique)));
                          _goToMenu(3, "Santé", list, _listAllReflex, null,"assets/images/INFOS_UTILES/heartbeat.png");
                        },icon: "assets/images/INFOS_UTILES/heartbeat.svg"),
                    /*_buildInfoCell(name: "Santé",onTap: () => {
                      _goToMenu(2,"Eco geste")
                    }),*/
                    _buildInfoCell(
                        name: "Bon à savoir",
                        onTap: () {
                          List<Props> list = [
                            Props(id: 1, libelle: "Nos services"),
                            Props(id: 2, libelle: "Votre branchement"),
                            Props(id: 3, libelle: "Cadre institutionnel "),
                            Props(
                                id: 4, libelle: "Extrait du service concédé "),
                          ];
                          _goToMenu(
                              2, "Bon à savoir", list, null, _listAllService,"assets/images/INFOS_UTILES/bon_a_savoir_vert.png");
                        },icon: "assets/images/INFOS_UTILES/bon_a_savoir_vert.svg"),
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

  _goToMenu(int idMenu, String title, List<Props> list,
      List<DataReflex> listReflex, List<DataService> listService,String icon) {
    if(idMenu != 3){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfoUtilMenuPage(
              menuId: idMenu,
              title: title,
              propsList: list,
              listAllReflex: listReflex,
              listAllService: listService,
              nomIcon: icon,
            )),
      );
    }else {
      List<DataReflex> list = [];
      _listAllReflex.forEach((it){
        if(it.rubrique.toLowerCase() == "santé"){
          list.add(it);
        }
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfosUtilesContentPage(
              id:1,
              idMenu: idMenu,
              showNavButton: true,
              listReflexe: list,

            )),
      );

    }

  }

  Widget _buildInfoCell({String name, Function onTap, String icon}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(color_primary),width: 2)
                        ),
                        child: new SvgPicture.asset(
                          icon,
                          width: 30,
                          height: 30,
                          color: Color(color_primary),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          name == null ? "Branchement" : name,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstant.MenutextSize),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              color: Colors.green,
            )
          ],
        ),
      ),
      onTap: onTap == null ? () {} : onTap,
    );
  }
}
