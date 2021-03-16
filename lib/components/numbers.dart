import 'package:calc/components/number.dart';
import 'package:calc/database/numbers.dart';
import 'package:flutter/cupertino.dart';

class NumbersColumn extends StatelessWidget {
  final Function onPressed;

  NumbersColumn({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: numbers
            .map(
              (String number) => NumberButton(
                number,
                size: MediaQuery.of(context).size.height / (numbers.length + 1),
                onPress: (String value) => this.onPressed(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
