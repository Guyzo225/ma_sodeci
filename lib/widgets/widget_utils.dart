import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sodeci_mobile/ui/mon_compteur/mon_compteur_info_page.dart';

Widget buildIncidentType({String name, String icon,int index,BuildContext ctx}) {
  return GestureDetector(
    child: Center(
        child: Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(color_primary), width: 1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              height: 30,
              width: 30,
              color: Color(color_primary),
            )),
        SizedBox(
          height: 5,
        ),
        Text(
          name == null ? "Eclairage Public" : name,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 10),
          textAlign: TextAlign.center,
        )
      ],
    )),
    onTap: (){
      if(ctx != null){
        Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext context){
          return MonCompteurInfoPage(index: index,);
        }));
      }

    },
  );
}

Center appBarTitle() {
  return Center(
      child: Image.asset(
    "assets/images/logo.png",
    width: 90,
    height: 80,
  ));
}

PreferredSize simpleAppBar({String appTitle,BuildContext context}){
  return new PreferredSize(
    child: new Container(
      //padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new Row(
        children: <Widget>[
          new SizedBox(width: 10,),
          InkWell(
            splashColor: Colors.orange,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Expanded(
            child: new Center(
              child: Text(appTitle,style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(color_primary),
            Color(color_primary_light),
            Color(color_primary)
          ]),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey[500],
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]),
    ),
    preferredSize: new Size(MediaQuery.of(context).size.width, 50.0),
  );
}

AppBar SimpleMaterialAppBar({String appTitle, BuildContext context}) {
  return new AppBar(
    title: new Text(appTitle),
    centerTitle: true,
    leading: new InkWell(
      splashColor: Colors.orange,
      child: new Icon(Icons.arrow_back),
      onTap: (){
        Navigator.of(context).pop();
      },
    ),
  );
}

Column menuButton({String name, String icon}) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(color_primary),width: 2)

        ),
        child: SvgPicture.asset(
          icon,
          height: 30,
          width: 30,
          color: Color(color_primary),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        name == null ? "Infos utiles" : name,
        style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            ),
        textAlign: TextAlign.center,
      )
    ],
  );
}

Container menuButtonConnected({String name, String icon}) {
  return Container(
    width: 80,
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(color_primary),width: 2)

          ),
          child: SvgPicture.asset(
            icon,
            height: 25,
            width: 25,
            color: Color(color_primary),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name == null ? "Infos utiles" : name,
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 10,),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}

GestureDetector buildBackButton(BuildContext context) {
  return GestureDetector(
    child: Icon(Icons.arrow_back),
    onTap: () {
      Navigator.pop(context);
    },
  );
}
