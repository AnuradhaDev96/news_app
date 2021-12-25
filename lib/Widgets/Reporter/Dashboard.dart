import 'package:flutter/material.dart';
import 'package:news_app/Widgets/Bloc/counter_page.dart';
import 'package:news_app/Widgets/Bloc/weather_page.dart';
import 'AddNews.dart';
import 'CreatedNews.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final mainTitle = Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Text(
                "Admin Console",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );

    final subTitle = Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Text(
                "Manage your news here",
                style: new TextStyle(color: Colors.white, fontSize: 18.0),
              ))
        ],
      ),
    );

    final newsListButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 80.0,
      child: new OutlineButton(
        highlightColor: Colors.purple[400],
        highlightedBorderColor: Colors.white,
        borderSide:
            BorderSide(style: BorderStyle.solid, color: Colors.purple[400]),
        child: Text(
          "News List",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatedNews()),
          );
        },
      ),
    );

    final thirdButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 80.0,
      child: new OutlineButton(
        highlightColor: Colors.purple[400],
        highlightedBorderColor: Colors.white,
        borderSide:
            BorderSide(style: BorderStyle.solid, color: Colors.purple[400]),
        child: Text(
          "Counter Page",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WeatherPage()),
          );
        },
      ),
    );

    final postNewsButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 80.0,
      child: new OutlineButton(
        highlightColor: Colors.purple[400],
        highlightedBorderColor: Colors.white,
        borderSide:
            BorderSide(style: BorderStyle.solid, color: Colors.purple[400]),
        child: Text(
          "Post News",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNews()),
          );
        },
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            //image: new NetworkImage("https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-mobile-app-app-advertising-background-image_162392.jpg"),
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 5.0),
                mainTitle,
                SizedBox(height: 10.0),
                subTitle,
                SizedBox(
                  height: 30.0,
                ),
                postNewsButton,
                SizedBox(
                  height: 10.0,
                ),
                newsListButton,
                SizedBox(
                  height: 10.0,
                ),
                thirdButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
