import 'package:flutter/material.dart';
import 'package:flutter_input_page/ui/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'PT. Mandom Indonesia Tbk',
      ),
    );
  }
}
