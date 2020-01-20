import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/models/DataService.dart';
import 'package:sodeci_mobile/models/SousRubriqueBonReflexesDto.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class InfosUtilesContentPage extends StatefulWidget {
  final bool showNavButton;
  final int idMenu;
  final int id;
  final List<DataReflex> listReflexe;
  final List<DataService> lisService;

  InfosUtilesContentPage({
    key,
    @required this.showNavButton,
    @required this.idMenu,
    @required this.id,
    @required this.listReflexe,
    @required this.lisService,
  }) : super(key: key);

  @override
  _InfosUtilesContentPageState createState() => _InfosUtilesContentPageState();
}

class _InfosUtilesContentPageState extends State<InfosUtilesContentPage> {
  int _currentIndex = 0;
  List<SousRubriqueBonReflexesDto> _souRubriqueList;

  WebViewController _controller;
  int _maxIndex = 0;

  List<String> listOfTarifTitle = [
    "Clients mensuels diamètre 15",
    "Clients mensuels diamètre > 20",
    "Clients trimestriel diamètre 15 ",
    "Clients trimestriel diamètre > 20 "
  ];

  List<String> listTextContentTitre = [
    AppConstant.USER_INFO_TITLE_DIAMETRE_15,
    AppConstant.USER_INFO_TITLE_DIAMETRE_20,
  ];
  
  List<String> listTextContentTop = [
    AppConstant.USER_INFO_CONTENT_DIAMETRE_15,
    AppConstant.USER_INFO_CONTENT_DIAMETRE_20,
  ];

  List<String> listTextContentBottom = [
    AppConstant.USER_INFO_BOTTOM_DIAMETRE_15,
    AppConstant.USER_INFO_BOTTOM_DIAMETRE_20,
  ];

  String barTitle = "";
  String contentTitle = "";
  String contentTextTop = "";
  String contentTextBottom = "";

  List<String> listOfTarif_mens_15 = [
    "assets/images/INFOS_UTILES/mensuel_15_racooN.png",
    "assets/images/INFOS_UTILES/mensuel_15_non_racoN.png",
    "assets/images/INFOS_UTILES/mensuel_15_non_racordableN.png"
  ];
  List<String> listOfTarif_mens_20 = [
    "assets/images/INFOS_UTILES/mensuel_20_racooN.png",
    "assets/images/INFOS_UTILES/mensuel_20_non_raccordN.png",
    "assets/images/INFOS_UTILES/mensuel_20_non_racordableN.png"
  ];

  List<String> listOfTarif_trim_15 = [
    "assets/images/INFOS_UTILES/trimest_15_racordeN.png",
    "assets/images/INFOS_UTILES/trimestre_15_non_raccordeN.png",
    "assets/images/INFOS_UTILES/trimestre_15_non_raccordableN.png",
  ];

  List<String> listOfTarif_trim_20 = [
    "assets/images/INFOS_UTILES/trimest_15_racordeN.png",
    "assets/images/INFOS_UTILES/trimestre_20_non_racordeN.png",
    "assets/images/INFOS_UTILES/trimestre_20_non_raccordableN.png",
  ];


  List<String> tarifList = [];
  String _tarifLibelle = "RACCORDÉ";

  List<DataReflex> reflexe = [];

  List<DataService> finallistServe = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.listReflexe != null) {
      if (widget.idMenu != 3) {
        _souRubriqueList = widget.listReflexe
            .firstWhere((it) => it.idRubrique == widget.id)
            .sousRubriqueBonReflexesDto;
      } else {
        print(widget.listReflexe);
        print("xxxxyyyyyyxxxxx");
        _souRubriqueList = widget.listReflexe[0].sousRubriqueBonReflexesDto;
      }
      _maxIndex = _souRubriqueList.length;
    }

    if (widget.lisService != null) {
      if (widget.id == 2) {
        List<DataService> listServe = [];
        widget.lisService.forEach((it) {
          if (it.serviceDto != null &&
              it.serviceDto.libelleService.contains("Branchement")) {
            listServe.add(it);
          }
        });
        finallistServe = listServe;
        _maxIndex = listServe.length;
      } else {
        _maxIndex = widget.lisService.length;
        finallistServe = widget.lisService;
      }
    }

    if (widget.idMenu == 0) {
      _maxIndex = 3;
      switch (widget.id) {
        case 0:
          // tarifList = listOfTarif_mens_15;
          // barTitle = listOfTarifTitle[0];
          break;
        case 1:
          tarifList = listOfTarif_mens_20;
          barTitle = listOfTarifTitle[0];
          break;
        case 2:
          tarifList = listOfTarif_trim_15;
          barTitle = listOfTarifTitle[1];
          break;
        case 3:
          tarifList = listOfTarif_trim_20;
          barTitle = listOfTarifTitle[2];
          contentTitle = listTextContentTitre[0];
          contentTextTop = listTextContentTop[0];
          contentTextBottom = listTextContentBottom[0];
          break;
        case 4:
          tarifList = listOfTarif_trim_20;
          barTitle = listOfTarifTitle[3];
          contentTitle = listTextContentTitre[1];
          contentTextTop = listTextContentTop[1];
          contentTextBottom = listTextContentBottom[1];
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
                  child: Column(
            children: <Widget>[
              Container(
                child: buildStepper(),
              ),
              Container(
                child: _getContent(),
              ),
              buildFooter()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getContent() {
    switch (widget.idMenu) {
      case 0:
        return _tarifView();
        break;
      case 1:
        return _ecoGestView();
        break;
      case 2:
        return _serviceView();
        break;
      case 3:
        return _ecoGestView();
        break;
      default:
        return Container();
    }
  }

  Container buildFooter() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300], width: 3)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: double.infinity,
        color: Colors.green,
        child: Text(
          "FERMER",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
          
        },
      ),
    );
  }

  Container buildStepper() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 3)),
        color: Colors.green[400],
      ),
      child: Row(
        children: <Widget>[
          Visibility(
            child: RaisedButton(
              color: Colors.transparent,
              padding: EdgeInsets.all(0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.green.shade400,
                  Colors.green
                ])),
                child: Text(
                  "PRECEDENT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                if (widget.idMenu == 0) {
                  setState(() {
                    _currentIndex--;
                  });
                } else {
                  if (_currentIndex > 0) {
                    setState(() {
                      _currentIndex--;
                      if (widget.listReflexe != null &&
                          _souRubriqueList[_currentIndex].conseil != null &&
                          _controller != null) {
                        print("ouuupppsss");
                        _controller.loadUrl(Uri.dataFromString(
                                _souRubriqueList[_currentIndex]
                                    .conseil[0]
                                    .conseil,
                                mimeType: 'text/html',
                                encoding: Encoding.getByName('utf-8'))
                            .toString());
                      } else if (finallistServe != null &&
                          finallistServe[_currentIndex].message != null &&
                          _controller != null) {
                        print("ouuupppsss");
                        _controller.loadUrl(Uri.dataFromString(
                                finallistServe[_currentIndex].message,
                                mimeType: 'text/html',
                                encoding: Encoding.getByName('utf-8'))
                            .toString());
                      } else if (widget.idMenu == 0) {
                        changeTarifTitle();
                      }
                    });
                  }
                }
              },
            ),
            visible: widget.showNavButton && _currentIndex > 0,
          ),
          Expanded(
            child: Container(),
          ),
          Visibility(
            child: RaisedButton(
              color: Colors.transparent,
              padding: EdgeInsets.all(0),
              child: Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                decoration: new BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.green.shade400,
                  Colors.green
                ])),
                child: Text(
                  "SUIVANT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                if (widget.listReflexe != null &&
                    _currentIndex + 1 < _souRubriqueList.length) {
                  setState(() {
                    _currentIndex++;
                    if (_souRubriqueList[_currentIndex].conseil != null &&
                        _controller != null) {
                      print("ouuupppsss");
                      _controller.loadUrl(Uri.dataFromString(
                              _souRubriqueList[_currentIndex]
                                  .conseil[0]
                                  .conseil,
                              mimeType: 'text/html',
                              encoding: Encoding.getByName('utf-8'))
                          .toString());
                    }
                  });
                } else if (finallistServe != null &&
                    _currentIndex + 1 < finallistServe.length) {
                  setState(() {
                    _currentIndex++;
                    if (finallistServe[_currentIndex].questionDetailService !=
                            null &&
                        _controller != null) {
                      print("ouuupppsss");
                      _controller.loadUrl(Uri.dataFromString(
                              finallistServe[_currentIndex].message,
                              mimeType: 'text/html',
                              encoding: Encoding.getByName('utf-8'))
                          .toString());
                    }
                  });
                } else if (widget.idMenu == 0 &&
                    _currentIndex + 1 < _maxIndex) {
                  setState(() {
                    _currentIndex++;
                    changeTarifTitle();
                  });
                }
              },
            ),
            visible: widget.showNavButton && _currentIndex + 1 < _maxIndex,
          ),
        ],
      ),
    );
  }

  Widget changeTarifTitle() {
    switch (_currentIndex) {
      case 0:
        _tarifLibelle = "RACCORDÉ";
        break;
      case 1:
        _tarifLibelle = "NON RACCORDÉ";
        break;
      case 2:
        _tarifLibelle = "NON RACCORDABLE";
        break;
    }
  }

  Widget _ecoGestView() {
    if (widget.listReflexe != null) {
      return Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey.shade50,
        child: new Column(
          children: <Widget>[
            new Text(
              _souRubriqueList[_currentIndex].sousRubrique,
              style: TextStyle(color: Colors.blueAccent),
            ),
            new Container(
              margin: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              height: 2,
              color: Colors.grey,
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: _souRubriqueList[_currentIndex].conseil != null
                  ? new WebView(
                      initialUrl: '$_currentIndex',
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller = webViewController;
                        _controller.loadUrl(Uri.dataFromString(
                                _souRubriqueList[_currentIndex]
                                    .conseil[0]
                                    .conseil,
                                mimeType: 'text/html',
                                encoding: Encoding.getByName('utf-8'))
                            .toString());
                        _controller.reload();
                      },
                    )
                  : Container(),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _serviceView() {
    if (finallistServe != null) {
      return Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey.shade50,
        child: new Column(
          children: <Widget>[
            new Text(
              finallistServe[_currentIndex].questionDetailService,
              style: TextStyle(color: Colors.blueAccent),
            ),
            new Container(
              margin: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              height: 2,
              color: Colors.grey,
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: finallistServe[_currentIndex].message != null
                  ? new WebView(
                      initialUrl: '$_currentIndex',
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller = webViewController;
                        _controller.loadUrl(Uri.dataFromString(
                                finallistServe[_currentIndex].message,
                                mimeType: 'text/html',
                                encoding: Encoding.getByName('utf-8'))
                            .toString());
                        _controller.reload();
                      },
                    )
                  : Container(),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getWebview() {
    print(_controller);
    return _souRubriqueList[_currentIndex].conseil != null
        ? new WebView(
            initialUrl: '$_currentIndex',
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
              webViewController.clearCache();
              webViewController.goBack();
              webViewController.reload();
              _controller.loadUrl(Uri.dataFromString(
                      _souRubriqueList[_currentIndex].conseil[0].conseil,
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'))
                  .toString());
              _controller.reload();
            },
          )
        : Container();
  }

  Widget _tarifView() {
    return new SingleChildScrollView(
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                barTitle.toUpperCase() ?? "",
                style: TextStyle(
                    color: Colors.green, fontSize: 25, fontFamily: 'Myriad'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: new Container(
                height: 2,
                width: double.maxFinite,
                color: Colors.black87,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                contentTitle,
                style:
                    TextStyle(color: Colors.black87, fontFamily: 'Myriad bold'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                contentTextTop,
                style: TextStyle(fontSize: 15, fontFamily: 'Myriad'),
              ),
            ),
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(tarifList[_currentIndex]),
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                _tarifLibelle,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Myriad bold'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                contentTextBottom,
                style: TextStyle(fontFamily: 'Myriad Myriad'),
              ),
            ),
            SizedBox(
                height: 10,
              ),
          ]),
    );
  }
}
