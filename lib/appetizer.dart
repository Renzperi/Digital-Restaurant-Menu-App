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
      title: 'Appetizer Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Appetizer(),
    );
  }
}

class Appetizer extends StatefulWidget {
  const Appetizer({super.key});

  @override
  _AppetizerState createState() => _AppetizerState();
}

class _AppetizerState extends State<Appetizer> {
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
                'Appetizers',
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
                _buildPicture(context, 'assets/images/buffalo-chicken-dip.jpg', 'Buffalo Chicken Dip', '₱150', 'A creamy, spicy dip made with shredded chicken, cream cheese, and Buffalo sauce.'),
                _buildPicture(context, 'assets/images/Caeser Salad.png', 'Caesar Salad', '₱150', 'Crispy romaine lettuce tossed with Caesar dressing, croutons, and parmesan cheese.'),
                _buildPicture(context, 'assets/images/Blue-Cheese-Dip.jpg', 'Blue Cheese Dip', '₱150', 'A rich and tangy dip made with creamy blue cheese and sour cream.'),
                _buildPicture(context, 'assets/images/Bacon-Cheddar-Dip.jpg', 'Bacon Cheddar Dip', '₱150', 'A savory dip with crispy bacon, sharp cheddar cheese, and creamy base.'),
                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Cocktails',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildPicture(context, 'assets/images/Red Wine.jpg', 'Red Wine', '₱250', 'A selection of fine red wines to complement your meal.'),
                _buildPicture(context, 'assets/images/White Wine.jpg', 'White Wine', '₱250', 'A selection of crisp and refreshing white wines.'),
                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Fruit Appetizers',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildPicture(context, 'assets/images/Crame brulee.jpg', 'Creme Brulee', '₱150', 'A creamy custard dessert topped with a layer of caramelized sugar.'),
                _buildPicture(context, 'assets/images/Caprese Skewers.jpg', 'Caprese Skewers', '₱150', 'Skewers of cherry tomatoes, mozzarella, and basil drizzled with balsamic glaze.'),
                _buildPicture(context, 'assets/images/Strawberry-Balsamic-Bruschetta.jpg', 'Strawberry Balsamic Bruschetta', '₱150', 'Toasted baguette topped with strawberries, basil, and balsamic reduction.'),
                _buildPicture(context, 'assets/images/stuffed-dates.jpg', 'Stuffed Dates', '₱150', 'Dates filled with creamy goat cheese and a sprinkle of nuts.'),
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
                      style: const TextStyle(fontSize: 12, fontFamily:'Gabarito-Regular', color: Colors.black),
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
