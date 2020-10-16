// main 入口文件
import 'package:flutter/material.dart';
import './login/login.dart';
import './login/loading.dart';
import './tabCenter/app.dart';

// 应用程序入口
void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,  //去除右上角的Debug标签
      title: '测试',
      // 自定义主题
      theme: mDefaultTheme,
      // 添加路由
      routes: <String, WidgetBuilder>{
        // "/app": (BuildContext context) => new App(),  //主页面
        "/login":(BuildContext context) => new Login(),  
        "/app":(BuildContext context) => new App(),  
      },
      // 首页
      home: App() //加载页面
    ));

// 自定义主题
final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
);
