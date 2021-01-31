import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/action_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
      upperBound: 1.0,
    );

    animation = ColorTween(
      begin: Colors.grey,
      end: Colors.white,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      // print(controller.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 500),
                  textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ActionButton(
              buttonText: 'Log In',
              buttonColor: Colors.lightBlueAccent,
              buttonFunction: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ActionButton(
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              buttonFunction: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
