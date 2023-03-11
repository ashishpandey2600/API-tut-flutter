import 'package:flutter/material.dart';
import 'package:post_api/upload_image.dart';

import 'homepage.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadImage(),
    );
  }
}
