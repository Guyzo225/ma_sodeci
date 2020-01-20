import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayementPage extends StatefulWidget {

  final String url;

  PayementPage({Key key, @required this.url}):super(key:key);

  @override
  _PayementPageState createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: simpleAppBar(appTitle: "Payement", context: context),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
        ),
      ),
    );
  }
}
