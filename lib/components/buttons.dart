import 'package:calc/components/button.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final List<Button> children;
  final double height;
  final int count;

  Buttons({
    this.children,
    this.height,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width - (75 + 40),
      height: height,
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
