import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //在加载页面停顿3秒
    Future.delayed(Duration(seconds: 3), () {
      print("Flutter即时通讯APP界面实现...");
      Navigator.of(context).pushReplacementNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334));

    return Center(
        child: Container(
      width: 750.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
        //   Row(
        //     children: List<Widget>.generate(3, (index) {
        //         return Container(
        //             child: Text("1233"),
        //         );
        //     }),
        //   ),
          SizedBox(height: 271.h),
          Image.asset(
            "images/login_logo.png",
            width: 254.w,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 105.h),
          Text(
            "智慧汽车金融",
            style: TextStyle(
                fontSize: 52.sp,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 44.h),
          Text(
            "诚信·智能·高效",
            style: TextStyle(
                fontSize: 36.sp,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w200),
          ),
        ],
      ),
    ));
  }
}
