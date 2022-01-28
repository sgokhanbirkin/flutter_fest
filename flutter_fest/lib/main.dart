import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'FlutterFest';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      checkerboardOffscreenLayers: true,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.light),
      highContrastDarkTheme: ThemeData(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => MyHomePage(
              title: appTitle,
              opacity: 0.7,
            ),
        '/HelpPage': (context) => const HelpPage(),
        '/ScaffoldTest': (context) => const ScaffoldTest(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, required this.opacity})
      : super(key: key);
  final String title;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/HelpPage');
                },
                child: const Text('HELP PAGE'),
              ), //ScaffoldTest
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ScaffoldTest');
                },
                child: const Text('ScaffoldTest PAGE'),
              ),
            ],
          ),
        ));
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(children: [
        const Text('Help Page'),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('BACK PAGE'),
        ),
      ])),
    );
  }
}

class ScaffoldTest extends StatelessWidget {
  const ScaffoldTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // leading: const Icon(Icons.menu),
            // title: const Text('Page title'),
            // actions: const [
            //   Icon(Icons.favorite),
            //   Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     child: Icon(Icons.search),
            //   ),
            //   Icon(Icons.more_vert),
            // ],
            // backgroundColor: Colors.purple,
            ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          mini: false,
          tooltip: 'FlutterFest',
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        endDrawer: Drawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.menu, color: Colors.white),
                    Text(
                      'Flutter Festival',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 40,
                      height: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
