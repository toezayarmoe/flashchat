import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flash_chat/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistarationScreen extends StatefulWidget {
  const RegistarationScreen({Key? key}) : super(key: key);
  static String id = "registeration_screen";

  @override
  _RegistarationScreenState createState() => _RegistarationScreenState();
}

class _RegistarationScreenState extends State<RegistarationScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;
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
              text: "Enter Your Password",
              obscureText: true,
              onchanged: (value) {
                password = value;
              },
              validator: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              keyName: "Register",
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  await _auth.createUserWithEmailAndPassword(
                      email: email!, password: password!);
                  Navigator.pushReplacementNamed(context, ChatScreen.id);
                } catch (e) {
                  setState(() {
                    showSpinner = false;
                  });
                  debugPrint(e.toString());
                }
              },
              color: MaterialStateProperty.all(
                const Color(0xFF448AFF),
              ),
            )
          ],
        ),
      ),
    );
  }
}
