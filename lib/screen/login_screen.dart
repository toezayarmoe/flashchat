import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flash_chat/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static var id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 300,
                child: Image.asset("images/logo.png"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedTextField(
              text: "Enter Your Email",
              onchanged: (value) {
                email = value;
              },
              validator: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedTextField(
              obscureText: true,
              text: "Enter Your Password",
              onchanged: (value) {
                password = value;
              },
              validator: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              keyName: "Login",
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email!, password: password!);
                  if (userCredential.user != null) {
                    Navigator.pushReplacementNamed(context, ChatScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    showSpinner = false;
                  });
                  if (e.code == 'user-not-found') {
                    debugPrint('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    debugPrint('Wrong password provided for that user.');
                  } else {
                    debugPrint(e.code);
                  }
                }
              },
              color: MaterialStateProperty.all(Colors.lightBlue),
            ),
          ],
        ),
      ),
    );
  }
}
