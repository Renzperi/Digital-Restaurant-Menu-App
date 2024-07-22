import 'package:flutter/material.dart';
import 'dessert.dart';
import 'Specials.dart';
import 'appetizer.dart';
import 'main_dish.dart';

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
          title: const Center(
        child: Text(
          'DIGIRESTO',
          style: TextStyle(
            fontFamily: 'Rosarivo-Regular',
          ),
        ),
      )),
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
                    const MainDish(), //Route papuntang main dish page
              );
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) =>
                    const Dessert(), //Route papuntang About us
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
            icon: Icon(Icons.breakfast_dining,
                color: Color.fromARGB(255, 203, 236, 15)), //color of appetizer
            label: 'Appetizers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu_sharp,
              color: Color.fromARGB(255, 247, 4, 4), //color of main dishes
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake_sharp,
                color: Color.fromARGB(255, 255, 119, 183)), //color of desserts
            label: 'Desserts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_purple500_rounded,
                color: Color.fromARGB(255, 0, 255, 0)), //color of specials
            label: 'Specials',
          ),
        ],
      ),
    );
  }
}
