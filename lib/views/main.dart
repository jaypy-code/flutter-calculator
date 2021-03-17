import 'package:calc/components/buttons.dart';
import 'package:calc/components/buttons/backspace.dart';
import 'package:calc/components/buttons/text.dart';
import 'package:calc/components/equal.dart';
import 'package:calc/components/numbers.dart';
import 'package:calc/components/pad.dart';
import 'package:calc/components/view.dart';
import 'package:calc/database/buttons.dart';
import 'package:calc/interface/history.dart';
import 'package:calc/services/vibration.dart' as vibration;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<History> histories = [];
  String entry = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Theme.of(context).primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Brightness.light,
    ));
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
                    count: 4,
                    children: buttons
                        .map(
                          (button) => ButtonText(
                            button,
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
                        ButtonText(
                          'C',
                          onPress: () => this.clear(),
                        ),
                        Spacer(),
                        ButtonBackspace(
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
    if (this.entry.isEmpty) {
      vibration.onErrorHappend();
      return;
    }
    vibration.onPressAButton();
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
    vibration.onPressAButton();
    setState(() {
      this.entry += value;
    });
  }

  void clear() {
    vibration.onPressAButton();
    setState(() {
      this.entry = '';
      this.histories = [];
    });
  }

  void backspace() {
    vibration.onPressAButton();
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
    if (histories.isEmpty ||
        (histories.length == 1 && entry.length == 0) ||
        histories.last.sing == '=') {
      vibration.onErrorHappend();
      return;
    }
    vibration.onPressAButton();
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
