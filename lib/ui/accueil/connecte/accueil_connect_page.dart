import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/ListeDesFacture.dart';
import 'package:sodeci_mobile/models/RefContractResponse.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Conventionfacturationbases.dart';
import 'package:sodeci_mobile/ui/accueil/connecte/acceuil_bloc.dart';
import 'package:sodeci_mobile/ui/consommation/consommation_page.dart';
import 'package:sodeci_mobile/ui/contrat/contrat_menu_page.dart';
import 'package:sodeci_mobile/ui/demandes/demande_menu_page.dart';
import 'package:sodeci_mobile/ui/reclamation/reclamation_menu_page.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:intl/intl.dart';

class AccueilConnectePage extends StatefulWidget {
  @override
  _AccueilConnectePageState createState() => _AccueilConnectePageState();
}

class _AccueilConnectePageState extends State<AccueilConnectePage> with TickerProviderStateMixin {
  AccueilBloc _accueilBloc = AccueilBloc.getState();

  AnimationController controller;
  Animation<Offset> offsetLeft;
  Animation<Offset> offsetRight;



  RefContractResponse _response;

  EagenceResponse _eAgenceResponse;

  String _currentRef = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    final Animation curve =
    CurvedAnimation(parent: controller, curve: Curves.decelerate);

    offsetLeft = Tween<Offset>(begin: Offset(-10.0, 0.0), end: Offset.zero)
        .animate(curve);

    offsetRight = Tween<Offset>(begin: Offset(10.0, 0.0), end: Offset.zero)
        .animate(curve);

    Future.delayed(Duration(seconds: 2),(){
      controller.forward();
    });

    _accueilBloc.refContraStream.listen((RefContractResponse value) {
      setState(() {
        _response = value;
      });
    });

    _accueilBloc.userSubject.listen((EagenceResponse value) {
      if(this.mounted){
        setState(() {
          _eAgenceResponse = value;
        });
      }

    });

    /*_accueilBloc.contractsStream.listen((value) {
      _currentRef = value[0];
      //showChoosReference(value);
      /*if(value.length == 1){
        _currentRef = value[0];
      }else {
        showChoosReference(value);
      }*/

    });*/
    _accueilBloc.currentRefContratSubject.listen((value){
      _currentRef = value;
    });

    _accueilBloc.initConnect();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: RefreshIndicator(
                displacement: 5,
                onRefresh: refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.all(10),
                          width: double.maxFinite,
                          decoration: new BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/header_app.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  StreamBuilder<Contactbases>(
                                      stream: _accueilBloc.userInfoStream,
                                      builder: (context, snapshot) {
                                        return snapshot.hasData &&
                                                snapshot.data.firstname != null
                                            ? new Text(
                                                "Bienvenue \n ${snapshot.data.lastname} ${snapshot.data.firstname}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : new Text("");
                                      }),
                                  new Image.asset(
                                    "assets/images/logo_last.png",
                                    width: 100,
                                    height: 40,
                                  )
                                ],
                              ),
                              new SizedBox(
                                height: 10,
                              ),
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: topBlocWithWhitBorder(
                                          "Reference client",
                                          "${_eAgenceResponse != null ? _eAgenceResponse.RefClient : "00000000"}")),
                                  new SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: topBlocWithWhitBorder(
                                          "Agence", "Angré")),
                                ],
                              ),
                              new SizedBox(
                                height: 30,
                              ),
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: topBlocWithWhitBorder(
                                          "Statut assainissement", "34534")),
                                  new SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: topBlocWithWhitBorder(
                                          "Diamètre compteur", "10")),
                                ],
                              ),
                              new SizedBox(
                                height: 25,
                              )
                              /*GridView.count(
                                  crossAxisCount: 2,
                                  primary: false,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.all(20),
                                  children: <Widget>[
                                    topBlocWithWhitBorder("Identifiant","040404040404"),
                                    topBlocWithWhitBorder("Agence","Angré"),
                                    topBlocWithWhitBorder("Branchement","34534"),
                                    topBlocWithWhitBorder("Puissance","5A")
                                  ],
                                )*/
                            ],
                          )),
                      new Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: new Container(
                          decoration: new BoxDecoration(
                              //borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 1),
                                  left: BorderSide(
                                      color: Color(color_primary), width: 3),
                                  right: BorderSide(
                                    color: Color(color_primary),
                                    width: 3,
                                  ),
                                  top: BorderSide.none),
                              shape: BoxShape.rectangle),
                          //margin: EdgeInsets.only(top: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      height: 30,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: new BoxDecoration(
                                          color: Colors.blueAccent
                                              .withOpacity(0.1),
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      child: StreamBuilder<List<String>>(
                                          stream: _accueilBloc.contractsStream,
                                          builder: (context, snapshot) {
                                            return snapshot.hasData &&
                                                    snapshot.data != null && snapshot.data.length > 0
                                                ? DropdownButtonHideUnderline(
                                                    child: new Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            canvasColor:
                                                                Colors.grey),
                                                    child:
                                                        DropdownButton<String>(
                                                      items: snapshot.data.map<
                                                          DropdownMenuItem<
                                                              String>>((value) {
                                                        return DropdownMenuItem(
                                                          child: new Text(
                                                            "Ref : $value",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          value: value,
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          print("hhhhhhhhhhhhhhhhhhhhhh");
                                                          _currentRef =
                                                              value.trim();
                                                          _accueilBloc.getUserRefContractRefresh(value.trim());
                                                        });
                                                      },
                                                      value: _currentRef != null ? _currentRef.trim() : null,
                                                    ),
                                                  ))
                                                : Container(
                                                    height: 20,
                                                    width: 100,
                                                  );
                                          }),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          new Text(
                                              "Solde dû au ${DateFormat("dd/MM/yyyy").format(DateTime.now())}"),
                                          new Text(
                                            "${_accueilBloc.impaySoldeSubject.value != null ? Utils.formatRedable(_accueilBloc.impaySoldeSubject.value.toString()) : 0}",
                                            style: new TextStyle(
                                                fontSize: 15,
                                                color: Color(color_primary),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                new SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: new Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 60),
                                    decoration: new BoxDecoration(
                                        color: Color(0xFFE5E5E5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: new Text(
                                      "Mes dernières factures",
                                      style: TextStyle(
                                          color: Color(color_primary),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StreamBuilder<
                                          List<Conventionfacturationbases>>(
                                      stream: _accueilBloc.factureStream,
                                      builder: (context, snapshot) {
                                        return snapshot.hasData &&
                                                snapshot.data != null
                                            ? new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: snapshot.data.length >
                                                        0
                                                    ? snapshot.data
                                                        .take(3)
                                                        .toList()
                                                        .map(
                                                            (Conventionfacturationbases
                                                                it) {
                                                        DateTime from = DateFormat(
                                                                "MM/yyyy")
                                                            .parse(it
                                                                .periodeFacturation);
                                                        String formated =
                                                            DateFormat(
                                                                    "MMMM yyyy",
                                                                    'fr')
                                                                .format(from);
                                                        return Flexible(
                                                          child: factureItem(
                                                              it.montantFacture,
                                                              formated,
                                                              it.statutPaye),
                                                        );
                                                      }).toList()
                                                    /*Flexible(
                                            child: factureItem("10 500", "mai 2019"),
                                          ),
                                          Flexible(
                                            child: factureItem("12 325", "juil 2019"),
                                          ),
                                          Flexible(
                                            child: factureItem("9 000", "sept 2019"),
                                          )*/
                                                    : <Widget>[Container()],
                                              )
                                            : Container();
                                      }),
                                ),
                                new SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: new Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Flexible(
                                    child: SlideTransition(
                                      position: offsetLeft,
                                      child: GestureDetector(
                                        // Infos utiles
                                        child: menuButton(
                                            name: "Ma conso",
                                            icon:
                                                "assets/images/ESPACE_PERSONNEL/Bienvenue/consommation_vert.svg"),
                                        onTap: () {
                                          if (_accueilBloc.factureSubject.value != null &&
                                              _accueilBloc.factureSubject.value !=
                                                  null &&
                                              _accueilBloc.factureSubject.value
                                                      .length >
                                                  0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConsommationPage(
                                                        user: _accueilBloc
                                                            .userSubject.value,
                                                        refContrat: _currentRef,
                                                      )),
                                            );
                                          } else {
                                            Utils.showErrorToast(
                                                "Information indisponible",
                                                context);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  new Flexible(
                                    child: SlideTransition(
                                      position: offsetRight,
                                      child: GestureDetector(
                                        // Infos utiles
                                        child: menuButton(
                                            name: "Mes demandes",
                                            icon:
                                                "assets/images/ESPACE_PERSONNEL/Bienvenue/demandes_vert.svg"),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DemandeMenuPage(
                                                      userInfo: _accueilBloc
                                                          .userInfoSubject.value,
                                                    )),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            new SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Flexible(
                                    child: SlideTransition(
                                      position: offsetLeft,
                                      child: GestureDetector(
                                        // Infos utiles
                                        child: menuButton(
                                            name: "Mon contat",
                                            icon:
                                                "assets/images/ESPACE_PERSONNEL/Bienvenue/contrat_info_vert.svg"),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContractMenuPage()),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  new Flexible(
                                    child: SlideTransition(
                                      position: offsetRight,
                                      child: GestureDetector(
                                        // Infos utiles
                                        child: menuButton(
                                            name: "Réclamation",
                                            icon:
                                                "assets/images/ESPACE_PERSONNEL/Bienvenue/reclamations_vert.svg"),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReclamationtMenuPage()),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget topBlocWithWhitBorder(String title, String subTitle) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.6),
      child: Column(
        children: <Widget>[
          new SizedBox(
            height: 5,
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                new Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: new Text(
                    subTitle,
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              ],
            ),
          ),
          new SizedBox(
            height: 4,
          ),
          new Container(
            height: 3,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Future<void> refreshPage() async {
    _accueilBloc.initConnect();
    await new Future.delayed(const Duration(seconds: 3));
  }

  Widget factureItem(String price, String monthYear, String status) {
    return new Column(
      children: <Widget>[
        new Text(
          Utils.formatRedable(price),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        new Text(
          "$monthYear",
          style: TextStyle(fontSize: 12),
        ),
        new Text(
          "$status",
          style: TextStyle(
              fontSize: 12,
              color: status != "Payée" ? Colors.red : Colors.green),
        )
      ],
    );
  }

  Future<void> showChoosReference(List<String> list) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Veuillez choisir une reférence contrat'),
          content: DropdownButtonHideUnderline(
              child: new Theme(
                data: Theme.of(context)
                    .copyWith(
                    canvasColor:
                    Colors.grey),
                child:
                DropdownButton<String>(
                  items: list.map<
                      DropdownMenuItem<
                          String>>((value) {
                    return DropdownMenuItem(
                      child: new Text(
                        "Ref : $value",
                        style: TextStyle(
                            color: Colors
                                .black,
                            fontWeight:
                            FontWeight
                                .bold),
                      ),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _currentRef =
                          value.trim();
                      _accueilBloc
                          .getAllFactureForContrat(
                          _currentRef);
                    });
                  },
                  value: _currentRef != null ? _currentRef.trim() : null,
                ),
              )),
          actions: <Widget>[
            FlatButton(
              child: Text('buttonText'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
