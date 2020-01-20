import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/ModeCommunication.dart';
import 'package:sodeci_mobile/models/saphirV3/CategorieClientItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Categoriecontractuelleclientbases.dart';
import 'package:sodeci_mobile/models/saphirV3/CommuneItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Datum.dart';
import 'package:sodeci_mobile/models/saphirV3/Datum_secteur_activite.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2ETypededocumentdumodelebases.dart';
import 'package:sodeci_mobile/models/saphirV3/Productbases.dart';
import 'package:sodeci_mobile/models/saphirV3/QuartierItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Secteuractivitebases.dart';
import 'package:sodeci_mobile/models/saphirV3/TypeUsage.dart';
import 'package:sodeci_mobile/ui/demandes/demande_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as pathNew;

import '../../page_interaction_listener.dart';
import 'package:http_parser/http_parser.dart';

class NouvelleDemandePage extends StatefulWidget {
  final PageInteractionListener listener;
  final Contactbases userInfo;
  final String typeDemande;
  final int id;

  const NouvelleDemandePage(
      {this.listener,
      @required this.userInfo,
      @required this.typeDemande,
      @required this.id});

  @override
  _NouvelleDemandePageState createState() => _NouvelleDemandePageState();
}

class _NouvelleDemandePageState extends State<NouvelleDemandePage> {
  List<Step> get _listSteps => [
        new Step(
          title: Wrap(
            children: <Widget>[
              new Text("Initiation de la demande",
                  style: TextStyle(fontSize: 10))
            ],
          ),
          content: initiationWidget(),
          isActive: _currentStep == 0,
        ),
        new Step(
            title: Wrap(
              children: <Widget>[
                new Text(
                  "Fourniture des documents",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            content: documentWidget(),
            isActive: _currentStep == 1),
      ];

  int _currentStep = 0;

  TextEditingController _controllerComplement = new TextEditingController();
  TextEditingController _controllerPoinFourniture = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int _attempt = 0;

  CommuneItem _commune = null;
  QuartierItem _quartier = null;
  CategorieClientItem _categorie = null;
  Productbases _typeProduit = null;
  Categoriecontractuelleclientbases _catContractuelle = null;
  Datum _typeUsage = null;
  DatumSectuerActivite _secteurActivite = null;

  List<File> _fileToSend = [];
  Map<int, File> _mapFileToSend = new Map();

  List<ModeCommunication> _listMode = [
    ModeCommunication(id: 1, libelle: "SMS"),
    ModeCommunication(id: 2, libelle: "Email"),
    ModeCommunication(id: 3, libelle: "SMS+EMAIL"),
  ];

  ModeCommunication _currentMode = null;

  DemandeBloc _bloc = new DemandeBloc();

  @override
  void initState() {
    _currentMode = _listMode[0];

    _bloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfoError(context: context,msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          if (value.message != null && value.message.contains("demande")) {
            Utils.showSimpleToast(value.message, context);
            setState(() {
              _currentStep = 1;
            });
          }
          if (value.message != null && value.message.contains("Document")) {
            Utils.showDailogInfoWithoutPop(context,value.message,"Information",(){});
            setState(() {
              _currentStep = 0;
            });
          }
        }
      }
    });
    _bloc.typeDemandeSubject.add(widget.id);
    _bloc.initialise(widget.userInfo);

    _bloc.firstResponseSubject.listen((value) {
      setState(() {
        _currentStep = 1;
        Future.delayed(Duration(seconds: 2), () {
          switch (widget.id) {
            case 1:
              _bloc.findDemande(value.idSave);
              break;
            case 2:
            case 3:
              _bloc.findDemandeAbonnement(value.idSave);
              break;
            default:
              _bloc.findDemande(value.idSave);
          }
        });
      });
    });
    print(widget.id);
    //_bloc.findDemandeAbonnement("e2c5f963-c515-ea11-80c8-005056be1a35");
    /*switch(widget.id){
      case 1:
        _bloc.findDemande("85070547-0815-ea11-80c8-005056be1a35");
        break;
      case 3:
        _bloc.findDemandeAbonnement("85070547-0815-ea11-80c8-005056be1a35");
        break;
      default:
        _bloc.findDemande("85070547-0815-ea11-80c8-005056be1a35");
    }*/

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Center(
          child: appBarTitle(),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            //color: Color(color_primary),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Theme(
        data: ThemeData(accentColor: Colors.green),
        child: new Stepper(
          steps: _listSteps,
          currentStep: _currentStep,
          type: StepperType.horizontal,
          onStepContinue: () {
            if (_currentStep == 0) {
              verifyField();
            } else {
              print(_bloc.typeDocSubject.value.length);
              print(_fileToSend.length);
              _fileToSend = [];
              _mapFileToSend.forEach((index, f) {
                _fileToSend.add(f);
              });
              if (_fileToSend.length < _bloc.typeDocSubject.value.length) {
                Utils.showErrorToast(
                    "Veuillez charger tous les fichiers svp", context);
              } else {
                sendData();
              }
            }
          },
        ),
      ),
    );
  }

  void verifyField() {
    if(widget.id == 1 || widget.id == 3){
      if (_commune == null) {
        Utils.showErrorToast("Veuillez choisir une Commune svp", context);
        return;
      }
      if (_quartier == null) {
        Utils.showErrorToast("Veuillez choisir un quartier svp", context);
        return;
      }
    }

    if (_categorie == null) {
      Utils.showErrorToast("Veuillez choisir une catégorie svp", context);
      return;
    }
    if (_typeProduit == null) {
      Utils.showErrorToast("Veuillez choisir un type de produit svp", context);
      return;
    }
    if (_currentMode == null) {
      Utils.showErrorToast(
          "Veuillez choisir un mode de communication svp", context);
      return;
    }

    if (widget.id == 3 || widget.id == 2) {
      if (_catContractuelle == null) {
        Utils.showErrorToast(
            "Veuillez choisir une catégorie contractuelle svp", context);
        return;
      }
      if (_typeUsage == null) {
        Utils.showErrorToast("Veuillez choisir un type usage svp", context);
        return;
      }

      if (_secteurActivite == null) {
        Utils.showErrorToast(
            "Veuillez choisir une branche d'activité svp", context);
        return;
      }
    }
    if (widget.id == 2) {
      if (_controllerPoinFourniture.text == "") {
        Utils.showErrorToast(
            "Veuillez saisir un point de fourniture svp!", context);
        return;
      }
      if (_typeUsage == null) {
        Utils.showErrorToast("Veuillez choisir un type usage svp", context);
        return;
      }

      if (_secteurActivite == null) {
        Utils.showErrorToast(
            "Veuillez choisir une branche d'activité svp", context);
        return;
      }
    }

    String data = "Value_RefCli=${widget.userInfo.jfaReferenceclient}";
    data += "&Id_Indiv=${_bloc.userFromDbSubject.value.idUser}";
    data += "&V3_CatCli=${_categorie.gs2ECategorieclientid}";
    data += "&V3_TypeProd=${_typeProduit.productid}";
    if(widget.id == 1 || widget.id == 3){
      data += "&DcpGeoid=${_quartier.fanDcoupagegographiqueid}";
      data += "&Compl_Adr=${_controllerComplement.value.text}";
      data += "&fanDcoupageparentid=${_quartier.fanDcoupageparentid}";
    }

    data += "&V3_Mode_Communication=${_currentMode.id}";
    data += "&attempt=${_attempt}";
    data += "&N=null";
    if (widget.id == 3) {
      data += "&fanDcoupagegographiqueid=${_quartier.fanDcoupageparentid}";
      data +=
          "&V3_CatContract=${_catContractuelle.jfaCategoriecontractuelleclientid}";
      data += "&V3_BranchAct=${_secteurActivite.jfaBrancheactiviteId}";
      data += "&V3_TypeUsg=${_typeUsage.jfaUsageId}";
    }
    else if(widget.id == 2) {
      data +=
      "&V3_CatContract=${_catContractuelle.jfaCategoriecontractuelleclientid}";
      data += "&V3_BranchAct=${_secteurActivite.jfaBrancheactiviteId}";
      data += "&V3_TypeUsg=${_typeUsage.jfaUsageId}";
      data += "&V3_Branch_Id=${_bloc.branchementSubject.value[0].gs2EBranchementid}";
    }

    _bloc.sendFirstPart(data);
  }

  Widget initiationWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Form(
        autovalidate: true,
        key: _formKey,
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Visibility(
              visible: widget.id == 2,
              child: new TextFormField(
                decoration: InputDecoration(hintText: "Point de fourniture"),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                controller: _controllerPoinFourniture,
                maxLength: 11,
                autofocus: false,
                focusNode: null,
                onFieldSubmitted: (value){
                  if(value.length> 0 && value.isNotEmpty){
                    _bloc.getBranchementByRefBranche(value);
                  }
                },
                onChanged: (value){
                  if(value.length> 0 && value.isNotEmpty && value.length == 11){
                    _bloc.getBranchementByRefBranche(value);
                  }
                },
                validator: (value){
                  if(value.isEmpty){
                    return "Champ réquis";
                  }
                  if(value.length < 11){
                    return "Il faut saisir 11 chiffres";
                  }
                  return null;
                },
              ),
            ),
            new SizedBox(
              height: 10,
            ),
            Visibility(
              visible: widget.id != 2,
                child: Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new RichText(
                        text: TextSpan(
                            text: "Commune",
                            style: TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                            text: "*",
                            style: new TextStyle(color: Colors.red),
                          )
                        ])),
                    Container(
                        height: 40,
                        width: 200,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: StreamBuilder<List<CommuneItem>>(
                            stream: _bloc.communeStream,
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? DropdownButtonHideUnderline(
                                      child: new DropdownButton<CommuneItem>(
                                          items: snapshot.data.map<
                                                  DropdownMenuItem<
                                                      CommuneItem>>(
                                              (CommuneItem value) {
                                            return DropdownMenuItem<
                                                    CommuneItem>(
                                                value: value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    value.fanDecoupage,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ));
                                          }).toList(),
                                          isExpanded: true,
                                          value: _commune,
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (CommuneItem newValue) {
                                            setState(() {
                                              _commune = newValue;
                                              _bloc.getQuartier(_commune
                                                  .fanIdtechniquerecherche);
                                            });
                                          }),
                                    )
                                  : Container();
                            }))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new RichText(
                        text: TextSpan(
                            text: "Quartier :",
                            style: TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                            text: "*",
                            style: new TextStyle(color: Colors.red),
                          )
                        ])),
                    Container(
                        height: 40,
                        width: 200,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: StreamBuilder<List<QuartierItem>>(
                            stream: _bloc.quartierStream,
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? DropdownButtonHideUnderline(
                                      child: new DropdownButton<QuartierItem>(
                                          items: snapshot.data.map<
                                                  DropdownMenuItem<
                                                      QuartierItem>>(
                                              (QuartierItem value) {
                                            return DropdownMenuItem<
                                                    QuartierItem>(
                                                value: value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    value.fanDecoupage,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ));
                                          }).toList(),
                                          isExpanded: true,
                                          style: TextStyle(color: Colors.black),
                                          value: _quartier,
                                          onChanged: (QuartierItem newValue) {
                                            setState(() {
                                              _quartier = newValue;
                                            });
                                          }),
                                    )
                                  : Container();
                            }))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Complement d'adresse",
                  ),
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  controller: _controllerComplement,
                ),
              ],
            )),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RichText(
                    text: TextSpan(
                        text: "Catégorie Client",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: "*",
                        style: new TextStyle(color: Colors.red),
                      )
                    ])),
                Container(
                    height: 40,
                    width: 200,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: StreamBuilder<List<CategorieClientItem>>(
                        stream: _bloc.catClienStream,
                        builder: (context, snapshot) {
                          return snapshot.hasData && snapshot.data != null
                              ? DropdownButtonHideUnderline(
                                  child:
                                      new DropdownButton<CategorieClientItem>(
                                          items: snapshot.data.map<
                                                  DropdownMenuItem<
                                                      CategorieClientItem>>(
                                              (CategorieClientItem value) {
                                            return DropdownMenuItem<
                                                    CategorieClientItem>(
                                                value: value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    value.gs2EName,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ));
                                          }).toList(),
                                          isExpanded: true,
                                          style: TextStyle(color: Colors.black),
                                          value: _categorie,
                                          onChanged:
                                              (CategorieClientItem newValue) {
                                            setState(() {
                                              print("ici");
                                              _categorie = newValue;
                                              _bloc.getCatContractuelle(newValue
                                                  .gs2ECategorieclientid);
                                            });
                                          }),
                                )
                              : Container();
                        }))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RichText(
                    text: TextSpan(
                        text: "Type Produit ",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: "*",
                        style: new TextStyle(color: Colors.red),
                      )
                    ])),
                Container(
                    height: 40,
                    width: 200,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: StreamBuilder<List<Productbases>>(
                        stream: _bloc.productBaseStream,
                        builder: (context, snapshot) {
                          return snapshot.hasData && snapshot.data != null
                              ? DropdownButtonHideUnderline(
                                  child: new DropdownButton<Productbases>(
                                      items: snapshot.data
                                          .map<DropdownMenuItem<Productbases>>(
                                              (Productbases value) {
                                        return DropdownMenuItem<Productbases>(
                                            value: value,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                value.name,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ));
                                      }).toList(),
                                      isExpanded: true,
                                      value: _typeProduit,
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (Productbases newValue) {
                                        setState(() {
                                          _typeProduit = newValue;
                                          if (_catContractuelle != null) {
                                            _bloc.getTypeUsage(
                                                _typeProduit.productid,
                                                _catContractuelle
                                                    .jfaCategoriecontractuelleclientid);
                                          }
                                        });
                                      }),
                                )
                              : Container();
                        }))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Visibility(
                visible: widget.id == 3 || widget.id == 2,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new RichText(
                            text: TextSpan(
                                text: "Catégorie contractuelle",
                                style: TextStyle(color: Colors.black),
                                children: [
                              TextSpan(
                                text: "*",
                                style: new TextStyle(color: Colors.red),
                              )
                            ])),
                        Container(
                            height: 40,
                            width: 200,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: StreamBuilder<
                                    List<Categoriecontractuelleclientbases>>(
                                stream: _bloc.catContractuelStream,
                                builder: (context, snapshot) {
                                  return snapshot.hasData &&
                                          snapshot.data != null
                                      ? DropdownButtonHideUnderline(
                                          child: new DropdownButton<
                                                  Categoriecontractuelleclientbases>(
                                              items: snapshot.data.map<
                                                      DropdownMenuItem<
                                                          Categoriecontractuelleclientbases>>(
                                                  (Categoriecontractuelleclientbases
                                                      value) {
                                                return DropdownMenuItem<
                                                        Categoriecontractuelleclientbases>(
                                                    value: value,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        value.jfaName,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ));
                                              }).toList(),
                                              isExpanded: true,
                                              value: _catContractuelle,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              onChanged:
                                                  (Categoriecontractuelleclientbases
                                                      newValue) {
                                                setState(() {
                                                  _catContractuelle = newValue;
                                                  if (_catContractuelle !=
                                                      null) {
                                                    _bloc.getTypeUsage(
                                                        _typeProduit.productid,
                                                        _catContractuelle
                                                            .jfaCategoriecontractuelleclientid);
                                                  }
                                                });
                                              }),
                                        )
                                      : Container();
                                }))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new RichText(
                            text: TextSpan(
                                text: "Type Usage",
                                style: TextStyle(color: Colors.black),
                                children: [
                              TextSpan(
                                text: "*",
                                style: new TextStyle(color: Colors.red),
                              )
                            ])),
                        Container(
                            height: 40,
                            width: 200,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: StreamBuilder<TypeUsage>(
                                stream: _bloc.typeUsageStream,
                                builder: (context, snapshot) {
                                  return snapshot.hasData &&
                                          snapshot.data != null
                                      ? DropdownButtonHideUnderline(
                                          child: new DropdownButton<Datum>(
                                              items: snapshot.data.data
                                                  .map<DropdownMenuItem<Datum>>(
                                                      (Datum value) {
                                                return DropdownMenuItem<Datum>(
                                                    value: value,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        value.jfaName,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ));
                                              }).toList(),
                                              isExpanded: true,
                                              value: _typeUsage,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              onChanged: (Datum newValue) {
                                                setState(() {
                                                  _typeUsage = newValue;
                                                  _bloc.getBranchementActivite(
                                                      _typeUsage.jfaUsageId);
                                                });
                                              }),
                                        )
                                      : Container();
                                }))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new RichText(
                            text: TextSpan(
                                text: "Branche d'activité",
                                style: TextStyle(color: Colors.black),
                                children: [
                              TextSpan(
                                text: "*",
                                style: new TextStyle(color: Colors.red),
                              )
                            ])),
                        Container(
                            height: 40,
                            width: 200,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: StreamBuilder<Secteuractivitebases>(
                                stream: _bloc.secteurActiviteStream,
                                builder: (context, snapshot) {
                                  return snapshot.hasData &&
                                          snapshot.data != null
                                      ? DropdownButtonHideUnderline(
                                          child: new DropdownButton<
                                                  DatumSectuerActivite>(
                                              items: snapshot.data.data.map<
                                                      DropdownMenuItem<
                                                          DatumSectuerActivite>>(
                                                  (DatumSectuerActivite value) {
                                                return DropdownMenuItem<
                                                        DatumSectuerActivite>(
                                                    value: value,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        value.jfaName,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ));
                                              }).toList(),
                                              isExpanded: true,
                                              value: _secteurActivite,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              onChanged: (DatumSectuerActivite
                                                  newValue) {
                                                setState(() {
                                                  _secteurActivite = newValue;
                                                });
                                              }),
                                        )
                                      : Container();
                                }))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: new RichText(
                      text: TextSpan(
                          text:
                              "Mode de communication lié a cette demande eAgence :",
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                          text: "*",
                          style: new TextStyle(color: Colors.red),
                        )
                      ])),
                ),
                Container(
                    height: 40,
                    width: 200,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: DropdownButtonHideUnderline(
                      child: new DropdownButton<ModeCommunication>(
                          items: _listMode
                              .map<DropdownMenuItem<ModeCommunication>>(
                                  (ModeCommunication value) {
                            return DropdownMenuItem<ModeCommunication>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    value.libelle,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ));
                          }).toList(),
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          value: _currentMode,
                          onChanged: (ModeCommunication newValue) {
                            setState(() {
                              _currentMode = newValue;
                            });
                          }),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget documentWidget() {
    return StreamBuilder<List<Gs2ETypededocumentdumodelebases>>(
        stream: _bloc.typeDocStream,
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data != null
              ? Container(
                  height: 500,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return documentItem(snapshot.data[index], index);
                          },
                          itemCount: snapshot.data.length,
                        ),
                      ),
                      /*new RaisedButton(onPressed: (){
                    print(_bloc.typeDocSubject.value.length);
                    print(_fileToSend.length);
                    _fileToSend = [];
                    _mapFileToSend.forEach((index,f){
                        _fileToSend.add(f);
                    });
                    if(_fileToSend.length < _bloc.typeDocSubject.value.length){
                      Utils.showErrorToast("Veuillez charger tous les fichiers svp", context);
                    }
                    else {
                      sendData();
                    }
                  },child: new Text("Soumettre les documents"),)*/
                    ],
                  ),
                )
              : Container();
        });
  }

  void sendData() async {
    List<MultipartFile> fileM = [];
    _fileToSend.forEach((it) {
      fileM.add(MultipartFile.fromFileSync(it.path,
          filename: pathNew.basename(it.path)));
    });
    FormData formdata = new FormData.fromMap({
      "Type_Demande": "1",
      "Num_Dem_Temp": "BRA1412019003229",
      "TableLitID": jsonEncode(_bloc.saleLitteratureSubject.value
          .map((t) => t.salesliteratureid)
          .toList()),
      "fileselect": fileM
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    //formdata.add("fileselect", new  UploadFileInfo(photoFile, fileName))

    _bloc.soumettreDocument(formdata);
  }

  Widget documentItem(Gs2ETypededocumentdumodelebases item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: new Container(
        child: new RaisedButton(
            onPressed: () async {
              File file = await FilePicker.getFile();
              if (file != null) {
                setState(() {
                  _mapFileToSend[index] = file;

                  //_fileToSend.add(file);
                  print(_mapFileToSend);
                  final sorted = new SplayTreeMap.from(
                      _mapFileToSend,
                      (a, b) => int.parse(a.toString())
                          .compareTo(int.parse(b.toString())));
                  _mapFileToSend = sorted.map((key, value) {
                    return MapEntry(key, value);
                  });
                  print(_mapFileToSend);
                });
              }
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                  child: new Text(item.gs2EName),
                ),
                new Icon(Icons.file_upload)
              ],
            )),
      ),
    );
  }
}
