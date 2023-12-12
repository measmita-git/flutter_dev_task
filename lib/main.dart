import 'package:flutter/material.dart';
import 'package:flutter_dev_task/model/candle_chart.dart';
import 'package:flutter_dev_task/model/patient_chart.dart';
import 'package:flutter_dev_task/main_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}
