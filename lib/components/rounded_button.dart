import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.keyName,
    required this.color,
    required this.onPressed,
  }) : super(key: key);
  final String keyName;
  final void Function()? onPressed;

  final MaterialStateProperty<Color> color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: color,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: Text(keyName, style: const TextStyle(fontSize: 15)),
        onPressed: onPressed,
      ),
    );
  }
}
