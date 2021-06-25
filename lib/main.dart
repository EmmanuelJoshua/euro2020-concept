import 'package:euroapp_concept/ui/home/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Euro2020',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        accentColor: Colors.white,
        // textTheme: TextTheme(),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFF84B4B),
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: Home(),
    );
  }
}
