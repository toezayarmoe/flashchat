import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screen/login_screen.dart';
import 'package:flash_chat/screen/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static var id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  child: Image.asset("images/logo.png"),
                  height: 60.0,
                ),
              ),
              AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    "Flash Chat",
                    textStyle: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    speed: const Duration(milliseconds: 100),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          RoundedButton(
            keyName: 'Login',
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            color: MaterialStateProperty.all(Colors.lightBlueAccent),
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
            keyName: "Register",
            onPressed: () {
              Navigator.pushNamed(context, RegistarationScreen.id);
            },
            color: MaterialStateProperty.all(
              const Color(0xFF448AFF),
            ),
          ),
        ],
      ),
    );
  }
}
