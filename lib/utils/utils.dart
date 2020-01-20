import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong/latlong.dart';
//import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils extends Object {
  static Future<bool> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static String formatRedable(String value) {
    String val = value;
    if(value.contains(".")){
      val = value.split(".")[0];
    }
    final formatCurrency = new NumberFormat.simpleCurrency(
        locale: "fr_FR", name: "FCFA", decimalDigits: 0);
    //print("xxxxxxxxxxxx" + formatCurrency.format(int.parse(val)));
    return formatCurrency.format(int.parse(val));
  }

  static Future<void> showErrorDialog(
      String title, String msg, BuildContext context) async {
    Navigator.of(context).pop();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          content: new Container(
            height: 50,
            decoration: new BoxDecoration(
                /*image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    fit: BoxFit.fitHeight)*/),
            child: new Center(
                child: new Text(
              msg,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
        );
      },
    );
  }

  static Future<void> showDialogWithoutPop(
      String title, String msg, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          content: new Container(
            height: 50,
            decoration: new BoxDecoration(
              /*image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    fit: BoxFit.fitHeight)*/),
            child: new Center(
                child: new Text(
                  msg,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
        );
      },
    );
  }

  static showErrorToast(String msg,BuildContext ctx){
    //Toast.show(msg, ctx,backgroundColor: Colors.redAccent,textColor: Colors.white);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showSimpleToast(String msg,BuildContext ctx){
    //Toast.show(msg, ctx,backgroundColor: Colors.redAccent,textColor: Colors.white);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        //backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  static Future<void> showLoading(String msg, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          //title: Text('Information'),
          content: new Wrap(
            //alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(),
              new SizedBox(
                width: 10,
              ),
              new Text(
                msg,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> showIdDialog(BuildContext context) async {
    return showDialog(context: context,builder: (BuildContext ctx){
      return getDailog(ctx);
    });
  }

  static Dialog getDailog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: new Container(
                width: double.maxFinite,
                color: Colors.grey[200],
                padding: EdgeInsets.all(10),
                child: new Text("Identifiant",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("vous trouverez vos references sur l'entête d'une facture. Renseignez uniquement les 9 chiffres corresondants"),
            ),
            new Container(height: 1,width: double.maxFinite,color: Colors.grey,),
            Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new InkWell(
                    child: new Text(
                      "OK",
                      style: TextStyle(color: Colors.orange, fontSize: 15),
                    ),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  new SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<void> showDailogInfo({BuildContext context,String msg,String title}) {
    Navigator.of(context).pop();
    return showDialog(context: context,builder: (BuildContext ctx){
      return Dialog(
        child: Container(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: new Container(
                  width: double.maxFinite,
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(10),
                  child: new Text(title != null ? title : "Information",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(msg),
                ),
              ),
              new Container(height: 1,width: double.maxFinite,color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Theme(
                        data: ThemeData(
                          buttonColor: Color(color_primary),
                          backgroundColor: Color(color_primary)
                        ),
                        child: new RaisedButton(
                          child: new Text("OK",style: TextStyle(color: Colors.white, fontSize: 15)),
                          color: Color(color_primary),
                          splashColor: Colors.lightBlue,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: (){

                  },
                ),
              ),

            ],
          ),
        ),
      );
    });

  }

  static Future<void> showDailogInfoError({BuildContext context,String msg,String title}) {
    Navigator.of(context).pop();
    return showDialog(context: context,builder: (BuildContext ctx){
      return Dialog(
        child: Container(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: new Container(
                  width: double.maxFinite,
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(10),
                  child: new Text(title != null ? title : "Erreur",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(msg),
                ),
              ),
              new Container(height: 1,width: double.maxFinite,color: Colors.redAccent,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Theme(
                        data: ThemeData(
                            buttonColor: Color(color_primary),
                            backgroundColor: Color(color_primary)
                        ),
                        child: new RaisedButton(
                          child: new Text("OK",style: TextStyle(color: Colors.white, fontSize: 15)),
                          color: Color(color_primary),
                          splashColor: Colors.lightBlue,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: (){

                  },
                ),
              ),

            ],
          ),
        ),
      );
    });

  }

  static Future<void> showDailogInfoWithoutPop(BuildContext context,String msg,String title, Function ontap) {
    return showDialog(context: context,builder: (BuildContext ctx){
      return Dialog(
        child: Container(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: new Container(
                  width: double.maxFinite,
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(10),
                  child: new Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(msg),
                ),
              ),
              new Container(height: 1,width: double.maxFinite,color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Theme(
                        data: ThemeData(
                            buttonColor: Color(color_primary),
                            backgroundColor: Color(color_primary)
                        ),
                        child: new RaisedButton(
                          child: new Text("OK",style: TextStyle(color: Colors.white, fontSize: 15)),
                          color: Color(color_primary),
                          splashColor: Colors.lightBlue,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: ontap,
                ),
              ),

            ],
          ),
        ),
      );
    });

  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static openMap(LatLng origin, LatLng destination) async {
    String googleUrl =
        'https://www.google.com/maps/dir/?api=1&origin=${origin.latitude},${origin.longitude}' +
            '&destination=${destination.latitude},${destination.longitude}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static openUrl(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }
}
