import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}
class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
      child: Text(
        'About us',
        style: TextStyle(fontSize: 24),
      ),
      ),
    );
}


}
      
  