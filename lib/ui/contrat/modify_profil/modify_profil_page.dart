import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modification_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:dio/dio.dart';

class ModifyProfilPage extends StatefulWidget {
  @override
  _ModifyProfilPageState createState() => _ModifyProfilPageState();
}

class _ModifyProfilPageState extends State<ModifyProfilPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerContact = new TextEditingController();
  TextEditingController _controllerContactRep = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerNom = new TextEditingController();
  TextEditingController _controllerPrenom = new TextEditingController();

  IndicatifItem _indicatif = null;


  ModifyProfilBloc _bloc = ModifyProfilBloc();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc.userInfoSubject.listen((value){
      if(value != null){
        setState(() {
          _controllerContact = new TextEditingController(text: value.mobilephone ?? "");
          _controllerContactRep = new TextEditingController(text: value.telephone1 ?? "");
          _controllerEmail = new TextEditingController(text: value.emailaddress1 ?? "");
          _controllerNom = new TextEditingController(text: value.lastname);
          _controllerPrenom = new TextEditingController(text: value.firstname);
        });

      }
    });


    _bloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfoError(context: context,msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          if (value.message != null) {
            /*Toast.show(value.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);*/
            Future.delayed(Duration(seconds: 3),(){
              print("delayed over");
              Navigator.of(context).pop();
            });
            Utils.showDailogInfoWithoutPop(context, value.message, "Information",(){
              Navigator.of(context).pop();
            });
          }
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text("Modification du profil"),
              centerTitle: true,
              leading: new InkWell(
                splashColor: Colors.orange,
                child: new Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Form(
                  key: _formKey,
                  child: new Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          //hintText: "Contact *",
                            labelText: "Nom *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerNom,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        readOnly: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          //hintText: "Contact *",
                            labelText: "Prenoms *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerPrenom,
                        readOnly: true,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          } else {
                            return null;
                          }
                        },
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
                                  stream: _bloc
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
                      TextFormField(
                        decoration: InputDecoration(
                            //hintText: "Contact *",
                            labelText: "Contact *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerContact,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Contact 2",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade50,
                              fontWeight: FontWeight.w200),
                        ),
                        style: field_style,
                        controller: _controllerContactRep,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isNotEmpty) {
                            Pattern pattern =
                                r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9]+)*$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return "E-mail invalide";
                            }
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new Container(
                        width: double.maxFinite,
                        child: new RaisedButton(
                          color: Colors.blue.withOpacity(0.5),
                          onPressed: () => {makeUpdate()},
                          child: new Text("Mettre à jour",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      )
                    ],
                  )),
            )));
  }


  makeUpdate() {
    if(_indicatif == null){
      Utils.showErrorToast("Veuillez choisir un indicatif svp !", context);
      return;
    }
    print(_indicatif.id);
    FormData formdata = new FormData.fromMap({
      "Value_Eml": _controllerEmail.value.text,
      "Id_Indiv": _bloc.userSubject.value.idUser,
      "Value_Tl_Pers_Port": _controllerContact.value.text,
      "Ind_Cel_1": _indicatif.id,
      "Tel_2": _controllerContactRep.value.text,
      "Ind_Cel_2": _indicatif.id,
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    _bloc.updateUser(formdata);
  }

}
