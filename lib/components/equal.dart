import 'package:flutter/material.dart';

class EqualButton extends StatelessWidget {
  final Function onPressed;

  EqualButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: InkWell(
          onTap: () => this.onPressed(),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          child: Container(
            width: double.infinity,
            height: 42,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '=',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
