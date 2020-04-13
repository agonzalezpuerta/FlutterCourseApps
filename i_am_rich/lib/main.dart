import 'package:flutter/material.dart';

// Starting point of all Flutter apps.
void main() {
    runApp(
        MaterialApp(
            home: Scaffold(
                backgroundColor:
                    Colors.blueGrey[600],
                appBar: AppBar(
                    title: Text('I Am Rich'),
                    backgroundColor: Colors.blueGrey[900],
                ),
                body: Center(
                  child: Image(
                      image: AssetImage('images/diamond.png'),
                  ),
                ),
            ),
        ),
    );
}
