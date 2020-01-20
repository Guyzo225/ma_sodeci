import 'dart:async';

import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_login_bloc.dart';
import 'package:sodeci_mobile/ui/contrat/modify_profil/modify_password_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:dio/dio.dart';

class ModifyLoginPage extends StatefulWidget {
  @override
  _ModifyPasswordPageState createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyLoginPage> {


  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerLastLogin = new TextEditingController();
  TextEditingController _controllerNewLogin = new TextEditingController();
  TextEditingController _controllerNewLoginRep = new TextEditingController();

  ModifyLoginBloc _bloc = new ModifyLoginBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfo(context: context,msg: value.message);
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
              title: new Text("Modification du Login"),
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
                            labelText: "Ancien Login *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerLastLogin,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          } else {
                            return null;
                          }
                        },

                        onChanged: (value){
                          if(value.length >= 8){
                            Future.delayed(Duration(seconds: 3),()=>{verifyLogin(false)});
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          //hintText: "Contact *",
                            labelText: "Nouveau Login *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerNewLogin,
                        textInputAction: TextInputAction.next,
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
                            labelText: "Réssaisir le nouveau login *",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w200),
                            errorStyle: error_field_style),
                        controller: _controllerNewLoginRep,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Champ Obligatoire";
                          }
                          if(value != _controllerNewLogin.value.text){
                            return "Les deux Login ne concordent pas";
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
                              makeChangeLogind()
                            }
                          },
                          child: new Text("Mettre à jour",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      )
                    ],
                  )),
            )));
  }

  void makeChangeLogind(){
    if(_bloc.loginSubject.value == false){
      Utils.showErrorToast("Vérifié le login saisi", context);
      return;
    }
    FormData formdata = new FormData.fromMap({
      "Value": _controllerNewLogin.value.text,
      "Id_Indiv": _bloc.userSubject.value.idUser,
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    _bloc.updateLogin(formdata);
  }



  void verifyLogin(bool isNew){
    FormData formdata = !isNew ?  new FormData.fromMap({
      "Val": _controllerLastLogin.value.text,
      "id_ind": _bloc.userSubject.value.idUser,
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    }) : new FormData.fromMap({
      "Val": _controllerLastLogin.value.text,
      "id_ind": _bloc.userSubject.value.idUser,
      "Othr":"1"
      // upload with bytes (List<int>)
      // Pass multiple files within an Array
    });

    _bloc.verifyLogin(formdata,context,isNew);
  }
}
