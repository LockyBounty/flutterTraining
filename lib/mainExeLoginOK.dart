import 'package:flutter/material.dart';
import 'login.dart';
import 'homepage.dart';

void main() => runApp(MonApp());

class MonApp extends StatelessWidget{

  final routes = <String, WidgetBuilder>{
    LoginPage.tag : (context)=> LoginPage(),
    HomePage.tag : (context)=> HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log me please',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Raleway',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}