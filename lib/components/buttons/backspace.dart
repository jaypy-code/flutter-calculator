import 'package:calc/components/button.dart';
import 'package:flutter/material.dart';

class ButtonBackspace extends StatelessWidget {
  final Function onPress;

  ButtonBackspace({
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      child: Image.asset(
        'lib/assets/icons/backspace.png',
        width: 18,
        height: 18,
      ),
      size: 50,
      onPress: () => this.onPress(),
    );
  }
}
