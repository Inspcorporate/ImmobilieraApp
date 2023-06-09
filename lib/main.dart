import 'package:flutter/material.dart';
import 'package:misoa/bigin/splashcreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const splashcreen(),
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(bodyText1: TextStyle()),
          brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
