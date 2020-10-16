import 'package:flutter/material.dart';

// 应用页面使用有状态Widget
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}
class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Center(
        child: new Text(
          '主页面',
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.red[500],
            fontSize: 24.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
/// 主页面