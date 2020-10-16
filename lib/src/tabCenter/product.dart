import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
    @override
    Widget build(BuildContext context) {
        return Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.green,
            ),
            child:Text("进件管理",style: TextStyle(color: Colors.white),),
        );
    }
}