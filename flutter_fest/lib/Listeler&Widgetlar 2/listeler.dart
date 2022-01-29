import 'package:flutter/material.dart';

class ListelerWidget extends StatefulWidget {
  const ListelerWidget({Key? key}) : super(key: key);

  @override
  _ListelerWidgetState createState() => _ListelerWidgetState();
}

class _ListelerWidgetState extends State<ListelerWidget> {
  List? students;

  @override
  void initState() {
    students = ['Gökhan', 'Pınar', 'Hakan', 'Şule'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listeler'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text(students![0]),
          Text(students![1]),
          Text(students![2]),
        ],
      ),
    );
  }
}
