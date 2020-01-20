
import "package:flutter/material.dart";
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:photo_view/photo_view.dart';

class PdfViewPage extends StatefulWidget {

  final String  assetLink;

  PdfViewPage({key,this.assetLink}): super(key:key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {


  static const scale = 100.0 / 72.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
          child: PhotoView(
            imageProvider: AssetImage(widget.assetLink),
          )
      ),
    );
  }


}
