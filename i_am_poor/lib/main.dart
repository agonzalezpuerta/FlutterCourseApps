import 'package:flutter/material.dart';

// This is the main Flutter application
void main() {
  runApp( MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('I Am Poor')),
          backgroundColor: Colors.black87,
        ),

        body: Center(
          child: Image(
            image: AssetImage('image/money.png'),
          ),
        ),
      )
  )
  );
}
