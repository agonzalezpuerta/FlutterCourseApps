// Project level imports
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/action_button.dart';
import 'package:flash_chat/widgets/auth_service.dart';
import 'package:flash_chat/widgets/firebase_error_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password;
  String passwordErrorText;
  String email;
  String emailErrorText;

  bool _modalProgressHudEnable = false;

  // final _auth = FirebaseAuth.instance;
  final myAuthClass = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _modalProgressHudEnable,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration: kInputTextDecoration.copyWith(
                      hintText: 'Enter your email.',
                      errorText: emailErrorText,
                    )),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kInputTextDecoration.copyWith(
                      hintText: 'Enter your password.',
                      errorText: passwordErrorText,
                    )),
                SizedBox(
                  height: 24.0,
                ),
                ActionButton(
                  buttonText: 'Log In',
                  buttonColor: Colors.lightBlueAccent,
                  buttonFunction: () async {
                    _modalProgressHudEnable = true;

                    setState(() {});

                    // Register using custom authentication service
                    final loginResult =
                        await myAuthClass.loginUser(email, password);

                    emailErrorText = null;
                    passwordErrorText = null;

                    if (loginResult is FirebaseErrorType) {
                      if (loginResult is FirebaseEmailError) {
                        // If auth returns email error code, highlight email box
                        _modalProgressHudEnable = false;

                        emailErrorText = loginResult.errorMessage;
                        print(loginResult.errorMessage);
                      } else if (loginResult is FirebasePasswordError) {
                        // If auth returns password error code, highlight password box
                        _modalProgressHudEnable = false;

                        passwordErrorText = loginResult.errorMessage;
                      } else if (loginResult is FirebaseOtherError) {
                        // If auth returns un-classed error code, highlight password box
                        _modalProgressHudEnable = false;

                        passwordErrorText = loginResult.errorMessage;
                      }
                    } else {
                      _modalProgressHudEnable = false;

                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    // Set state to redraw error boxes
                    setState(
                      () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
