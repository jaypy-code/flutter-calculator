import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final Widget child;
  final Function onPress;
  final double size;

  Button({
    this.child,
    this.onPress,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => this.onPress(),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        child: Ink(
          width: this.size,
          height: this.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child,
            ],
          ),
        ),
      ),
    );
  }
}
