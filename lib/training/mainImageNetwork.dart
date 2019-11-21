import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(MonApp());

 const defaultImage = Image(
    image: NetworkImage(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),);
  

class MonApp extends StatelessWidget{

 @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: defaultImage,
        //OR
        //child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
    )
    );
  }
}