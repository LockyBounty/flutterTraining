import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MonApp());

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation}):
   super(key: key, listenable: animation);

  
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(child: Container(child: 
    FlutterLogo(),
    margin: EdgeInsets.symmetric(vertical: 10),
    width: animation.value,
    height: animation.value
    ,),);
  }
}

class LogoWidget extends StatelessWidget{
  Widget build(BuildContext context)=> Container(margin: EdgeInsets.symmetric(vertical: 10),child:FlutterLogo());
}
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
      duration: Duration(seconds: 1),vsync: this);

    animation= Tween<double>(begin: 80,end:100).animate(controller);
    //pour boucler l'animation
    // ..addStatusListener((status){
    //   if (status == AnimationStatus.completed){
    //     controller.reverse();
    //   }else if (status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // })
    // ..addStatusListener((state)=>print('$state'));
    controller.forward();
  }


  @override
  //Widget build(BuildContext context) => AnimatedLogo(animation:animation);
  Widget build(BuildContext context) => GrowTransition(
    child:LogoWidget(),
    animation: animation,
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    
  }

}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(child: AnimatedBuilder(
    animation: animation,
    builder: (context,child)=>Container(height: animation.value,
    width: animation.value,
    child:child,),
    child:child,
  )
  );
}