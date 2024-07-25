import 'package:flutter/material.dart';
import 'dessert.dart';
import 'specials.dart';
import 'appetizer.dart';
import 'main_dish.dart';
import 'splash_screen.dart'; // Import the splash screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 238, 7, 7)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Set splash screen as initial route
        '/home': (context) => const MyHomePage(), // Route to the home page
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
          'DigiResto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Gabarito-Bold',
          ),
        ),
        centerTitle: true, // Ensure the title is centered
        toolbarHeight: kToolbarHeight, // Use default AppBar height
        backgroundColor: Colors.transparent, // Set background color to transparent
        elevation: 0, // Remove shadow
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xfff0256b), Color(0xffff9a68)], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const Appetizer(), // Route to appetizer page
              );
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const MainDish(), // Route to main dish page
              );
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const Dessert(), // Route to dessert page
              );
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const Specials(), // Route to specials page
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.breakfast_dining, 'Appetizers', 0),
            _buildBottomNavItem(Icons.restaurant_menu_sharp, 'Main', 1),
            _buildBottomNavItem(Icons.cake_sharp, 'Desserts', 2),
            _buildBottomNavItem(Icons.star_purple500_rounded, 'Specials', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _currentIndex == index ? Colors.black : Colors.black54,
      ),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      tooltip: label,
    );
  }
}
