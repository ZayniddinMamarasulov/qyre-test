import 'package:flutter/material.dart';
import 'package:qyre_test/content.dart';
import 'package:qyre_test/features/home/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qyre test",
      home: Content(),
    );
  }
}
