import 'package:flutter/material.dart';
import 'package:flutter_fest/Listeler&Widgetlar%202/listeler_widget_2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const ListelerWidget2(),
    );
  }
}
