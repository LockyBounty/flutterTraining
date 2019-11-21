import 'package:flutter/material.dart';

import 'main.dart';


class HomePage extends StatelessWidget{
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final testguest = Hero(
      tag: "hero",
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          child: Image.asset('images/valkyrie3orange.png'),
        )
      ),
    );

    final welcome = Padding(
      padding : EdgeInsets.all(8.0),
      child: Text('Welcome You!',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
     );

    final lorem = Padding(
      padding : EdgeInsets.all(8.0),
      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
     );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ]
        )
      ),
      child: Column(
        children: <Widget>[
          testguest, welcome, lorem
        ],
      )
    
    );

    return Scaffold(body:body);
}
}