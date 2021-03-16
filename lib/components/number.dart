import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumberButton extends StatelessWidget {
  String text = '';
  final Function onPress;
  final double size;

  NumberButton(
    String text, {
    this.onPress,
    this.size = 70,
  }) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onPress(this.text),
      borderRadius: BorderRadius.all(
        Radius.circular(
          50,
        ),
      ),
      child: Container(
        width: this.size,
        height: this.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
