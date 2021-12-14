import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.text,
    this.onchanged,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);
  final String text;
  final void Function(String)? onchanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: onchanged,
        validator: validator,
        decoration: InputDecoration(
          labelText: text,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(),
          ),
          //fillColor: Colors.green
        ),
      ),
    );
  }
}
