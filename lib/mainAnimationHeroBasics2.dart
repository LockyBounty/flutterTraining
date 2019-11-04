import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';

import 'dart:math';

//void main() => runApp(BasicHeroAnimation());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0.0, end: 2.0 * pi).animate(controller);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
            angle: animation.value,
            child: Center(
              child: Container(
                child: FlutterLogo(size: 300.0),
              ),
            ));
      },
    );
  }
}

class BasicHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Route2()),
            );
          },
          child: Center(
            child: Hero(
              tag: 'flippers',
              child: Image.network(
                'http://giphygifs.s3.amazonaws.com/media/L5f4Z5JoOKARG/giphy.gif',
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}

class Route2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Route2'),
        ),
        body: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BasicHeroAnimation()),
              );
            },
            child: Hero(
              tag: 'flippers',
              child: SizedBox(
                width: 100.0,
                child: Image.network(
                  'http://giphygifs.s3.amazonaws.com/media/L5f4Z5JoOKARG/giphy.gif',
                ),
              ),
            )));
  }
}

void main() {
  runApp(MaterialApp(home: BasicHeroAnimation()));
}
