import 'package:calc/components/buttons/icon.dart';
import 'package:flutter/material.dart';

class ButtonBackspace extends StatelessWidget {
  final Function onPress;
  final Brightness brightness;

  ButtonBackspace({
    this.onPress,
    this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonIcon(
      icon: Icons.backspace_outlined,
      size: 50,
      onPress: () => this.onPress(),
      brightness: brightness,
    );
  }
}
