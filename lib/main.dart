import 'package:flutter/material.dart';

void main() => runApp(MonApp());

//------> Step 0 base code + modif au fil de l'exe
class MonApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ]
        ,)
    ,);  

    return MaterialApp(
      title: "Exercice Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("building layout ex:"),
          ),
        body: Column(
          children:[
            titleSection(),
            buttonSection,
            
          ], 
          ),
        ),
    );
  

  }

  //----> Step 1-2 title Row
  Widget titleSection() => Container(
    padding: EdgeInsets.all(32),
    child: Row(
      children:[ 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Lake Campground',
                  style: TextStyle( fontWeight: FontWeight.bold)),
                
                ),
              Text('Kantersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500])),
            ]
          ),
        ), 
        Icon(Icons.star,color: Colors.red),
        Padding(
          padding: EdgeInsets.all(4),
          child: Text('41' ),
        )
      ],
      )
  );

  //--------> Step 3 button Row
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label, 
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            )
          ),)
      ]
    );
  }


}