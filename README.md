# Share Files Socially (image, pdf, video...)

Another Flutter plugin let you share easily files socially.

## Installation

In the dependencies: section of your pubspec.yaml, add the following line:
```
<<<<<<< HEAD
  share_files_socially: ^0.0.4
=======
  share_files_socially: ^0.0.1
>>>>>>> 49e59c410c9043692544ddc3e48edf74cce58597
```
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

https://youtu.be/UiEsHvlJDqI
 