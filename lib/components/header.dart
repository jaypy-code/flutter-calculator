import 'package:calc/components/buttons/icon.dart';
import 'package:calc/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) => Container(
        height: 45,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              theme.isLtr() ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: this.children(theme),
        ),
      ),
    );
  }

  List<Widget> children(ThemeProvider theme) {
    List<Widget> widgets = [
      ButtonIcon(
        icon: Icons.info_outline,
        size: 46,
        onPress: () => this.openMyGitHub(),
        brightness: theme.data().brightness,
      ),
      Spacer(),
      ButtonIcon(
        icon: Icons.swap_horiz,
        size: 46,
        onPress: () => theme.changePosition(),
        brightness: theme.data().brightness,
      ),
      ButtonIcon(
        icon: theme.data().primaryColor == Colors.blueGrey[800]
            ? Icons.wb_sunny
            : Icons.nightlight_round,
        size: 46,
        onPress: () => this.changeMode(theme),
        brightness: theme.data().brightness,
      ),
    ];

    return theme.isLtr() ? widgets : widgets.reversed.toList();
  }

  void changeMode(ThemeProvider themeProvider) {
    // if was dark mode
    if (themeProvider.data().primaryColor == Colors.blueGrey[800]) {
      themeProvider.setThemeByName('blue');
    } else
      themeProvider.setThemeByName('dark');
  }

  void openMyGitHub() async {
    String url = 'https://github.com/jaypy-code/flutter-calculator';
    if (await canLaunch(url)) await launch(url);
  }
}
