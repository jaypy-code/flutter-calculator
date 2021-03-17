import 'package:calc/components/button.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  final double size;
  final Brightness brightness;

  ButtonIcon({
    this.icon,
    this.onPress,
    this.size,
    this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      child: Icon(
        icon,
        size: 18,
        color: brightness == Brightness.light ? Colors.white : Colors.grey[800],
      ),
      size: size,
      onPress: () => onPress(),
    );
  }
}
