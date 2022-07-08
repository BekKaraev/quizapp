import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    this.color,
    this.onPressed,
  });
  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
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
