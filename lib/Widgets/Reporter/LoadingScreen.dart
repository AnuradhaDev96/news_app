import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Dashboard.dart';

class LoadingScreen extends StatefulWidget {
      LoadingScreen({Key key}) : super(key: key);
      @override
      _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
      // final ColorSwatch colorSwatch;

      @override
      Widget build(BuildContext context) {
        return SplashScreen(
          seconds: 1,
          backgroundColor: Colors.white,
          image: Image.asset("assets/cnews.gif"),
          loaderColor: Colors.white,
          photoSize: 200.0,
          navigateAfterSeconds: Dashboard(),          
          title: Text(
            "News Today",
            style: TextStyle(
              color: Color.fromRGBO(66, 165, 245, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: 14.0
            ),
          ),          
        );
      }
    }