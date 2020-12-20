import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/ButtonsForLoginRegister.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

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
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                // Text(
                //   'Let\'s Chat',
                //   style: TextStyle(fontSize: 30.0, color: Colors.black),
                // ),
                SizedBox(
                  width: 250.0,
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 500),
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Let's CHAT!",
                    ],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonsForLoginRegister(
              buttonColor: Colors.lightBlueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'Login',
            ),
            ButtonsForLoginRegister(
              buttonColor: Colors.blueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
