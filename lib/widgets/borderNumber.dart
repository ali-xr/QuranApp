import 'dart:math';
import 'package:flutter/material.dart';

class BorderNumber extends StatefulWidget {
  final int number;
  const BorderNumber({required this.number});

  @override
  _BorderNumberState createState() => _BorderNumberState();
}

class _BorderNumberState extends State<BorderNumber> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 3),
          ),
        ),
        Transform.rotate(
          angle: pi / 1.3,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown, width: 3),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(widget.number.toString(),
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }
}
