import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Named Routes Exe',
  routes: {
    '/': (context)=> Route1(),
    '/second': (context)=> Route2(),
  }
));

class Route1 extends StatelessWidget{
  
  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(title: Text("You are on route 1")),
    body: Center(
      child: RaisedButton(
        child: Text('go route 2'),
        color: Colors.red,
        onPressed: (){
          Navigator.pushNamed(context, '/second');
        }
      ),)
  );
}
class Route2 extends StatelessWidget{
  
  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(title: Text("You are on route 2")),
    body: Center(
      child: RaisedButton(
        child: Text('go back'),
        color: Colors.green,
        onPressed: (){
          Navigator.pop(context);
        }
      ),)
  );
}