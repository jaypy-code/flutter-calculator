import 'package:calc/components/button.dart';
import 'package:calc/components/buttons.dart';
import 'package:calc/components/equal.dart';
import 'package:calc/components/numbers.dart';
import 'package:calc/components/pad.dart';
import 'package:calc/components/view.dart';
import 'package:calc/database/buttons.dart';
import 'package:calc/interface/history.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<History> histories = [];
  String entry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Row(
          children: [
            NumbersColumn(
              onPressed: (String value) => this.pushToEntry(value),
            ),
            View(
              child: Column(
                children: [
                  Pad(
                    entry: entry,
                    histories: histories,
                  ),
                  Buttons(
                    height: 70,
                    count: 4,
                    children: buttons
                        .map(
                          (button) => Button(
                            child: Text(
                              button,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[800],
                              ),
                            ),
                            onPress: () => this.pushToHistory(button),
                          ),
                        )
                        .toList(),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Button(
                          child: Text(
                            'c',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[800],
                            ),
                          ),
                          size: 50,
                          onPress: () => this.clear(),
                        ),
                        Spacer(),
                        Button(
                          child: Image.asset(
                            'lib/assets/icons/backspace.png',
                            width: 18,
                            height: 18,
                          ),
                          size: 50,
                          onPress: () => this.backspace(),
                        ),
                      ],
                    ),
                  ),
                  EqualButton(
                    onPressed: () => this.calculate(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pushToHistory(String sign) {
    if (this.entry.isEmpty) return;
    setState(() {
      this.histories.add(
            History(
              value: this.entry,
              sing: sign,
            ),
          );
      this.entry = '';
    });
  }

  void pushToEntry(String value) {
    setState(() {
      this.entry += value;
    });
  }

  void clear() {
    setState(() {
      this.entry = '';
      this.histories = [];
    });
  }

  void backspace() {
    setState(() {
      if (this.entry != null && this.entry.length > 0)
        this.entry = this.entry.substring(0, this.entry.length - 1);
      else if (this.histories.isNotEmpty) {
        int l = this.histories.length - 1;
        this.entry = this.histories[l].value;
        this.histories.removeAt(l);
      }
    });
  }

  void calculate() {
    if (histories.isEmpty) return;
    bool isDouble = histories[0].value.contains('.');
    double result = double.parse(histories[0].value);

    if (histories.length > 1) {
      for (int i = 1; i < histories.length; i++) {
        if (isDouble == false) isDouble = histories[i].value.contains('.');
        result = _calculateWith(
          result,
          double.parse(histories[i].value),
          histories[i].sing,
        );
      }
    }

    if (isDouble == false) isDouble = this.entry.contains('.');
    result = _calculateWith(
      result,
      double.parse(this.entry),
      histories[histories.length - 1].sing,
    );

    this.pushToHistory('=');

    setState(() {
      this.entry =
          isDouble ? result.toString() : result.toString().split('.')[0];
    });
  }

  double _calculateWith(double result, double value, String sign) {
    switch (sign) {
      case '+':
        result += value;
        break;
      case '-':
        result -= value;
        break;
      case '×':
        result *= value;
        break;
      case '÷':
        result /= value;
        break;
      default:
    }
    return result;
  }
}
