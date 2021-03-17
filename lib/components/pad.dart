import 'package:flutter/material.dart';
import 'package:calc/interface/history.dart';

class Pad extends StatelessWidget {
  final String entry;
  final List<History> histories;
  final Brightness brightness;
  final bool ltr;

  Pad({
    this.entry,
    this.histories,
    this.brightness,
    this.ltr = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 2.5) - 1,
      child: ListView(
        reverse: true,
        children: [
          Divider(),
          row(
            History(
              value: this.entry,
              sing: null,
            ),
            fontSize: setFontSize(
              text: this.entry,
              fontSize: 28,
              width: MediaQuery.of(context).size.width - (75 + 20),
            ),
            color: brightness == Brightness.light ? Colors.white : Colors.black,
          ),
          Column(
            children: histories
                .map(
                  (history) => row(
                    history,
                    fontSize: setFontSize(
                      text: history.value,
                      fontSize: 24,
                      width: MediaQuery.of(context).size.width - (75 + 85),
                    ),
                    color: brightness == Brightness.light
                        ? Colors.white54
                        : Colors.grey[700],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget row(
    History history, {
    double fontSize = 28,
    Color color,
  }) {
    List<Widget> widgets = history.sing != null
        ? [
            Text(
              history.sing,
              style: TextStyle(
                fontSize: 24,
                color: color,
              ),
            ),
            Spacer(),
            Text(
              history.value,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
              ),
            ),
          ]
        : [
            Text(
              history.value,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
              ),
            ),
          ];

    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Row(
        mainAxisAlignment:
            ltr ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: ltr ? widgets : widgets.reversed.toList(),
      ),
    );
  }

  double setFontSize({String text, double fontSize, double width}) {
    double textWidth = text.length * 25.0;
    if (textWidth < width)
      return fontSize;
    else if (textWidth < (width + (25.0 * 2)))
      return fontSize - 2;
    else if (textWidth < (width + (25.0 * 4)))
      return fontSize - 4;
    else if (textWidth < (width + (25.0 * 6)))
      return fontSize - 6;
    else
      return 12;
  }
}
