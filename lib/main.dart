import 'package:flutter/material.dart';
import 'Widgets/Reporter/LoadingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        //primarySwatch: Colors.grey,
        
      ),
      home: LoadingScreen(),
    );
  }
}
//flutter version - 1.2.1 stable