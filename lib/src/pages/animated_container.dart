import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  AnimatedContainerPage_State createState() => AnimatedContainerPage_State();
}

class AnimatedContainerPage_State extends State<AnimatedContainerPage> {
  double _with = 50.0;
  double _height = 50.0;
  Color _color = Colors.lightBlue;
  BorderRadiusGeometry _borderRaius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _with,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRaius, color: _color),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutQuad,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cargarForma,
      ),
    );
  }

  void _cargarForma() {
    final random = Random();

    setState(() {
      _height = random.nextInt(300).toDouble();
      _with = random.nextInt(300).toDouble();
      _borderRaius=BorderRadius.circular(random.nextInt(100).toDouble());
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }
}
