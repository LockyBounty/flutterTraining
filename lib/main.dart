import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=> Route1(),
    '/second': (context)=> Route2(),
  },
));

class Route1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Here: Route 1')),
      body: Center(
        child: FlatButton(
          color: Colors.green,
          child: Text('To Route 2'),
          onPressed: (){
            Navigator.pushNamed(
              context, '/second');
              }
             )
            )
        );
  }
}

class Route2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here: Route 2')
      ),
      body: Center(child: RaisedButton(
        child: Text('Back to Route 1!'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),)
    );
  }
}