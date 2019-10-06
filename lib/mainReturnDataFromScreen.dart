import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Return data',
  routes: {
    '/': (context)=>HomeScreen(),
  }
));

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Return data from a screen')),
        body: Center(
          child: SelectionButton()
            ),
      );
  }
}

class SelectionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Pick an option'),
      onPressed: (){
        _navigateAndDisplaySelection(context);
      },
    );
  }
   // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=>SelectionScreen()),
      );

      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: (){
                  // The Yep button returns "Yep!" as the result.
                  Navigator.pop(context, 'Yep, taxi!');
                },
                child: Text('Yep!'),
              )
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope!'),
              )
            ),
          ],
          )
        ,)
    );
  }
}