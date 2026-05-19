import 'package:flutter/material.dart';
import 'package:flutter_eplacement/widgets/ListingScreen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 21, 62, 96),
          foregroundColor: Colors.white,
          title:Text("E-placement"),
          actions: <Widget>[
                Icon(Icons.add),
          ],
          ),
        body: Listingscreen(),
      ),
    );
  }
}
