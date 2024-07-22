import 'package:flutter/material.dart';
import 'About_us.dart';
import 'Specials.dart';
import 'appetizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: const Text(
          'DIGIRESTO',
          style: TextStyle(fontFamily: 'Rosarivo-Regular'),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) =>
                    const Appetizer(), //Route papuntang appetizer page
              );
            },
          ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        selectedItemColor: Colors.black, //color of bottom nav label if selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Appetizers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.black,
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Desserts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_sharp, color: Colors.black),
            label: 'Specials',
          ),
        ],
      ),
    );
  }
}
