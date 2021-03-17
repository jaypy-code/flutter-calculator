import 'package:calc/components/buttons/text.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final List<ButtonText> children;
  final int count;

  Buttons({
    this.children,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width - (75 + 40),
      height: 140,
      child: NotificationListener<OverscrollIndicatorNotification>(
        // ignore: missing_return
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: GridView.count(
          crossAxisCount: this.count,
          children: this.children,
        ),
      ),
    );
  }
}
