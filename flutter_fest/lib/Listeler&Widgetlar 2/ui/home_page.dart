import 'package:flutter/material.dart';
import 'package:flutter_fest/Listeler&Widgetlar%201/deatailPage.dart';
import 'package:flutter_fest/Listeler&Widgetlar%202/models/student.dart';
import 'package:flutter_fest/Listeler&Widgetlar%202/ui/widgets/notification_banner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? students;

  @override
  void initState() {
    getStudents();
    super.initState();
  }

  Future<void> getStudents() async {
    Uri url = Uri.parse('https://randomuser.me/api/?results=30');
    var response = await http.get(url);
    // ? print(response.statusCode);
    // pay attention to status code
    // ? print(response.body);
    var responseBody = jsonDecode(response.body);
    // ? print(responseBody['results'][0]['gender']);
    students =
        responseBody['results'].map((map) => Student.fromJson(map)).toList();
    // ? print(students);
    setState(() {
      students;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (students == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (students == null)
              ? const Center(
                  child: Text('İçerik Boş'),
                )
              : SafeArea(
                  top: false,
                  child: CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        title: Text('Ana Sayfa'),
                      ),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _gridItemWidget(students![index]);
                          },
                          childCount: students!.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                      ),
                      const NotificationBanner(
                        bannerText: 'Kayıtlar Başladı.',
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return _listItemWidget(students![index]);
                        }, childCount: students!.length),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _listItemWidget(Student student) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.green,
        onTap: () {
          goToDetailPage();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(student.name),
          ),
        ),
      ),
    );
  }

  Widget _gridItemWidget(Student student) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.green,
        onTap: () {
          goToDetailPage();
        },
        child: GridTile(
          child: Image.network(
            student.imgUrl,
            fit: BoxFit.cover,
          ),
          footer: Center(
              child: Container(
            color: Colors.white.withOpacity(0.5),
            child: Text(student.name),
          )),
        ),
      ),
    );
  }

  goToDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DetailPage();
    })).then((value) {
      print('Dönüş yapıldı..');
    });
    print("Düğmeye basıldı..");
  }
}
