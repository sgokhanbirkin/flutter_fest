// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:dio/dio.dart';

import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Colors.orange;
const TargetPlatform platform = TargetPlatform.android;

// void main() async {
//   final url = Uri.https(
//     'www.googleapis.com',
//     '/books/v1/volumes',
//     {'q': '{http}'},
//   );

//   // Await the HTTP GET response, then decode the
//   // JSON data it contains.
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final jsonResponse = convert.jsonDecode(response.body);
//     final itemCount = jsonResponse['totalItems'];
//     print('Number of books about HTTP: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  final String appTitle = 'FlutterFest';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      checkerboardOffscreenLayers: true,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
        ),
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.light),
      highContrastDarkTheme: ThemeData(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: const ScaffoldTest2(),
      // initialRoute: '/HomePage',
      // routes: {
      //   '/HomePage': (context) => MyHomePage(
      //         title: appTitle,
      //         opacity: 0.7,
      //       ),
      //   '/HelpPage': (context) => const HelpPage(),
      //   '/ScaffoldTest': (context) => const ScaffoldTest(),
      // },
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

class ScaffoldTest2 extends StatefulWidget {
  const ScaffoldTest2({Key? key}) : super(key: key);

  @override
  State<ScaffoldTest2> createState() => _ScaffoldTest2State();
}

class _ScaffoldTest2State extends State<ScaffoldTest2> {
  double seeds = 100.0;

  int get seedCount => seeds.floor();

  final snakBar = SnackBar(
    content: const Text('Yay ! A SnackBar'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  SnackBar get snackBar => snakBar;

  late Response response;
  //var dio = Dio();

  Future<void> fetchData() async {
    try {
      var dio = Dio();
      //  dio instance to request token
      var tokenDio = Dio();
      String? csrfToken;
      dio.options.baseUrl = 'http://www.dtworkroom.com/doris/1/2.0.0/';
      tokenDio.options = dio.options;
      print("Dio Test");
      dio.interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          print(
              'Send reques: path : : ${options.path}, Base Url : ${options.baseUrl}');
          if (csrfToken == null) {
            print('no Token, request token firstly...');
            tokenDio.get('/token').then((value) {
              options.headers['csrfToken'] =
                  csrfToken = value.data['data']['token'];
              print(
                  'Request token succeed, value : ${value.data['data']['token']}');
              print(
                  'continue to perform request : path : ${options.path}, base Url :: ${options.baseUrl}');
              handler.next(options);
            }).catchError((error, stackTrace) {
              handler.reject(error, true);
            });
          } else {
            options.headers['csrfToken'] = csrfToken;
            print("Else");
            return handler.next(options);
          }
        },
      ));
    } catch (e) {
      print("ERROR : : : ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ? App Bar Section
      appBar: AppBar(
        actions: const [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Süleyman Gökhan BİRKİN'),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4D03AQEaQ5jkiJ1vhA/profile-displayphoto-shrink_800_800/0/1614202650100?e=1648684800&v=beta&t=E-mM2HOYZ5usVVart5y-xe76yNMyU3AQyo7IlUjKpUc'),
              backgroundColor: Colors.white,
              radius: 30.0,
            )
          ],
        ),
      ),
      // ? Scaffold Stye  Props
      backgroundColor: Colors.white,
      // ? Drawers Section
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Ana Sayfa'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Profil'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Test'),
            ),
          ],
        ),
      ),
      // ? Bottom Nav Bar Section
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  print("Fetching data");
                  await fetchData();
                  print("Fetched data");
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Gesture Detector Button'),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Show Snackbar'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: SizedBox(
                      width: 400,
                      height: 400,
                      child: CustomPaint(
                        painter: SunflowerPainter(seedCount),
                      ),
                    ),
                  )
                ],
              ),
              Text("Showing $seedCount seeds"),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 300),
                child: Slider.adaptive(
                    value: seeds,
                    min: 20,
                    max: 2000,
                    onChanged: (newValue) {
                      setState(() {
                        seeds = newValue;
                      });
                    }),
              ),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    //fit: BoxFit.cover,
                    alignment: Alignment.center,
                    scale: 4,
                    repeat: ImageRepeat.repeatX,
                    colorFilter:
                        ColorFilter.mode(Colors.redAccent, BlendMode.darken),
                    image: NetworkImage(
                        'https://media-exp1.licdn.com/dms/image/C4D03AQEaQ5jkiJ1vhA/profile-displayphoto-shrink_800_800/0/1614202650100?e=1648684800&v=beta&t=E-mM2HOYZ5usVVart5y-xe76yNMyU3AQyo7IlUjKpUc'),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
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

class SunflowerPainter extends CustomPainter {
  static const seedRadius = 2.0;
  static const scaleFactor = 4;
  static const tau = math.pi * 2;

  static final phi = (math.sqrt(5) + 1) / 2;

  final int seeds;

  SunflowerPainter(this.seeds);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.width / 2;

    for (var i = 0; i < seeds; i++) {
      final theta = i * tau / phi;
      final r = math.sqrt(i) * scaleFactor;
      final x = center + r * math.cos(theta);
      final y = center - r * math.sin(theta);
      final offset = Offset(x, y);
      if (!size.contains(offset)) {
        continue;
      }
      drawSeed(canvas, x, y);
    }
  }

  @override
  bool shouldRepaint(SunflowerPainter oldDelegate) {
    return oldDelegate.seeds != seeds;
  }

  // Draw a small circle representing a seed centered at (x,y).
  void drawSeed(Canvas canvas, double x, double y) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..color = primaryColor;
    canvas.drawCircle(Offset(x, y), seedRadius, paint);
  }
}
