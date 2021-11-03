import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:kikicall/main.dart';

class Splash extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  String _versionName = 'V1.0';
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/kikicall.png',
                        height: 400,
                        width: 500,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Colors.purple,
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Spacer(),
                            Text(_versionName),
                            Spacer(
                              flex: 4,
                            ),
                            Text('Loading...'),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
