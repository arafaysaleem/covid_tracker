import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String selectedUrl;

  MyWebView({
    Key key,
    @required this.selectedUrl,
  }) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  bool _loaded = false;
  String error="";

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "COVID TODAY",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 19,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            !_loaded
                ? LinearProgressIndicator(
                    value: null,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  )
                : Container(),
            error!="" 
            ? Expanded(
                child: Align(
                alignment: Alignment.center,
                child: const Text("HTTP 404 Error: Failed to load resource",style: TextStyle(color: Colors.grey,fontSize: 30),),
                ),
            ) 
            :Flexible(
              fit: FlexFit.loose,
              child: WebView(
                initialUrl: widget.selectedUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webviewcontroller) {
                  _controller.complete(webviewcontroller);
                },
                onPageFinished: (url){
                  setState(() {
                    _loaded=true;
                  });
                },
                onWebResourceError: (err){
                  setState(() {
                    error=err.description;
                  });
                },
                gestureRecognizers: Set()
                  ..add(
                    Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer()),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
