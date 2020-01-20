import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';

Container buildHeader(
    {String name, String icon, IconData iconInfo, Function onTap}) {
  return Container(
    height: 120,
    padding: EdgeInsets.only(top: 10,right: 10,bottom: 10,left: 30),
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/header_app_2.png"),fit: BoxFit.cover)
    ),
    alignment: Alignment.topLeft,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Image.asset(icon,width: 60,height: 60,color: Colors.white70,),
        /*new SvgPicture.asset(
          icon,
          width: 40,
          height: 40,
          color: Colors.transparent,
        ),*/
        SizedBox(
          width: 30,
        ),
        Text(
          name == null ? "Infos utiles" : name,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: iconInfo == null
              ? Container()
              : GestureDetector(
                  child: Icon(iconInfo, color: Colors.white),
                  onTap: onTap,
                ),
        )
      ],
    ),
  );
}
