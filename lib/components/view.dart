import 'package:flutter/material.dart';

class View extends StatelessWidget {
  final Widget child;
  final double margin;

  View({
    this.child,
    this.margin = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 75,
      height: MediaQuery.of(context).size.height - (this.margin * 2),
      margin: EdgeInsets.symmetric(vertical: this.margin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
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
