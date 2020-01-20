import 'package:flutter/material.dart';

Padding buildFooter() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      "© 2019 - SODECI V 2.2",
      style: TextStyle(color: Colors.grey[400]),
    ),
  );
}
