import 'package:calc/services/theme.dart';
import 'package:calc/views/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: App(),
    ),
  );
}

// ignore: non_constant_identifier_names
MaterialApp App() {
  return MaterialApp(
    home: MainView(),
  );
}
