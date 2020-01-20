import 'package:flutter/material.dart';

class CadreInstitutionnelPage extends StatefulWidget {
  @override
  _CadreInstitutionnelPageState createState() =>
      _CadreInstitutionnelPageState();
}

class _CadreInstitutionnelPageState extends State<CadreInstitutionnelPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 20,),
                  Icon(Icons.add_circle, color: Colors.white),
                  SizedBox(width: 20,),
                  Icon(Icons.remove_circle, color: Colors.white),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(Icons.close, color: Colors.white),
                ],
              ),
              Expanded(
                child: Center(
                  child: Image.asset("assets/images/cadre.jpg"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
