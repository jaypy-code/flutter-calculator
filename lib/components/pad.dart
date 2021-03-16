import 'package:flutter/material.dart';
import 'package:calc/interface/history.dart';

class Pad extends StatelessWidget {
  final String entry;
  final List<History> histories;

  Pad({
    this.entry,
    this.histories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 2.5) + 35,
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
                    color: Colors.grey[700],
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
    Color color = Colors.black,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: history.sing != null
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
              ],
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
