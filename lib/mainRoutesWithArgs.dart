import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(MaterialApp(
  onGenerateRoute: (settings){
    if (settings.name == PassArgumentsScreen.routeName){
      final ScreenArguments args = settings.arguments;
      return MaterialPageRoute(
        builder: (context)=> PassArgumentsScreen(
          title: args.title,
          message: args.message,
        )
      );
    }
  },
  home: Route1(),
  title: 'Navigation with Arguments',
  // initialRoute: '/',
  // routes: {
  //   // '/': (context)=> Route1(),
  //   // '/second': (context)=> Route2(),
  //   ExtractArgumentsScreen.routeName: (context)=> ExtractArgumentsScreen(),
  // },
));

class Route1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Here: Route 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RaisedButton(
            color: Colors.green,
            child: Text('To screen that extracts arguments'),
            onPressed: (){
             Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> ExtractArgumentsScreen(),
                settings: RouteSettings(
                  arguments: ScreenArguments(
                    "Extract arguments", 
                    "this is extracted from the build method")
                )
              )
             );}
          ),
          RaisedButton(
            color: Colors.green,
            child: Text('To screen that extracts arguments'),
            onPressed: (){
             Navigator.pushNamed(
              context, 
              PassArgumentsScreen.routeName,             
              arguments: ScreenArguments(
                'Accept arguments Screen',
                'This message is extracted in the OngenerateRoute function.',
                )
                );}
              )
        ]
             )
      )
    );
  }
}     

class Route2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here: Route 2')
      ),
      body: Center(child: RaisedButton(
        child: Text('Back to Route 1!'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),)
    );
  }
}

class ScreenArguments{
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ExtractArgumentsScreen extends StatelessWidget{
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message),)
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {

  static const routeName= '/passArguments';
  final String title;
  final String message;
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(message))
    );
  }
}