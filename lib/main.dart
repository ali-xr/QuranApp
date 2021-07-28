import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuranApp(),
    );
  }
}
