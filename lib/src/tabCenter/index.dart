import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class ModuleList {
    final String imageUrl;
    final String text;

    ModuleList(this.imageUrl,this.text);
}

class IndexPage extends StatefulWidget {
    @override
    _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

    final List<String> _imgUrl = [
        "http://upload.goodideabank.com/202003/158435466643789924.png",
        "http://upload.goodideabank.com/157380946176713514.png",
        "http://upload.goodideabank.com/157380944918958898.png",
        "http://upload.goodideabank.com/157380947816385254.png"
    ];


    @override
    Widget build(BuildContext context) {
        ScreenUtil.init(context, designSize: Size(750, 1334));
        return Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.png"),
                    fit: BoxFit.fill
                )
            ),
            child:SingleChildScrollView(
              child: SafeArea(
                child: Column(
                      children: <Widget>[
                          SizedBox(
                              height: 20.w,
                          ),
                          Align(
                              alignment:Alignment.center,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Image.asset("images/qy_logo.png",width: 63.w,),
                                      Text("众银汽车金融",style: TextStyle(fontSize: 36.w,color: Colors.white),)
                                  ],
                              ),
                          ),
                          SizedBox(
                              height: 40.w,
                          ),
                          Container(
                              height: 300.w,
                              child: Swiper(
                                  itemBuilder: (BuildContext context, int index) {
                                      return Image.network(
                                          _imgUrl[index],
                                          fit: BoxFit.fill,
                                      );
                                  },
                                  itemCount: _imgUrl.length,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  pagination: SwiperPagination(
                                      margin: EdgeInsets.only(bottom: 10.w),
                                      builder: DotSwiperPaginationBuilder(
                                          color: Colors.grey, activeColor: Colors.white
                                      )
                                  ),
                                  //上一页 下一页按钮
                                  // control: new SwiperControl(
                                  //     color: Colors.red,
                                  // ),
                              ),
                          ),
                          SizedBox(
                              height: 50.w,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  Column(
                                      children: [
                                          Image(
                                              image:AssetImage("images/module_icon1.png"),
                                              width: 88.w,
                                          ),
                                          SizedBox(
                                              height: 20.w,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text("万能宝典",style: TextStyle(color: Colors.white,fontSize: 22.w),),
                                          )
                                      ],
                                  ),
                                  Column(
                                      children: [
                                          Image(
                                              image:AssetImage("images/module_icon2.png"),
                                              width: 88.w,
                                          ),
                                          SizedBox(
                                              height: 20.w,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text("进件产品",style: TextStyle(color: Colors.white,fontSize: 22.w),),
                                          )
                                      ],
                                  ),
                                  Column(
                                      children: [
                                          Image(
                                              image:AssetImage("images/module_icon3.png"),
                                              width: 88.w,
                                          ),
                                          SizedBox(
                                              height: 20.w,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text("代收服务",style: TextStyle(color: Colors.white,fontSize: 22.w),),
                                          )
                                      ],
                                  ),
                                  Column(
                                      children: [
                                          Image(
                                              image:AssetImage("images/module_icon4.png"),
                                              width: 88.w,
                                          ),
                                          SizedBox(
                                              height: 20.w,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text("我的待办",style: TextStyle(color: Colors.white,fontSize: 22.w),),
                                          )
                                      ],
                                  )
                              ],
                          ),
                          SizedBox(
                              height: 50.w,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 30.w,right: 30.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                  children: [
                                      SizedBox(
                                          height: 24.w,
                                      ),
                                      Row(
                                          children: [
                                                Container(
                                                    margin: EdgeInsets.only(left: 30.w,right: 10.w),
                                                    width: 8.w,
                                                    height: 30.w,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO( 255, 105, 15, 1)
                                                    ),
                                                ),
                                                Text("业绩速递",style: TextStyle(fontSize: 28.w,fontWeight: FontWeight.w500),),
                                              
                                          ],
                                      ),
                                      SizedBox(
                                          height: 24.w,
                                      ),
                                      // Divider(height:1.0,indent:0.0,color: Color.fromRGBO(234, 234, 234, 1),),
                                      Table(
                                          border: TableBorder.all(
                                              color: Color.fromRGBO(234, 234, 234, 1),
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                          ),
                                          children: [
                                              TableRow(
                                                  children: [
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      ),
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      ),
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      )
                                                  ]
                                              ), 
                                              TableRow(
                                                  children: [
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      ),
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      ),
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      )
                                                  ]
                                              ), 
                                              TableRow(
                                                  children: [
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      ),
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      ),
                                                      Container(
                                                          width: 230.w,
                                                          height: 230.w,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text("今日通过/申请"),
                                                          ),
                                                      )
                                                  ]
                                              ),  
                                          ],
                                      )
                                  ],
                              ),
                          ),
                          SizedBox(
                              height: 50.w,
                          ),
                        ],
                ),
              ),
            )
        );
    }
}