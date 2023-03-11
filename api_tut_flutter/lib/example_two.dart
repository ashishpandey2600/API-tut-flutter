import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Photos"),
      ),
      body: Column(children: [

      ]),
    );
  }
}
