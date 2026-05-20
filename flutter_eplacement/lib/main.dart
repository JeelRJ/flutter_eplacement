import 'package:flutter/material.dart';
import 'package:flutter_eplacement/widgets/fragment_holder.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget  {
  const MainApp({super.key});
@override
State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        
        body: FragmentHolder(

  onScreenChange: (index) {

    setState(() {

      currentScreen = index;

    });
  },
),
      ),
    );
  }
}