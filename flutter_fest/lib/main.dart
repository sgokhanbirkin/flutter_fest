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
          title: const Text('Scaffold Page'),
        ),
        drawer: const Drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: FloatingActionButton.extended(
          tooltip: 'FlutterFest',
          onPressed: () {},
          label: const Text('Label'),
          icon: const Icon(Icons.add),
          // label: Column(
          //   children: const [
          //     Icon(Icons.add),
          //     Text('Add'),
          //   ],
          // ),
        ),
        backgroundColor: const Color(0xFF6200EE),
        endDrawer: const Drawer(
          child: ListTile(
            title: Text('Title'),
            trailing: Text('Trailing'),
            leading: Text('Leading '),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF121212),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Music',
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label: 'Places',
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: 'News',
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://media-exp1.licdn.com/dms/image/C4D03AQEaQ5jkiJ1vhA/profile-displayphoto-shrink_800_800/0/1614202650100?e=1648684800&v=beta&t=E-mM2HOYZ5usVVart5y-xe76yNMyU3AQyo7IlUjKpUc'),
                    backgroundColor: Colors.purple,
                    child: Text(
                      'SGB',
                    ),
                    radius: 30.0,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.purple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      //stops: [0.6, 0.3],
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        width: 5,
                        color: Colors.white,
                        style: BorderStyle.solid),
                  ),
                  width: 400,
                  height: 50,
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
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.green,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      width: 30,
                      height: 40,
                      child: const Text('Expanded Widget'),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      height: 30,
                      width: 30,
                      child: const Text('Flexible Widget'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
