import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/ListeDesFacture.dart';
import 'package:sodeci_mobile/models/saphirV3/Conventionfacturationbases.dart';
import 'package:sodeci_mobile/ui/accueil/connecte/acceuil_bloc.dart';
import 'package:sodeci_mobile/ui/consommation/consommationBloc.dart';
import 'package:sodeci_mobile/ui/consommation/payement_page.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ConsommationPage extends StatefulWidget {
  final EagenceResponse user;
  final String refContrat;

  ConsommationPage({key, @required this.user, this.refContrat})
      : super(key: key);

  @override
  _ConsommationPageState createState() => _ConsommationPageState();
}

class _ConsommationPageState extends State<ConsommationPage> {
  /*static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final data = [
      new OrdinalSales('Mars 2019', 40200),
      new OrdinalSales('Avr 2019', 98000),
      new OrdinalSales('Jull 2019', 80000),
      new OrdinalSales('Sept 2019', 57000),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }*/

  AccueilBloc _accueilBloc = AccueilBloc.getState();

  ConsommationBloc _consoBloc = ConsommationBloc();

  List<charts.Series<OrdinalSales, String>> _listChart = [];

  Conventionfacturationbases _lastFacture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (_accueilBloc.factureSubject.value != null &&
        _accueilBloc.factureSubject.value.length > 0) {
      List<OrdinalSales> list = [];
      _lastFacture = _accueilBloc.factureSubject.value[0];
      _accueilBloc.factureSubject.value.take(5).toList().reversed.forEach((it) {
        DateTime from = DateFormat("MM/yyyy").parse(it.periodeFacturation);
        String formated = DateFormat("MMMM yyyy", 'fr').format(from);
        list.add(new OrdinalSales(formated, double.parse(it.montantFacture).toInt()));

        setState(() {
          _listChart = [
            new charts.Series<OrdinalSales, String>(
              id: 'Sales',
              colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
              domainFn: (OrdinalSales sales, _) => sales.year,
              measureFn: (OrdinalSales sales, _) => sales.sales,
              data: list,

            )
          ];
        });
      });
    }

    _consoBloc.loading.listen((value) async {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Navigator.of(context).pop();
          Utils.showErrorToast(value.message, context);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          //_accueilBloc.getAllFactureForContrat(widget.refContrat);

        }
      }
    });

    _consoBloc.payementSubject.listen((value) async {
      if (value.url != "#" && value.code == "0") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayementPage(url: value.url,)),
        );
        /*if (await canLaunch(value.url)) {
          await launch(value.url);
        } else {
          Utils.showErrorToast("Impossible d'acceder à la plateform", context);
          //throw 'Could not launch $url';
        }*/
      }else {
        Utils.showErrorToast("Url invalide", context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: SimpleMaterialAppBar(appTitle: "Consommation", context: context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/header_app_2.png"),
                      fit: BoxFit.cover)),
              child: new Column(
                children: <Widget>[
                  new Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      new Container(
                        //color: Colors.white,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3))),
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        child: charts.BarChart(
                          _listChart,
                          animate: true,
                          domainAxis: new charts.OrdinalAxisSpec(
                              renderSpec: new charts.SmallTickRendererSpec(

                                // Tick and Label styling here.
                                  labelStyle: new charts.TextStyleSpec(
                                      fontSize: 8, // size in Pts.
                                      color: charts.MaterialPalette.black),

                                  // Change the line colors to match text color.
                                  lineStyle: new charts.LineStyleSpec(
                                      color: charts.MaterialPalette.black))),
                        ),
                        height: 200,
                        width: double.maxFinite,
                      ),
                      new Image.asset(
                        "assets/images/logo_last.png",
                        width: 60,
                        height: 30,
                      )
                    ],
                  ),
                  new SizedBox(
                    height: 3,
                  ),
                  new Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Ma dernière facture",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              _lastFacture.statutPaye,
                              style: TextStyle(
                                  color: Color(color_primary)),
                            ),
                            new SvgPicture.asset(
                              "assets/images/CONSOMMATION/facture_vert.svg",
                              width: 25,
                              height: 25,
                            )
                          ],
                        ),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new RichText(
                                text: TextSpan(
                              text: _lastFacture !=
                                      null
                                  ? Utils.formatRedable(_lastFacture
                                      .montantFacture)
                                  : "0 FCFA",
                              style: TextStyle(
                                  color: Color(color_primary_dark),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                            new SizedBox(
                              height: 5,
                            ),
                            new Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    new RichText(
                                        text: TextSpan(
                                            text:
                                                "Ancien index: 113029  \n",
                                            style: TextStyle(fontSize: 8, color: Colors.black),
                                            children: [
                                          new TextSpan(
                                              text:
                                                  "Nouveau index:123020 ")
                                        ])),
                                    new Container(
                                      width: 1,
                                      height: 20,
                                      color: Colors.grey.shade200,
                                    )
                                  ],
                                ),
                                new SizedBox(
                                  width: 25,
                                ),
                                new Text(
                                  "1270 m3",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: new Container(
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Historique",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new Row(
                          children: <Widget>[
                            new Icon(
                              FontAwesomeIcons.infoCircle,
                              size: 15,
                              color: Color(color_primary),
                            ),
                            new SizedBox(
                              width: 10,
                            ),
                            historyButton(
                                title: "Montant (FCFA",
                                couleur: Color(color_primary),
                                titleColor: Colors.white),
                            new SizedBox(
                              width: 10,
                            ),
                            historyButton(
                                title: "Conso m3",
                                couleur: Colors.grey.shade200,
                                titleColor: Colors.black38)
                          ],
                        )
                      ],
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(2))),
                        child: new ListView.builder(
                          itemBuilder: (context, index) {
                            return historyItem(index);
                          },
                          itemCount: _accueilBloc.factureSubject.value !=
                                  null
                              ? _accueilBloc.factureSubject.value.length
                              : 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Center(child: buildFooter())
          ],
        ),
      ),
    );
  }

  Widget historyItem(int index) {
    Conventionfacturationbases factItem =
        _accueilBloc.factureSubject.value[index];
    String dateLimite = DateFormat("dd/MM/yyyy").format(factItem.dateLimite);
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RichText(
                  text: TextSpan(
                      text: "${dateLimite} \n",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                    new TextSpan(
                        text: "Autre",
                        style: TextStyle(fontSize: 8, color: Colors.black))
                  ])),
              new Row(
                children: <Widget>[
                  GestureDetector(
                    child: //new Icon(Icons.file_download)
                    new SvgPicture.asset(
                      "assets/images/CONSOMMATION/facture_vert.svg",
                      width: 25,
                      height: 25,
                    ),
                    onTap: () async {
                      String url =
                          AppConstant.URL_FACTURE_DOWNLOAD + factItem.reffactureV3;
                      debugPrint(url);
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Utils.showErrorToast(
                            "Impossible de télécharger la facture", context);
                        //throw 'Could not launch $url';
                      }
                    },
                  ),
                  new SizedBox(width: 5,),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        Utils.formatRedable(factItem.montantFacture),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        height: 3,
                      ),
                      new Container(
                        height: 3,
                        color: Color(color_primary_dark),
                        width: 180,
                      ),
                      new SizedBox(
                        height: 5,
                      ),
                      new Text(
                        factItem.statutPaye,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Color(color_primary)),
                      ),
                    ],
                  ),
                  new SizedBox(
                    width: 2,
                  ),
                  Visibility(
                    visible: factItem.statutPaye != "Payée",
                    child: new IconButton(
                        icon: Icon(
                          Icons.payment,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () {
                          FormData data = new FormData.fromMap({
                            "facture": factItem.reffactureV3,
                            "contrats": widget.refContrat,
                            "compte": "2f5ca1d7512d254drr4e220802a3f1ee",
                          });
                          print(data);
                          _consoBloc.makePayement(data);
                        }),
                  )
                ],
              )
            ],
          ),
          new SizedBox(
            height: 2,
          ),
          new Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget historyButton({String title, Color couleur, Color titleColor}) {
    return Container(
      alignment: Alignment.center,
      width: (MediaQuery.of(context).size.width / 3) - 20,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: new BoxDecoration(
          color: couleur, borderRadius: BorderRadius.circular(3)),
      child: new Text(
        title,
        style: TextStyle(fontSize: 10, color: titleColor),
      ),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
