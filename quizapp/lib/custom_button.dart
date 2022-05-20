
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  // ignore: use_key_in_widget_constructors
  const CustomButton({
    this.text,
    this.tus,
    this.onPressed,
  });
  final String text;
  final Color tus;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: tus),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 150.0,
            vertical: 20.0,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
