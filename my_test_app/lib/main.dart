import 'package:flutter/material.dart';
import 'screen0.dart';
import 'screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Screen0();
        },
        '/first': (context) {
          return Screen1();
        },
      },
    );
  }
}
