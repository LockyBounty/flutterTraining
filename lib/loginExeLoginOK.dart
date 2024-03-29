import 'package:developtest/homepage.dart';
import 'package:flutter/material.dart';
import '';



class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

@override
Widget build(BuildContext context) {

  final logo = Hero(
    tag: "hero",
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('images/valkyrie3orange.png'),
    ),
    );
  final email = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    //initialValue: 'example@mail.com',
    decoration: InputDecoration(
      hintText: 'Email',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)
      )
    ),
  );
  final password = TextFormField(
    obscureText: true,
    autofocus: false,
    
    decoration: InputDecoration(
      hintText: 'Password',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)
      )
    ),
  );
  final loginButton = Padding(
    padding: EdgeInsets.symmetric(
      vertical: 16.0
    ),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: (){
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        color: Colors.lightBlueAccent,
        child: Text('Login', style: TextStyle(color: Colors.red),)
        )    
    ,)
  );
  final forgotLabel = FlatButton(
    child: Text('Forgot password?', style: TextStyle(color: Colors.blue)),
    onPressed: () {

    },
  );


  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left:24.0, right:24.0),
        children: <Widget>[
          SizedBox(height:18.0),
          logo,
          SizedBox(height:48.0),
          email,
          SizedBox(height:8.0),
          password,
          SizedBox(height:28.0),
          loginButton,
          forgotLabel,
        ],
      ),)
  );
}


}