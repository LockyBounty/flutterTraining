import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

void main() => runApp(MaterialApp(home: HeroAnimation()));

class PhotoHero extends StatelessWidget{
  const PhotoHero({Key key, this.photo, this.onTap, this.width}): super(key:key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo, 
        child: Material(color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Image.asset(photo, fit: BoxFit.contain,)
          )
          ,)
      )
    );
  }
}

class HeroAnimation extends StatelessWidget {
  
  Widget build(BuildContext context) {
    //timeDilation = 5.0;

    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation')),
      body: Center(
        child:PhotoHero(
          photo: 'images/KNK.jpg',
          width: 300,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context){
                return Scaffold(
                  appBar: AppBar(title: Text('Second Page')),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: PhotoHero(
                      photo: 'images/KNK.jpg',
                      width: 100,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    )
                    )
                );
              }
            ));
          },
        )
      )
    );
  }
}

class Photo extends StatelessWidget {
  Photo({ Key key, this.photo, this.color, this.onTap }) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
            photo,
            fit: BoxFit.contain,
          )
      ),
    );
  }
}
class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
       super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,  // Photo
          ),
        ),
      ),
    );
  }
}