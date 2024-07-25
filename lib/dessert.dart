import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dessert Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dessert(),
    );
  }
}

class Dessert extends StatefulWidget {
  const Dessert({super.key});

  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  final ScrollController _scrollController = ScrollController();
  Color _titleColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double percentage = (offset / 150).clamp(0, 1); // Adjust the value 150 based on your expandedHeight
      setState(() {
        _titleColor = Color.lerp(Colors.white, Colors.black, percentage)!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0, // Set the height of the expanded AppBar
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Desserts',
                style: TextStyle(
                  color: _titleColor,
                  fontFamily: 'Gabarito-Regular',
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/restobg.jpg', // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the blur strength as needed
                    child: Container(
                      color: Colors.black.withOpacity(0), // Optional: Adds a translucent overlay
                    ),
                  ),
                ],
              ),
            ),
            pinned: true, // Makes the AppBar stick at the top
            floating: false, // Make it not float over the content
            snap: false, // Snap effect when scrolling
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20), // Space between title and list
                _buildPicture(context, 'assets/images/Lava Cake.jpg', 'Lava Cake', '₱750', 'A decadent chocolate cake with a gooey molten center.'),
                _buildPicture(context, 'assets/images/Cheese Cake.jpg', 'Cheese Cake', '₱150', 'A rich and creamy cheesecake with a graham cracker crust.'),
                _buildPicture(context, 'assets/images/Strawberry Cake.jpg', 'Strawberry Cake', '₱150', 'A moist cake layered with fresh strawberries and cream.'),
                _buildPicture(context, 'assets/images/Blue Berry Cheese Cake.jpg', 'Blue Berry Cheese Cake', '₱150', 'Classic cheesecake topped with a sweet blueberry compote.'),
                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Frozen Sweets',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildPicture(context, 'assets/images/banana split.jpg', 'Banana Split', '₱150', 'A classic dessert with bananas, ice cream, and a variety of toppings.'),
                _buildPicture(context, 'assets/images/Ice-Cream-Sundae.jpg', 'Ice Cream Sundae', '₱150', 'Ice cream topped with sauces, nuts, and whipped cream.'),
                _buildPicture(context, 'assets/images/Gelato.jpg', 'Gelato', '₱150', 'A rich and creamy Italian-style ice cream.'),
                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Pies',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildPicture(context, 'assets/images/Blue Berry Pie.jpg', 'Blue Berry Pie', '₱900', 'A pie filled with sweet and tangy blueberries.'),
                _buildPicture(context, 'assets/images/Apple Pie.jpg', 'Apple Pie', '₱900', 'A classic pie with spiced apples and a flaky crust.'),
                _buildPicture(context, 'assets/images/Cherry Pie.jpg', 'Cherry Pie', '₱900', 'A tart and sweet pie made with fresh cherries.'),
                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Pudding',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildPicture(context, 'assets/images/Chocolate Pudding.jpg', 'Chocolate Pudding', '₱900', 'A rich and creamy chocolate dessert.'),
                _buildPicture(context, 'assets/images/Bread Pudding.jpg', 'Bread Pudding', '₱900', 'A warm and comforting dessert made with bread and custard.'),
                _buildPicture(context, 'assets/images/Vanilla Pudding.jpg', 'Vanilla Pudding', '₱900', 'A smooth and creamy vanilla-flavored pudding.'),
                const SizedBox(height: 30), // Space before the end
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPicture(BuildContext context, String imagePath, String dishName, String price, String description) {
    return InkWell(
      onTap: () => _showPopup(context, imagePath, dishName, price, description),
      child: Container(
        width: 140, // Set a fixed width for each card
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity, // Make the image take up the card's width
                  height: 100, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishName,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 1, // Limit to one line
                      overflow: TextOverflow.ellipsis, // Add ellipsis if overflow
                    ),
                    Text(
                      price,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 12, fontFamily:'Gabarito-Regular', color: Colors.black),
                      maxLines: 2, // Limit to two lines
                      overflow: TextOverflow.ellipsis, // Add ellipsis if overflow
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopup(BuildContext context, String imagePath, String dishName, String price, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dishName),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(imagePath),
                const SizedBox(height: 10),
                Text(price),
                const SizedBox(height: 10),
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
