import 'package:api_tut3_flutter/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "api 3",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
