import 'package:flutter/material.dart';

void main() => runApp(MonApp());

class MonApp extends StatelessWidget{
 

  //--------------->Stack Exercice
  Widget _buildStack1() => Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('images/pic.jpg'),
        radius: 50,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.green,
          
        ),
        child: Text('Ana Belle',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))
        ,),
      

      
    ]
  
  ,);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Oh my geez!',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Stack/Card Exercice:'),
            ),
          body: Center(
            child: _buildCard(),),
          backgroundColor: Colors.green
          ,
          ),
        );
  }

//----------------> Card Exercice

  Widget _buildCard() => SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          Container(
            
            decoration: BoxDecoration(
              // border: Border(
              //   bottom: BorderSide(
              //     color: Colors.white24,
              //     width: 5.0
              //     )
              // ),
              
              borderRadius: BorderRadius.only(
                
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              color: Colors.red,
            ),
            child: ListTile(
              title: Text('1234 Main Street',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
              subtitle: Text('Bruxelles, BXL 1000'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.white,
              ) 
              ,),
            ),
          
          ListTile(
            title: Text('koko@yopmail.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.pink,
            )
            )
        ],)
        ,)
  ,);

}
