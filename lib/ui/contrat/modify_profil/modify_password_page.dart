import 'dart:async';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_password_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:dio/dio.dart';

class ModifyPasswordPage extends StatefulWidget {
  @override
  _ModifyPasswordPageState createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyPasswordPage> {


  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerLastPass = new TextEditingController();
  TextEditingController _controllerNewPass = new TextEditingController();
  TextEditingController _controllerNewPassRep = new TextEditingController();

  ModifyPasswordBloc _bloc = new ModifyPasswordBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
              title: new Text("Modification du Mot de passe"),
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
                            labelText: "Ancien mot de passe *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerLastPass,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          } else {
                            return null;
                          }
                        },

                        onChanged: (value){
                          if(value.length >= 8){
                            Future.delayed(Duration(seconds: 3),()=>{verifyPass()});
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          //hintText: "Contact *",
                            labelText: "Nouveau mot de passe *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerNewPass,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
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
                            labelText: "Réssaisir le nouveau mot de passe *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerNewPassRep,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          }
                          if(value != _controllerNewPass.value.text){
                            return "Les deux mot de passe ne concordent pas";
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
                          onPressed: () => {
                            if(_formKey.currentState.validate()) {
                              makeChangePassword()
                            }
                          },
                          child: new Text("Mettre à jour",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      )
                    ],
                  )),
            )));
  }

  void makeChangePassword(){
    if(_bloc.passSubject.value == false){
      Utils.showErrorToast("L'ancien mot de pass est incorrecte", context);
      return;
    }
    FormData formdata = new FormData.fromMap({
      "Value_New_Pswd": _controllerNewPass.value.text,
      "Id_Indiv": _bloc.userSubject.value.idUser,
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    _bloc.updatePassword(formdata);
  }



  void verifyPass(){
    FormData formdata = new FormData.fromMap({
      "ValEntered": _controllerLastPass.value.text,
      "Id_Indiv": _bloc.userSubject.value.idUser,
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    _bloc.verifyPassword(formdata,context);
  }
}
