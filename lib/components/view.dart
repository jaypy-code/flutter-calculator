import 'package:flutter/material.dart';

class View extends StatelessWidget {
  final Widget child;
  final double margin;
  final Color color;
  final bool ltr;

  View({
    this.child,
    this.margin = 25,
    this.color,
    this.ltr = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 75,
      height: MediaQuery.of(context).size.height - (this.margin * 2),
      margin: EdgeInsets.symmetric(vertical: this.margin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ltr
            ? BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            : BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20,
          ),
        ],
      ),
      child: this.child,
    );
  }
}
