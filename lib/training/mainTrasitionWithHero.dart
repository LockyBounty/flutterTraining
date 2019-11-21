import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "Widget Animation Screens",
  routes:{
    '/': (context) => MonApp()
  }
));

class MonApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation transition")),
      body: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_)=> Destination())
             );
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
          'https://picsum.photos/250?image=9'
        )
        )
      ),
    );
  }
}

class Destination extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('details')
      ),
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child:Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
          'https://picsum.photos/250?image=9'
          ) 
          ,)
        )
      )
    );
  }
}