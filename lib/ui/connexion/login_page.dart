import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/ui/accueil/connecte/accueil_connect_page.dart';
import 'package:sodeci_mobile/ui/accueil/container_page.dart';
import 'package:sodeci_mobile/ui/connexion/inscription_page.dart';
import 'package:sodeci_mobile/ui/connexion/login_bloc.dart';
import 'package:sodeci_mobile/ui/connexion/mot_de_passe_oublie_page.dart';
import 'package:sodeci_mobile/ui/contact/contact_page.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:toast/toast.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final focusLogin = FocusNode();
  final focusPass = FocusNode();

  TextEditingController _controllerLogin = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _blocLogin = new LoginBloc();

  bool isUserTaped = false;

  String _currentLogin = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _blocLogin.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfoError(context: context,msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          if (value.message != null) {
            Utils.saveData(AppConstant.USER_LOGIN, _controllerLogin.value.text).then((value){
              Utils.saveData(AppConstant.isConnected, "1").then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContainerPage()),
                    ModalRoute.withName('/'));
                //Navigator.of(context).pop();
              });
            });

          }
        }
      }
    });

    _blocLogin.userInfoSubject.listen((value){
      if(value != null){
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              child: _blocLogin.userInfoSubject.value != null
                                  ? listUserBloc()
                                  : connectBloc(),
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

  Widget listUserBloc() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: new Text(
            "Bienvenue, ${ isUserTaped ? _blocLogin.userInfoSubject.value.lastname : 'choissisez votre compte'}",
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
        ),
        new SizedBox(
          height: 10,
        ),
        Visibility(
          visible: !isUserTaped,
          child: new RaisedButton(
            onPressed: () {
              setState(() {
                isUserTaped = true;
              });
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(
                      width: 15,
                    ),
                    new Text(
                      "${_blocLogin.userInfoSubject.value.lastname} ${_blocLogin.userInfoSubject.value.firstname}",
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    )
                  ],
                ),
                Flexible(
                  child: new IconButton(icon: Icon(Icons.restore_from_trash,color: Colors.red,), onPressed: (){
                    Utils.clear(AppConstant.USER_LINK);
                    Utils.clear(AppConstant.USER_INFO);
                    setState(() {
                      _blocLogin.userInfoSubject.add(null);
                    });
                  }),
                )
              ],
            ),
          ),
        ),
        Visibility(
            visible: isUserTaped,
            child: Form(
              key: _formKey,
              child: ListView(
                //mainAxisSize: MainAxisSize.min,
                shrinkWrap: true,
                children: <Widget>[
                  /*TextFormField(
                  decoration: InputDecoration(
                      hintText: "Login",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade50, fontWeight: FontWeight.w200)),
                  style: field_style,
                  controller: _controllerLogin,
                  focusNode: focusLogin,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    Utils.fieldFocusChange(context, focusLogin, focusPass);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Champ obligatoire";
                    } else
                      return null;
                  },
                ),*/
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade50, fontWeight: FontWeight.w200),
                        suffixIcon: GestureDetector(
                          child: _isObscure
                              ? Icon(FontAwesomeIcons.solidEye)
                              : Icon(FontAwesomeIcons.eyeSlash),
                          onTap: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                    controller: _controllerPassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _isObscure,
                    focusNode: focusPass,
                    style: field_style,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Champ obligatoire";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "CONNEXION",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        logUser();
                      }
                    },
                  ),
                ],
              ),
            )
        ),
        new SizedBox(height: 30,),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Text(
                "Mot de passe oublié ?",
                style: TextStyle(color: Colors.lightBlue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MotDePasseOubliePage()));
              },
            ),

            Visibility(
              visible: !isUserTaped,
              child: GestureDetector(
                child: Text(
                  "Se connecter",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                 setState(() {
                   isUserTaped = true;
                 });
                },
              ),
            ),

          ],
        )
      ],
    )
    ;
  }

  Widget connectBloc() {
    return Form(
      key: _formKey,
      child: ListView(
        //mainAxisSize: MainAxisSize.min,
        shrinkWrap: true,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: "Login",
                hintStyle: TextStyle(
                    color: Colors.grey.shade50, fontWeight: FontWeight.w200)),
            style: field_style,
            controller: _controllerLogin,
            focusNode: focusLogin,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              Utils.fieldFocusChange(context, focusLogin, focusPass);
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Champ obligatoire";
              } else
                return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Mot de passe",
                hintStyle: TextStyle(
                    color: Colors.grey.shade50, fontWeight: FontWeight.w200),
                suffixIcon: GestureDetector(
                  child: _isObscure
                      ? Icon(FontAwesomeIcons.solidEye)
                      : Icon(FontAwesomeIcons.eyeSlash),
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )),
            controller: _controllerPassword,
            textInputAction: TextInputAction.done,
            obscureText: _isObscure,
            focusNode: focusPass,
            style: field_style,
            validator: (value) {
              if (value.isEmpty) {
                return "Champ obligatoire";
              } else
                return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            minWidth: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "CONNEXION",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.green,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                logUser();
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotDePasseOubliePage()));
                },
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                child: Text(
                  "S'inscrire",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InscriptionPage()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  logUser() {
    FormData formdata = new FormData.fromMap({
      "lgn": _blocLogin.userInfoSubject.value == null ? _controllerLogin.value.text : _blocLogin.userLoginSubject.value,
      "pss":  _controllerPassword.value.text
    });
    _blocLogin.logUser(formdata);
  }

  logUserExist() {
    FormData formdata = new FormData.fromMap({
      "lgn": _controllerLogin.value.text,
      "pss": _controllerPassword.value.text
    });
    _blocLogin.logUser(formdata);
  }

  Container buildFooter() {
    return Container(
      width: double.infinity,
      color: Colors.black.withAlpha(150),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "2019 - SODECI V 2.2",
          style: TextStyle(color: Colors.grey[400]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
