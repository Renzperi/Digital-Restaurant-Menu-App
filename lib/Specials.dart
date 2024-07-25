import 'package:flutter/material.dart';
import 'dart:ui';

class Specials extends StatefulWidget {
  const Specials({super.key});

  @override
  _SpecialsState createState() => _SpecialsState();
}

class _SpecialsState extends State<Specials> {
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
                'Specials',
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
                      color: Colors.black.withOpacity(0.2), // Optional: Adds a translucent overlay
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

                // List of Specials
                _buildPicture(context, 'assets/images/grilled steak.jpg', 'Grilled Steak', '₱750', 'Juicy, tender steak grilled to perfection and served with sides.'),
                _buildPicture(context, 'assets/images/oysters.jpg', 'Oysters on the Half Shell', '₱750', 'Fresh oysters served with lemon and cocktail sauce.'),
                _buildPicture(context, 'assets/images/pizza ittaliano.png', 'Pizza Italiano', '₱900', 'Classic Italian pizza with fresh tomatoes, mozzarella, and basil.'),
                _buildPicture(context, 'assets/images/Lava Cake.jpg', 'Lava Cake', '₱649', 'A decadent chocolate cake with a gooey molten center.'),
                _buildPicture(context, 'assets/images/roast chicken.jpg', 'Roast Chicken', '₱150', 'Herb-seasoned roast chicken served with roasted potatoes and vegetables.'),

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
                          fontSize: 12, fontFamily: 'Gabarito-Regular', color: Colors.black),
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
