import 'package:flutter/material.dart';

void main() => runApp(MonApp());


class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primaryColor: Color(0xFFFB415B)),
      home: LoginPage(),

    );
  }
}

//STATEFUL
class LoginPage extends StatefulWidget{
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        padding : EdgeInsets.only(top:30.0,right: 20.0,left: 20.0,bottom: 20.0),
        child: ListView(
          children: <Widget>[

         
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Image.asset('images/valkyrie3orange.png', width: 120.0,height: 120.0,),
        //Text('Logo',style: TextStyle(fontSize: 40.0),),
        SizedBox(height:30.0),
        Text('Login',style: TextStyle(fontSize: 32.0, color:Theme.of(context).primaryColor)),
        SizedBox(height:30.0),
        buildTextFieldMail(),
        SizedBox(height: 12.0,),
        buildTextFieldPass("Password"),
        SizedBox(height: 12.0,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Forgotten Password?", style: TextStyle(
                color: Theme.of(context).primaryColor,
              )
              )
            ],
          ),
          ),
        SizedBox(height: 12.0,),
        buildButtonContainer(),
      ],)

       ],
        )
    ,));
  }
  Widget buildTextFieldMail(){
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email, color: Colors.orange,),
        prefixText: ' ',
        labelText: 'Email',
        hintText: "Email",
        //helperText: "Please enter your mail",
        hintStyle: TextStyle(
          color:Colors.grey,
          fontSize:16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 3.0,
          )
        )
      ),
      );
  }
  Widget buildTextFieldPass(String hintText){
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Colors.green,),
        prefixText: ' ',
        suffixIcon: IconButton(
          onPressed: () {
            
          },
          icon : Icon(Icons.visibility_off)
          ),
        fillColor : Colors.blue,
        labelText: 'Password',
        hintText: hintText,
        //helperText: "Please enter your password",
        hintStyle: TextStyle(
          color:Colors.grey,
          fontSize:16.0,
        ),
        //enabledBorder: OutlineInputBorder(  //propriétés des bords
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 3.0,
          )
        )
      ),
    );
  }
  Widget buildButtonContainer(){
    return GestureDetector(//ajoute interaction au container
      onTap: (){print('login button pressed');},
        child : Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFB415B),
            Color(0xFFEE5623),
          ],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        ),
        ),
        child: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(fontSize:18.0, color: Colors.yellowAccent )
          )
        )
        )
        );
  }
}