import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/',
              );
            },
            child: Text('Go to Screen 0')),
      ),
    );
  }
}
