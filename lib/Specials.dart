import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class Specials extends StatelessWidget {
  const Specials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Desserts',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
