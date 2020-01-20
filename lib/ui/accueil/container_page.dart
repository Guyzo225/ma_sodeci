import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/Menu.dart';
import 'package:sodeci_mobile/ui/accueil/accueil_page.dart';
import 'package:sodeci_mobile/ui/accueil/connecte/acceuil_bloc.dart';
import 'package:sodeci_mobile/ui/accueil/connecte/accueil_connect_page.dart';
import 'package:sodeci_mobile/ui/alertes/alerte_page.dart';
import 'package:sodeci_mobile/ui/consommation/consommation_page.dart';
import 'package:sodeci_mobile/ui/contact/contact_page.dart';
import 'package:sodeci_mobile/ui/contrat/contrat_menu_page.dart';
import 'package:sodeci_mobile/ui/demandes/demande_menu_page.dart';
import 'package:sodeci_mobile/ui/demandes/mes_demandes_page.dart';
import 'package:sodeci_mobile/ui/demandes/nouvelle_demande_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/infos_utiles_page.dart';
import 'package:sodeci_mobile/ui/mes_factures/mes_factures_page.dart';
import 'package:sodeci_mobile/ui/mon_compteur/mon_compteur_page.dart';
import 'package:sodeci_mobile/ui/reclamation/reclamation_menu_page.dart';
import 'package:sodeci_mobile/ui/reseau_agence/reseau_agence.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_facture_page.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_page.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:toast/toast.dart';
import '../../page_interaction_listener.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage>
    implements PageInteractionListener {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  List<Widget> pages;
  int currentPage = 0;

  List<Menu> menus;
  bool session = false;

  AccueilBloc _accueilBloc = AccueilBloc.getState();

  @override
  void initState() {
    super.initState();

    _accueilBloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          Utils.showErrorToast(value.message,context);
        } else {
          if(context != null){
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          }else {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          }


          /*if (value.message != null) {
            Toast.show(value.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            Navigator.of(context).pop();
          }*/
        }
      }
    });



    pages = List();
    pages.add(AccueilPage());
    pages.add(AccueilPage());
    pages.add(MesFacturesPage());
    pages.add(
      MesDemandesPage(
        listener: this,
      ),
    );
    pages.add(NouvelleDemandePage(
      listener: this,
    ));

    menus = [
      Menu(
          title: "Mes alerts",
          iconName: "assets/images/CONTRAT/infos/alertes_vert.svg",
          index: 0,
          toGo: AlertPage()),
      Menu(
          title: "Ma conso",
          iconName:
          "assets/images/ESPACE_PERSONNEL/Bienvenue/consommation_vert.svg",
          index: 1,
          toGo: ConsommationPage()),
      Menu(
          title: "Mes demandes",
          iconName:
          "assets/images/ESPACE_PERSONNEL/Bienvenue/finger_touching_screen.svg",
          index: 2,
          toGo: DemandeMenuPage()),
      Menu(
          title: "Mon contrat",
          iconName:
          "assets/images/ESPACE_PERSONNEL/Bienvenue/contrat_info_vert.svg",
          index: 3,
          toGo: ContractMenuPage()),
      Menu(
          title: "Réclamations",
          iconName:
          "assets/images/ESPACE_PERSONNEL/Bienvenue/reclamations_vert.svg",
          index: 4,
          toGo: ReclamationtMenuPage()),
      Menu(
          title: "Simulations",
          iconName: "assets/images/PAGE_ACCUEIL/simulation_vert.svg",
          index: 5,
          toGo: SimulationFacturePage(refContract: _accueilBloc.currentRefContratSubject.value,)),
      Menu(
          title: "Reseaux d'agences",
          iconName: "assets/images/PAGE_ACCUEIL/reseau_agence_vert.svg",
          index: 6,
          toGo: ReseauAgence()),
      Menu(
          title: "Contacts",
          iconName: "assets/images/PAGE_ACCUEIL/contact_vert.svg",
          index: 7,
          toGo: ContactPage()),
      Menu(
          title: "Infos utiles",
          iconName: "assets/images/PAGE_ACCUEIL/info_utiles_vert.svg",
          index: 8,
          toGo: InfosUtilesPage()),
      Menu(
          title: "Mon compteur",
          iconName: "assets/images/PAGE_ACCUEIL/compteurAR_vert.svg",
          index: 9,
          toGo: MonCompteurPage()),
      Menu(
          title: "Deconnexion",
          iconName: "assets/images/logout.svg",
          index: 10,
          toGo: null),
    ];

    Utils.getData(AppConstant.isConnected).then((value) {
      if (value != null) {
        setState(() {
          session = true;
        });
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: session == true
            ? AppBar(
          //backgroundColor: session?: Color(color_primary): Colors.transparent,
          elevation: 0,
          //title: appBarTitle(),
          centerTitle: true,
          title: session
              ? new Text(
            "Espace personnel", style: TextStyle(color: Colors.white),)
              : appBarTitle(),
          leading: !session
              ? Container()
              : GestureDetector(
            child: Icon(Icons.menu, color: Colors.white),
            onTap: () => _scaffoldKey.currentState.openDrawer(),
          ),
        )
            : null,
        drawer: session == true ? _buildDrawer(context) : null,
        body: session == true ? AccueilConnectePage() : pages[currentPage],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Container(
      width: (MediaQuery
          .of(context)
          .size
          .width / 2) +
          (MediaQuery
              .of(context)
              .size
              .width / 6),
      color: Colors.green,
      child: Column(
        children: <Widget>[
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mon menu",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),*/
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: _buildDrawerItem(menus[index]),
                    onTap: () {
                      if (currentPage != index) {
                        setState(() {
                          currentPage = index;
                          Navigator.pop(context);
                        });
                      }
                    },
                  );
                },
                itemCount: menus.length,
              ),
            ),
          ),
          new Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.only(top: 25),
            height: 50,
            child: new Center(
              child: new Text("©2019 - SODECI V2.2",
                style: TextStyle(color: Colors.grey.shade400),),
            ),
          )
        ],
      ),
    );
  }

  Future<String> showDialogChoiceRef() async {
     return showDialog<String>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Choisir une réference'),
          content:new Container(
            child: DropdownButtonHideUnderline(child: DropdownButton<String>(items: [
              "132039068",
              "132039084",
              "132039085",
              "132039085",
              "132039088",
              "132039088",
              "132039091",
              "132039094",
              "132039096",
              "132039100",
              "132039100",
              "132039101",
              "132039102",

            ].map<DropdownMenuItem<String>>((value){
              return DropdownMenuItem(child: new Text(value),value: value,);
            }).toList(),
                onChanged: (value){
              setState(() {
                print(value);
              });

              print("dldldldldld");
               Navigator.of(dialogContext).pop(value);
            })),
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(Menu item) {
    return new InkWell(
      splashColor: Color(color_primary),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new SvgPicture.asset(
              item.iconName,
              width: 25,
              height: 25,
              color: Color(color_primary),
            ),
            new SizedBox(
              width: 40,
            ),
            new Text(
              item.title,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      onTap: () {
        if (item.toGo != null) {
          print(_accueilBloc.currentRefContratSubject.value);
          if(item.index == 5){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SimulationFacturePage(refContract: _accueilBloc.currentRefContratSubject.value,),),
                );
            //Utils.showErrorToast("Indisponible pour le moment", context);

          }else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item.toGo,
                ));
          }

        } else {
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            // false = user must tap button, true = tap outside dialog
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('Demade'),
                content: Text('Voulez-vous continer ?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('NON'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                  new FlatButton(onPressed: () {
                    setState(() {
                      session = false;
                      Utils.clear(AppConstant.isConnected);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AccueilPage()),
                          ModalRoute.withName('/'));
                    });
                  },
                      child: Text(
                        "OUI", style: TextStyle(color: Colors.redAccent),))
                ],
              );
            },
          );
        }
      },
    );
  }

  @override
  void updatePage(int position) {
    if (currentPage != position) {
      setState(() {
        currentPage = position;
      });
    }
  }
}
