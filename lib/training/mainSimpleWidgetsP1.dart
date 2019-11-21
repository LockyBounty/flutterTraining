import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {

//debugPaintSizeEnabled = true; // Remove to suppress visual layout
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
//--------------------> Simple widget avec material
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Bannière',
      
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("Bannière")),
  //       body: Center(child: Text('Hola Trump!'),),
  //       ),
    
  //   );
  // }


//---------------------> Simple Widget sans material
//  Widget build(BuildContext context) {
    
//     return Container(
//       decoration: BoxDecoration(color: Colors.green),
//       child: Center(
//         child: Text('Halo',
//         textDirection: TextDirection.ltr,
//         style: TextStyle(
          
//           fontSize: 32,
//           color: Colors.white,
//         )),
//         )
//      ,);
//   }

 // Row and Column exercices 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lol',
      home: Scaffold(
        appBar: AppBar(title: Text('lolilol')),
        body: Center(
          child: buildRowStars(),
          
          )
        
      )    
    
    ,);
  }

//Attention a bien autoriser les images en question dans pubspec.yaml
   Widget buildRow() =>

   Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Image.asset('images/pic1.jpg'),
    ),
    Expanded(
      flex: 2,
      child: Image.asset('images/pic2.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic3.jpg'),
    ),
  ],
);

      Widget buildColumn() =>
      // #docregion Column
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/pi1.jpg'),
          Image.asset('images/pi2.jpg'),
          Image.asset('images/pi3.jpg'),
        ],
      );

  Widget buildRowStars()=>
    Row(mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.pink),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.black),
      Icon(Icons.star, color: Colors.black),
    ]
    ,);


  


}