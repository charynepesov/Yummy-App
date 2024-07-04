import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  runApp(const YummyApp());
}

class YummyApp extends StatefulWidget {
  const YummyApp({super.key});

  @override
  State<YummyApp> createState() => _YummyAppState();
}

class _YummyAppState extends State<YummyApp> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.deepOrange;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Yummy App',
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(
          changeTheme: changeThemeMode,
          changeColor: changeColor,
          colorSelected: colorSelected),
    );
  }
}
