# Share Files Socially (image, pdf, video...)

Another Flutter plugin let you share easily files socially.

## Installation

In the dependencies: section of your pubspec.yaml, add the following line:

  .????????????

## Usage

```dart

import 'package:share_files_socially/share_files_socially.dart';

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
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
              )
            ],
          ),
        ),
      ),
    );
  }

```

## DEMO

[Demo share files socially with Flutter](https://media.giphy.com/media/StdX1bnv7iIsF6HbNA/giphy.gif)

![In action](https://user-images.githubusercontent.com/6718144/56463745-45ec0380-63b0-11e9-8e56-0dba5deabb1a.gif)
