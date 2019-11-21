import 'package:flutter/material.dart';
//import 'login.dart' as logme1;
import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection, where;
import 'dart:async';


Future<void> main() async {
  final Map<String, double> _map={"a":1.0};
  final db = Db("mongodb://172.20.0.1:27017/test");
  await db.open();

  var coll = db.collection('test');
  await coll
  .find(where.eq("age",18))//.fields(['name']))
  .forEach((v)=> _map[v["name"]]=v["age"]);//print('${v["name"]} ${ v["age"].toString()}'));//print(v["name"]));
 var _list = _map.values.toList(); //chopper la valeur age /ou keys(unique) 
 print(_list);
 //for (var key in _map.keys){print(key);}//alternative
 return runApp(MonApp());
} 

class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFFB415B)),
      home: LoginPage(),
    );
  }
}

//STATEFUL
class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //dynamic loli= logme1.DBConnection();

  bool _isHidden = true;
  
  var _logoVisibility = Icon(Icons.visibility_off, color: Colors.grey);

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;

      if (_isHidden) {
        _logoVisibility = Icon(Icons.visibility_off, color: Colors.grey);
      } else {
        _logoVisibility = Icon(Icons.visibility, color: Colors.grey);
      }
    });
  }

  dynamic getdata() {
    //  Db db = Db("mongodb://172.20.0.1:27017/test");
    //  await db.open();
    //  DbCollection coll = db.collection("test");
    //  dynamic printer(){ coll.findOne(where.eq("age",18));}
    return "connexion ok";//printer();

}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView(
        //vaut mieux faire le padding/margin global dans le listview 
        //autrement on aurait un mauvais rendu
        padding: EdgeInsets.only(top: 16, right: 20.0, left: 20.0, bottom: 10.0),
      
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/valkyrie3orange.png',
                width: 120.0,
                height: 120.0,
              ),
              //Text('Logo',style: TextStyle(fontSize: 40.0),),
              SizedBox(height: 30.0),
              Text('Login',
                  style: TextStyle(
                      fontSize: 32.0, color: Theme.of(context).primaryColor)),
              SizedBox(height: 30.0),
              buildTextFieldMail(),
              SizedBox(
                height: 12.0,
              ),
              buildTextFieldPass("Password"),
              SizedBox(
                height: 12.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Forgotten Password?",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              buildButtonContainer(),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Don't you have an account?"),
                  InkWell(
                      child: Center(
                          child: Container(
                              //decoration: BoxDecoration(color: Colors.red),
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ))),
                      onTap: () => print(getdata()//"click on Sign up")),
                      )
                  )
                ],
              )),
              
            ],
          )
        ],
      ),
    ));
  }

  Widget buildTextFieldMail() {
    return Container(
        //padding: EdgeInsets.all(20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          autocorrect: true,
          //validator: validateEmail,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.orange,
              ),
              prefixText: ' ',
              labelText: 'Email',
              hintText: "Email",
              //helperText: "Please enter your mail",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.orangeAccent,
                    width: 3.0,
                  ))),
        ));
  }

  Widget buildTextFieldPass(String hintText) {
    return TextField(
      obscureText: _isHidden, //cache le pass entré par l'user
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.green,
          ),
          prefixText: ' ',
          suffixIcon: IconButton(
            onPressed: _toggleVisibility,
            icon: _logoVisibility,
          ),
          fillColor: Colors.blue,
          labelText: 'Password',
          hintText: hintText,
          //helperText: "Please enter your password",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          //enabledBorder: OutlineInputBorder(  //propriétés des bords
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.orangeAccent,
                width: 3.0,
              ))),
    );
  }

  Widget buildButtonContainer() {
    
    return GestureDetector(
        //ajoute interaction au container
        onTap: () {
          //loli.getConnection();

          print("lol");//'${logme1.find({age:18})}');
        },
        child: Container(
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
                child: Text("LOGIN",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                        fontSize: 18.0, color: Colors.yellowAccent)))));
  }

  
}
