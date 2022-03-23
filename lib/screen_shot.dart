

import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class Screenshot extends StatefulWidget {
  Screenshot({Key? key}) : super(key: key);

  @override
  State<Screenshot> createState() => _ScreenshotState();
}

class _ScreenshotState extends State<Screenshot> {
  bool isScreenshotAllowed = true;

  void toogleScreenshot() {
    if (isScreenshotAllowed) {
      FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    } else {
      FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }
    setState(() {
      isScreenshotAllowed = !isScreenshotAllowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ScreenShot")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isScreenshotAllowed
                ? "Screen Shot : Allowed"
                : "Screen Shot :BLocked"),
            ElevatedButton(
                onPressed: () {
                  toogleScreenshot();
                },
                child: Text(isScreenshotAllowed
                    ? "Block Screenshot"
                    : "Allow ScreenShot"))
          ],
        ),
      ),
    );
  }
}
