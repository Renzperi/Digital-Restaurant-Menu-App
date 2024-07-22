import 'package:flutter/material.dart';
import 'About_us.dart';
import 'Specials.dart';
import 'Home.dart';

<<<<<<< HEAD
void main() {
  runApp(const MyApp());
=======

void main() {
  runApp(const MyApp()); 
>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
=======
   
>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/About_us': (context) => const About_us(),
        '/Staff': (context) => const Specials(),
      },
    );
  }
}

<<<<<<< HEAD
=======


>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(
          'DIGIRESTO',
          style: TextStyle(fontFamily: 'Rosarivo-Regular'),
        ),
=======
        title: const Text('DIGIRESTO', style: TextStyle(fontFamily: 'Rosarivo-Regular'),),
>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const Home(), //Route papuntang Home
              );
            },
          ),
<<<<<<< HEAD
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) =>
                    const About_us(), //Route papuntang About us
              );
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) =>
                    const Specials(), //Route papuntang Specials
              );
            },
          ),
        ],
      ),
=======
        Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const About_us(), //Route papuntang About us
              );
            },
          ),

           Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const Specials(), //Route papuntang Specials
              );
            },
          ),

        ],
      ),




>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
<<<<<<< HEAD
            icon: Icon(
              Icons.info,
              color: Colors.black,
            ),
=======
            icon: Icon(Icons.info, color: Colors.black,),
>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
            label: 'About us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_sharp, color: Colors.black),
            label: 'Specials',
          ),
<<<<<<< HEAD
=======

>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> d5a22f2c66a40194fe1218023db947aa38f8612b
