import 'package:flutter/material.dart';
import 'package:flutter_eplacement/widgets/fragment_holder.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 21, 62, 96),
          foregroundColor: Colors.white,
          title: const Text("E-placement"),
        ),
        body: const FragmentHolder(),
      ),
    );
  }
}