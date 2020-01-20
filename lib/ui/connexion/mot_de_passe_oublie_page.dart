import 'package:flutter/material.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class MotDePasseOubliePage extends StatefulWidget {
  @override
  _MotDePasseOubliePageState createState() => _MotDePasseOubliePageState();
}

class _MotDePasseOubliePageState extends State<MotDePasseOubliePage> {
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
                              borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(130),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
                              padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade50,
                                            fontWeight: FontWeight.w200)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MaterialButton(
                                    minWidth: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        "REINITIALISER",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    color: Colors.green,
                                    onPressed: () {},
                                  ),
                                ],
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
