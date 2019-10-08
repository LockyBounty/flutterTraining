import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MonApp());

class MonApp extends StatefulWidget{
  _MonAppState createState()=> _MonAppState();
}

class _MonAppState extends State<MonApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),vsync: this);
    animation= Tween<double>(begin: 0,end:300).animate(controller)
      ..addListener((){
        setState(() {
          
        });
      }); 
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Container(
        color: Colors.black,
        width: animation.value,
        height: animation.value,
        child:FlutterLogo()   
    ,)
    ,);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}

