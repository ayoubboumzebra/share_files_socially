import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:share_files_socially/share_files_socially.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ShareFilesSocially.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share files socially'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              RaisedButton(
                child: Text('Share image'),
                onPressed: (){
                  ShareFilesSocially.shareFile('assets/imgs', 'flutter_logo.png');
                },
              ),
              RaisedButton(
                child: Text('Share video'),
                onPressed: (){
                  ShareFilesSocially.shareFile('assets/files', 'video.mp4');
                },
              ),
              RaisedButton(
                child: Text('Share pdf'),
                onPressed: (){
                  ShareFilesSocially.shareFile('assets/files', 'test.pdf');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
