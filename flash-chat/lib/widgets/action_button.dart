import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Function buttonFunction;

  ActionButton({
    this.buttonText = "Sample Text",
    this.buttonColor = Colors.lightBlueAccent,
    @required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: buttonFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
