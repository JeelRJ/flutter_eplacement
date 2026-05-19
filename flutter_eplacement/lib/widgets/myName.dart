import 'package:flutter/material.dart';

class MyName extends StatelessWidget {
  final String name;
  const MyName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}