import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation flashAnimation;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );
    flashAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    colorAnimation = ColorTween(begin: Colors.yellow[200], end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorAnimation.value,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: Container(
                            child: Image.asset('images/logo.png'),
                            height: flashAnimation.value * 100,
                          ),
                        ),
                      ),
                      TypewriterAnimatedTextKit(
                        text: ['Flash Chat'],
                        isRepeatingAnimation: false,
                        duration: Duration(seconds: 1),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  RoundedButton(
                      color: Colors.lightBlueAccent,
                      pressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      text: 'Log In'),
                  RoundedButton(
                      color: Colors.lightBlue,
                      pressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      text: 'Register')
                ])));
  }
}