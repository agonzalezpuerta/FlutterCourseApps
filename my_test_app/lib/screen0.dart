import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 0'),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/first',
              );
            },
            child: Text('Go to Screen 1')),
      ),
    );
  }
}
