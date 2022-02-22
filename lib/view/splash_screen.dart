import 'dart:async';
import 'main_menu.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String versionName = '0.0.1 Beta1';
  final splashDelay = 1;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadWidget();
  }

  Future<Timer> loadWidget() async {
    Duration duration = Duration(seconds: splashDelay);
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => const Mainmenu()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
