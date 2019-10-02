import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(MonApp());

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
    Widget textSection = Container( 
      padding: EdgeInsets.all(32),
      child: Text(
        
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
        ),
      );

    return MaterialApp(
      title: "Exercice Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("building layout ex:"),
          ),
        body: ListView(
          children:[
            
            Image.asset('images/KNK.jpg',width: 600, height: 240,fit: BoxFit.cover),//Step5
            titleSection(),
            buttonSection,
            textSection, 
          ], 
          ),
        ),
    );
  }

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
        FavoriteWidget(),
        
      ],
      )
  );

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

class FavoriteWidget extends StatefulWidget {

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState(); 
  //retourne une instance de _FavoriteWidgetState

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){ //fct toggle 
    setState((){
      if (_isFavorited){
        _favoriteCount--;
        _isFavorited = false;

      }
      else {
        _favoriteCount++;
        _isFavorited= true;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red,
            onPressed: _toggleFavorite,
          ),
          ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
