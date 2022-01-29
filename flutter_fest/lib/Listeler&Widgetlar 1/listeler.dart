import 'package:flutter/material.dart';
import 'package:flutter_fest/Listeler&Widgetlar%201/deatailPage.dart';

class ListelerWidget extends StatefulWidget {
  const ListelerWidget({Key? key}) : super(key: key);

  @override
  _ListelerWidgetState createState() => _ListelerWidgetState();
}

class _ListelerWidgetState extends State<ListelerWidget> {
  List<String>? students;

  @override
  void initState() {
    students = ['Gökhan', 'Pınar', 'Hakan', 'Şule', 'Hande'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Listeler'),
      //   centerTitle: true,
      // ),

      body: (students == null)
          ? const Center(child: Text('İçerik Bulunamadı..'))
          : SafeArea(
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      child: const Center(
                        child: Text('Kayıtlar Başladı..'),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      child: const Center(
                        child: Text('Kayıtlar Başladı..'),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  ),
                ],
/**Column(
                children: [
                  Expanded(
                    child: _listWidget(students!),
                  ),
                  Expanded(
                    child: _listWidget(students!),
                  )
                ],
              ), */
              ),
            ),
    );
  }

  Widget _listWidget(List<String> _students) {
    return ListView.separated(
      //GridView()
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 5.0,
      //   mainAxisSpacing: 5.0,
      //   childAspectRatio: 1 / 2,
      // ),
      // children: _studentList(_students),
      // ListView.builder()
      itemCount: _students.length,
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black,
        );
      },
      itemBuilder: (context, index) {
        return _listItemWidget(_students[index]);
      },
    );
  }

  Widget _listItemWidget(String student) {
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
            child: Text(student),
          ),
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

  List<Widget> _studentList(List<String> _students) => _students
      .map((student) => Container(color: Colors.amber, child: Text(student)))
      .toList();
}
