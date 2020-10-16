import 'package:flutter/material.dart';


class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
    @override
    Widget build(BuildContext context) {
        return Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber,
            ),
            child:Text("发现",style: TextStyle(color: Colors.white),),
        );
    }
}