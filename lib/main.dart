import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Layout demo',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Flutter layout'),
  //       ),
  //       body: Center(
  //         child: Text(
  //         'Hello ass!'
  //       ),
  //       )
  //     )

  //   );
  // }
 Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Center(
        child: Text('Halo',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          
          fontSize: 32,
          color: Colors.white,
        )),
        )
     ,);
  }
}