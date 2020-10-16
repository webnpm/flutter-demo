import 'package:flutter/material.dart';

import 'index.dart';
import 'product.dart';
import 'find.dart';
import 'own.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
    final List<BottomNavigationBarItem> bottomNavItems = [
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            title: Text("首页"),
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.message),
            title: Text("进件管理"),
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.shopping_cart),
            title: Text("探索发现"),
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.person),
            title: Text("我的"),
        ),
    ];

    int currentIndex;

    final pages = [IndexPage(), ProductPage(), FindPage(), OwnPage()];




    /*切换页面*/
    void _changePage(int index) {
        /*如果点击的导航项不是当前项  切换 */
        if (index != currentIndex) {
            setState(() {
                currentIndex = index;
            });
        }
    }

    @override
    void initState() {
        super.initState();
        currentIndex = 0;
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/login");
                },
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: bottomNavItems,
                currentIndex: currentIndex,
                type: BottomNavigationBarType.shifting,
                selectedFontSize:12,
                // fixedColor:Colors.white,
                onTap: (index) {
                    _changePage(index);
                },
            ),
            body: pages[currentIndex],
        );
    }
}