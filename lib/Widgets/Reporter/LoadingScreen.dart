import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Dashboard.dart';

class LoadingScreen extends StatefulWidget {
      LoadingScreen({Key key}) : super(key: key);
      @override
      _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
      
      @override
      Widget build(BuildContext context) {
        return SplashScreen(
          seconds: 8,
          backgroundColor: Colors.white,
          image: Image.asset("assets/cnews.gif"),
          loaderColor: Colors.white,
          photoSize: 200.0,
          navigateAfterSeconds: Dashboard(),          
          title: Text(
            "News Today",
            style: TextStyle(
              color: Colors.purple[400],
              fontWeight: FontWeight.bold,
              fontSize: 14.0
            ),
          ),          
        );
      }
    }