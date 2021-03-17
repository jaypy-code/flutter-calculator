import 'package:calc/components/button.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Function onPress;
  final Brightness brightness;

  ButtonText(
    this.text, {
    this.onPress,
    this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 20,
          color:
              brightness == Brightness.light ? Colors.white : Colors.grey[800],
        ),
      ),
      size: 50,
      onPress: () => this.onPress(),
    );
  }
}
