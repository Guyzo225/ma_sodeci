import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/saphirV3/gs2e_civilitebases.dart';
import 'package:sodeci_mobile/ui/connexion/inscription_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'dart:convert' show utf8;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

enum SingingCharacter { isClient, isNotClient }

class _InscriptionPageState extends State<InscriptionPage> {
  //Focusnode is use to request next field
  final focusNom = FocusNode();
  final focusContact = FocusNode();
  final focusContact2 = FocusNode();
  final focusReference = FocusNode();
  final focusPrenom = FocusNode();
  final focusNumero = FocusNode();
  final focusEmail = FocusNode();
  final focusLogin = FocusNode();
  final focusMotPass = FocusNode();
  final focusMotPassVerif = FocusNode();

  TextEditingController _controllerRef = new TextEditingController();
  TextEditingController _controllerContact = new TextEditingController();
  TextEditingController _controllerContactRep = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerLogin = new TextEditingController();
  TextEditingController _controllerPass = new TextEditingController();
  TextEditingController _controllerPassRep = new TextEditingController();
  TextEditingController _controllerNom = new TextEditingController();
  TextEditingController _controllerPrenom = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //Checkbox for acceptance
  bool _isAccepted = false;
  String currentAge = "JJ/MM/AAAA";
  String currenAgeValue = "";

  bool _isObscurePass = true;

  SingingCharacter _isClient = SingingCharacter.isNotClient;
  IndicatifItem _indicatif = null;
  //CiviliteItem _civilite = null;
  Civilitebases _civilite = null;

  InscriptionBloc _inscriptionBloc = new InscriptionBloc();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inscriptionBloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
        if(value.message == "Reference invalide"){
          setState(() {
            _controllerRef.clear();
            FocusScope.of(context).requestFocus(focusReference);
          });
        }
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfoError(context: context,msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          if (value.message != null) {
            /*Toast.show(value.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);*/
            Utils.showSimpleToast(value.message, context);
            Navigator.of(context).pop();
          }
        }
      }
    });



    _inscriptionBloc.getAllIndicatif();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Center(
          child: appBarTitle(),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(130),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              padding: EdgeInsets.symmetric(
                                  vertical: 35.0, horizontal: 24.0),
                              child: new Form(
                                key: _formKey,
                                child: ListView(
                                  //mainAxisSize: MainAxisSize.min,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    new Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: ListTile(
                                            title: const Text(
                                              'Pas client',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            leading: Radio(
                                              value:
                                                  SingingCharacter.isNotClient,
                                              groupValue: _isClient,
                                              onChanged:
                                                  (SingingCharacter value) {
                                                setState(() {
                                                  _isClient = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: ListTile(
                                            title: const Text('Client sodeci',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                            leading: Radio(
                                              value: SingingCharacter.isClient,
                                              groupValue: _isClient,
                                              onChanged:
                                                  (SingingCharacter value) {
                                                setState(() {
                                                  _isClient = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Visibility(
                                      visible: _isClient ==
                                          SingingCharacter.isClient,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Réference Client",
                                            labelStyle: label_field_style,
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade50,
                                                fontWeight: FontWeight.w200)),
                                        textInputAction: TextInputAction.next,
                                        autofocus: true,
                                        controller: _controllerRef,
                                        style: field_style,
                                        validator: (value){
                                          if(_isClient == SingingCharacter.isClient){
                                            if(value.isEmpty){
                                              return "Champ obligatoire";
                                            }
                                          }
                                          return null;
                                        },
                                        focusNode: focusReference,
                                        onFieldSubmitted: (v) {
                                          _fieldFocusChange(context,
                                              focusReference, focusContact);
                                        },
                                        onChanged: (value){
                                          print(value);
                                          if(value.length >= 9){
                                            _inscriptionBloc.checkId(value);
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text(
                                          "Indicatif *",
                                          style: field_style,
                                        ),
                                        Container(
                                            height: 40,
                                            width: 200,
                                            decoration: new BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            child:
                                                StreamBuilder<
                                                        List<IndicatifItem>>(
                                                    stream: _inscriptionBloc
                                                        .indicatifStream,
                                                    // a Stream<int> or null
                                                    initialData: [],
                                                    builder:
                                                        (context, snapshot) {
                                                      return snapshot.hasData
                                                          ? DropdownButtonHideUnderline(
                                                              child: new DropdownButton<
                                                                      IndicatifItem>(
                                                                  items: snapshot.data.map<
                                                                      DropdownMenuItem<
                                                                          IndicatifItem>>(
                                                                      (IndicatifItem
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        IndicatifItem>(
                                                                      value:
                                                                          value,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 10),
                                                                        child:
                                                                            new Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            new Text(value.codeIndicatif),
                                                                            Flexible(
                                                                                child: Padding(
                                                                              padding: const EdgeInsets.only(top: 6),
                                                                              child: new Text(
                                                                                value.paysIndicatif,
                                                                                style: TextStyle(color: Color(color_primary), fontSize: 11),
                                                                              ),
                                                                            ))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).toList(),
                                                                  isExpanded:
                                                                      true,
                                                                  value:
                                                                      _indicatif,
                                                                  onChanged:
                                                                      (IndicatifItem
                                                                          newValue) {
                                                                    setState(
                                                                        () {
                                                                          print(newValue.id);
                                                                      _indicatif =
                                                                          newValue;
                                                                    });
                                                                  }),
                                                            )
                                                          : Container();
                                                    })),
                                      ],
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                //hintText: "Contact *",
                                                labelText: "Contact *",
                                                labelStyle: label_field_style,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey.shade50,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                errorStyle: error_field_style),
                                            style: field_style,
                                            controller: _controllerContact,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.phone,
                                            focusNode: focusContact,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Champ Obligatoire";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onFieldSubmitted: (v) {
                                              _fieldFocusChange(context,
                                                  focusContact, focusContact2);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Contact 2",
                                              labelStyle: label_field_style,
                                              hintStyle: TextStyle(
                                                  color: Colors.grey.shade50,
                                                  fontWeight: FontWeight.w200),
                                            ),
                                            style: field_style,
                                            controller: _controllerContactRep,
                                            focusNode: focusContact2,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.phone,
                                            onFieldSubmitted: (v) {
                                              _fieldFocusChange(context,
                                                  focusContact2, focusEmail);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          labelStyle: label_field_style,
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade50,
                                              fontWeight: FontWeight.w200),
                                          errorStyle: error_field_style),
                                      style: field_style,
                                      controller: _controllerEmail,
                                      focusNode: focusEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (v) {
                                        _fieldFocusChange(
                                            context, focusEmail, focusLogin);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Champ Obligatoire";
                                        }
                                        Pattern pattern =
                                            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9]+)*$';
                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(value)) {
                                          return "E-mail invalide";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Login",
                                          labelStyle: label_field_style,
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade50,
                                              fontWeight: FontWeight.w200),
                                          errorStyle: error_field_style),
                                      style: field_style,
                                      textInputAction: TextInputAction.next,
                                      controller: _controllerLogin,
                                      focusNode: focusLogin,
                                      onFieldSubmitted: (v) {
                                        _fieldFocusChange(
                                            context, focusLogin, focusMotPass);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Champ Obligatoire";
                                        }
                                        if (value.length < 8) {
                                          return "8 caractères minimum";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Mot de passe",
                                          labelStyle: label_field_style,
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade50,
                                              fontWeight: FontWeight.w200),
                                          errorStyle: error_field_style,
                                          suffixIcon: new InkWell(
                                            child: new Icon(_isObscurePass
                                                ? FontAwesomeIcons.solidEye
                                                : FontAwesomeIcons.eyeSlash),
                                            onTap: () {
                                              setState(() {
                                                _isObscurePass =
                                                    !_isObscurePass;
                                              });
                                            },
                                          )),
                                      style: field_style,
                                      textInputAction: TextInputAction.next,
                                      focusNode: focusMotPass,
                                      obscureText: _isObscurePass,
                                      controller: _controllerPass,
                                      onFieldSubmitted: (v) {
                                        _fieldFocusChange(context, focusMotPass,
                                            focusMotPassVerif);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Champ Obligatoire";
                                        }
                                        if (value.length < 8) {
                                          return "8 caractères minimum";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText:
                                              "Confirmation mot de passe",
                                          labelStyle: label_field_style,
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade50,
                                              fontWeight: FontWeight.w200),
                                          errorStyle: error_field_style),
                                      style: field_style,
                                      controller: _controllerPassRep,
                                      obscureText: _isObscurePass,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Champ Obligatoire";
                                        } else {
                                          return null;
                                        }
                                      },
                                      textInputAction: TextInputAction.done,
                                      focusNode: focusMotPassVerif,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text(
                                          "Civilité *",
                                          style: field_style,
                                        ),
                                        Container(
                                            height: 40,
                                            width: 200,
                                            decoration: new BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            child:
                                                new StreamBuilder<
                                                        List<Civilitebases>>(
                                                    stream: _inscriptionBloc
                                                        .civiliteStream,
                                                    // a Stream<int> or null
                                                    initialData: [],
                                                    builder:
                                                        (context, snapshot) {
                                                      return snapshot.hasData &&
                                                              snapshot.data !=
                                                                  null
                                                          ? DropdownButtonHideUnderline(
                                                              child: new DropdownButton<
                                                                  Civilitebases>(
                                                                  items: snapshot.data.map<
                                                                      DropdownMenuItem<
                                                                          Civilitebases>>(
                                                                      (Civilitebases
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        Civilitebases>(
                                                                      value:
                                                                          value,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 10),
                                                                        child: value !=
                                                                                null
                                                                            ? Text(value.gs2EName)
                                                                            : Text(""),
                                                                      ),
                                                                    );
                                                                  }).toList(),
                                                                  isExpanded:
                                                                      true,
                                                                  value:
                                                                      _civilite,
                                                                  onChanged:
                                                                      (Civilitebases
                                                                          newValue) {
                                                                    setState(
                                                                        () {
                                                                      _civilite =
                                                                          newValue;
                                                                    });
                                                                  }),
                                                            )
                                                          : Container();
                                                    })),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Nom *",
                                        labelStyle: label_field_style,
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade50,
                                            fontWeight: FontWeight.w200),
                                        errorStyle: error_field_style,
                                      ),
                                      style: field_style,
                                      textInputAction: TextInputAction.next,
                                      autofocus: true,
                                      controller: _controllerNom,
                                      focusNode: focusNom,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Champ Obligatoire";
                                        }
                                        if(_isClient == SingingCharacter.isClient && _inscriptionBloc.contactSubjet.value.length>0){
                                          if(value.length > 3){
                                            if( value.toUpperCase() != _inscriptionBloc.contactSubjet.value[0].lastname.toUpperCase() ){
                                              "Nom invalide";
                                            }

                                          }
                                        }
                                        return null;
                                      },
                                      /*onChanged: (value){
                                        if(_isClient == SingingCharacter.isClient && _inscriptionBloc.contactSubjet.value.length>0){
                                          print(_inscriptionBloc.contactSubjet.value[0].lastname);
                                          if(value.length > 3){
                                            if( value.toUpperCase() != _inscriptionBloc.contactSubjet.value[0].lastname.toUpperCase() ){
                                              print("ici");
                                              Utils.showErrorToast("Nom invalide", context);
                                            }

                                          }
                                        }
                                      },*/
                                      onFieldSubmitted: (v) {
                                        _fieldFocusChange(
                                            context, focusNom, focusPrenom);
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Prénoms *",
                                          labelStyle: label_field_style,
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade50,
                                              fontWeight: FontWeight.w200),
                                          errorStyle: error_field_style),
                                      controller: _controllerPrenom,
                                      style: field_style,
                                      textInputAction: TextInputAction.next,
                                      focusNode: focusPrenom,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Champ Obligatoire";
                                        }
                                        if(_isClient == SingingCharacter.isClient && _inscriptionBloc.contactSubjet.value.length>0){
                                          if(value.length > 3){
                                            if( value.toUpperCase() != _inscriptionBloc.contactSubjet.value[0].firstname.toUpperCase() ){
                                              return "Prénoms invalide";
                                            }

                                          }
                                        }
                                        return null;
                                      },
                                      /*onChanged: (value){
                                        if(_isClient == SingingCharacter.isClient && _inscriptionBloc.contactSubjet.value.length>0){
                                          if(value.length > 3){
                                            if( value.toUpperCase() != _inscriptionBloc.contactSubjet.value[0].firstname.toUpperCase() ){
                                              Utils.showErrorToast("Prénoms invalide", context);
                                            }

                                          }
                                        }
                                      },*/
                                      onFieldSubmitted: (v) {
                                        _fieldFocusChange(
                                            context, focusPrenom, focusNumero);
                                      },
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          child: new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 5),
                                            child: new Text(
                                              "Date de naissance",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: new GestureDetector(
                                            child: new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: new Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 40,
                                                  width: double.infinity,
                                                  decoration: new BoxDecoration(
                                                      //color: Color(colorTextFielFellColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30.0))),
                                                  child: new Text(
                                                    currentAge,
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                )),
                                            onTap: () {
                                              debugPrint('ici');
                                              var res = selectedDate(context);
                                              res.then((value) {
                                                debugPrint(
                                                    new DateFormat("dd/MM/yyyy")
                                                        .format(value));
                                                setState(() {
                                                  currentAge = new DateFormat(
                                                          "dd/MM/yyyy")
                                                      .format(value);
                                                  currenAgeValue =
                                                      new DateFormat(
                                                              "dd-MM-yyyy")
                                                          .format(value);
                                                });
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Accepter les termes et conditions",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Checkbox(
                                          value: _isAccepted,
                                          onChanged: (value) => {
                                            setState(() {
                                              _isAccepted = value;
                                            })
                                          },
                                        )
                                      ],
                                    ),
                                    MaterialButton(
                                      minWidth: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          "S'INSCRIRE",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      color: Colors.green,
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          makeInscription();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.green, width: 5)),
                          child: Icon(Icons.person, color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            buildFooter()
          ],
        ),
      ),
    );
  }

  makeInscription() {
    print(_indicatif.id);
    FormData formdata = new FormData.fromMap({
      "Value_Eml": _controllerEmail.value.text,
      "Value_Ref_Cli":
          _isClient == SingingCharacter.isClient ? _controllerRef.value.text : null,
      "CntcId": _isClient == SingingCharacter.isClient ? _inscriptionBloc.contactSubjet.value[0].contactid : null,
      "GnrCl": _isClient == SingingCharacter.isClient ? _inscriptionBloc.contactSubjet.value[0].gs2EGenreclientid: null,
      "Value_Lgn": _controllerLogin.value.text,
      "Value_Nm": _controllerNom.value.text,
      "Value_PreNm": _controllerPrenom.value.text,
      "Value_Dat_Naiss": currenAgeValue,
      "Value_Tl_Pers_Port": _controllerContact.value.text,
      "Ind_Cel_1": _indicatif.id,
      "Tel_2": _controllerContactRep.value.text,
      "Ind_Cel_2": _indicatif.id,
      "Value_Civil": _civilite.gs2ECiviliteid,
      "Value_Pswd": _controllerPass.value.text,
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    _inscriptionBloc.inscriptUser(formdata);
  }

  Future<DateTime> selectedDate(BuildContext ctx) async {
    final datePicked = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime.now(),
        locale: const Locale('fr', 'CA'),
        initialDatePickerMode: DatePickerMode.day);

    return datePicked;
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Container buildFooter() {
    return Container(
      width: double.infinity,
      color: Colors.black.withAlpha(150),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "2019 - SODECI V 1.0",
          style: TextStyle(color: Colors.grey[400]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
