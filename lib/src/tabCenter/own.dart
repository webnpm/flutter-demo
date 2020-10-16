import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OwnPage extends StatefulWidget {
  @override
  _OwnPageState createState() => _OwnPageState();
}

class _OwnPageState extends State<OwnPage> {

    BoxDecoration decorations =  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(220, 220, 220, 0.35),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
            ),
        ],
    );




    @override
    Widget build(BuildContext context) {
        ScreenUtil.init(context, designSize: Size(750, 1334));
        return Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                color: Color.fromRGBO(246, 246, 250, 1),
            ),
            child:SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                      children: [
                          Container(
                              height: 370.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/own_top_bg.png"),
                                      fit: BoxFit.fill
                                  ),
                              ),
                              child: Stack(
                                  children: [
                                      Positioned(
                                          left: 52.w,
                                          top: 49.w,
                                          child: Image(image: AssetImage("images/own_img.png"),width: 160.w,)
                                      ),
                                      Positioned(
                                          left: 52.w,
                                          top: 155.w,
                                          width:160.w,
                                          child:Align(
                                              alignment: Alignment.center,
                                              child: Text("哈哈",style: TextStyle(fontSize: 18.w),),
                                          )
                                      ),
                                      Positioned(
                                          left: 229.w,
                                          top: 69.w,
                                          child:Text("6月10日收入",style: TextStyle(fontSize: 30.w,color: Colors.white),)
                                      ),
                                      Positioned(
                                          left: 436.w,
                                          top: 75.w,
                                          child:Image(image: AssetImage("images/own_eye_open.png"),width: 42.w,)
                                      ),
                                      Positioned(
                                          left: 228.w,
                                          top: 116.w,
                                          child:RichText(
                                              text: TextSpan(
                                                  text: '10258.',
                                                  style: TextStyle(color: Colors.white,fontSize: 56.w),
                                                  children: <TextSpan>[
                                                      TextSpan(
                                                          text: '00',
                                                          style: TextStyle(color: Colors.white,fontSize: 44.w),
                                                      ),
                                                  ],
                                              ),
                                          )
                                      ),
                                      Positioned(
                                          top: 239.w,
                                          left: 0,
                                          width: 750.w,
                                          child: Padding(
                                              padding: EdgeInsets.only(left: 84.w,right: 84.w),
                                                  child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                      Column(
                                                          children: [
                                                              Text("本月收入",style: TextStyle(color: Colors.white,fontSize: 26.w),),
                                                              SizedBox(height: 5.w),
                                                              Text("258.00",style: TextStyle(color: Colors.white,fontSize: 30.w),),
                                                          ],
                                                      ),
                                                      Column(
                                                          children: [
                                                              Text("累计收入",style: TextStyle(color: Colors.white,fontSize: 26.w),),
                                                              SizedBox(height: 5.w),
                                                              Text("400.00",style: TextStyle(color: Colors.white,fontSize: 30.w),),
                                                          ],
                                                      )
                                                  ],
                                              ),
                                          )
                                      )
                                  ],
                              ),
                          ),
                          SizedBox(
                              height: 6.w,
                          ),
                          Align(
                              child: Container(
                                  padding: EdgeInsets.only(top: 50.w,bottom: 50.w),
                                  width: 690.w,
                                  decoration: decorations,
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                          Column(
                                              children: [
                                                  Image(image: AssetImage("images/own_icon_001.png"),width: 64.w,),
                                                  Text("在线商城",style: TextStyle(color: Color.fromRGBO(94, 102, 119, 1),fontSize: 24.w))
                                              ],
                                          ),
                                          Column(
                                              children: [
                                                  Image(image: AssetImage("images/own_icon_002.png"),width: 64.w,),
                                                  Text("我的团队",style: TextStyle(color: Color.fromRGBO(94, 102, 119, 1),fontSize: 24.w))
                                              ],
                                          ),
                                          Column(
                                              children: [
                                                  Image(image: AssetImage("images/own_icon_003.png"),width: 64.w,),
                                                  Text("分润详情",style: TextStyle(color: Color.fromRGBO(94, 102, 119, 1),fontSize: 24.w))
                                              ],
                                          ),
                                          Column(
                                              children: [
                                                  Image(image: AssetImage("images/own_icon_004.png"),width: 64.w,),
                                                  Text("我的钻石",style: TextStyle(color: Color.fromRGBO(94, 102, 119, 1),fontSize: 24.w))
                                              ],
                                          ),
                                      ],
                                  ),
                              ),
                          ),
                          SizedBox(height: 30.w,),
                          Container(
                              width: 690.w,
                              height: 110.w,
                              decoration: decorations,
                              child: Row(
                                  children: [
                                      SizedBox(width: 42.w,),
                                      Image(image: AssetImage("images/own_list_002.png"),width: 42.w,),
                                      SizedBox(width: 28.w,),
                                      Expanded(child: Text("我的银行卡",style: TextStyle(fontSize: 26.w,color: Color.fromRGBO(41, 43, 50, 1)),)),
                                      Icon(Icons.chevron_right,color: Color.fromRGBO(94, 102, 119, 0.6),),
                                      SizedBox(width: 12.w,),
                                  ],
                              ),
                          ),
                          SizedBox(height: 20.w,),
                          Container(
                              width: 690.w,
                              height: 110.w,
                              decoration: decorations,
                              child: Row(
                                  children: [
                                      SizedBox(width: 42.w,),
                                      Image(image: AssetImage("images/own_list_001.png"),width: 42.w,),
                                      SizedBox(width: 28.w,),
                                      Expanded(child: Text("密码管理",style: TextStyle(fontSize: 26.w,color: Color.fromRGBO(41, 43, 50, 1)),)),
                                      Icon(Icons.chevron_right,color: Color.fromRGBO(94, 102, 119, 0.6),),
                                      SizedBox(width: 12.w,),
                                  ],
                              ),
                          ),
                          SizedBox(height: 20.w,),
                          Container(
                              width: 690.w,
                              height: 110.w,
                              decoration: decorations,
                              child: Row(
                                  children: [
                                      SizedBox(width: 42.w,),
                                      Image(image: AssetImage("images/own_list_003.png"),width: 42.w,),
                                      SizedBox(width: 28.w,),
                                      Expanded(child: Text("我的邀请码",style: TextStyle(fontSize: 26.w,color: Color.fromRGBO(41, 43, 50, 1)),)),
                                  ],
                              ),
                          ),
                          SizedBox(height: 20.w,),
                          Container(
                              width: 690.w,
                              height: 110.w,
                              decoration: decorations,
                              child: Row(
                                  children: [
                                      SizedBox(width: 42.w,),
                                      Image(image: AssetImage("images/own_list_005.png"),width: 42.w,),
                                      SizedBox(width: 28.w,),
                                      Expanded(child: Text("负责人邀请码",style: TextStyle(fontSize: 26.w,color: Color.fromRGBO(41, 43, 50, 1)),)),
                                  ],
                              ),
                          ),
                          SizedBox(height: 20.w,),
                          Container(
                              width: 690.w,
                              height: 110.w,
                              decoration: decorations,
                              child: Align(
                                  child: Text("退出登录",style: TextStyle(fontSize: 30.w,color: Color.fromRGBO(253, 95, 94, 1)),),
                              )
                          )
                      ],
                  ),
                )
            ),
        );
    }
}