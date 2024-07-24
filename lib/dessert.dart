import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class Dessert extends StatelessWidget {
  const Dessert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'DESSERT OPTIONS',
                  style: TextStyle(fontFamily: 'Rosarivo-Regular', fontSize: 20),
                ),
                const SizedBox(height: 20), // Space between DIGIRESTO and pictures
                SizedBox(
                  height: 350, // Adjust height to accommodate text below images
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Center(
                        child: Text(
                          'Cakes',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // List of Cakes
                      _buildPicture(context, 'assets/images/Lava Cake.jpg', 'Lava Cake', '₱750',
                          'A decadent chocolate cake with a gooey molten center.'),
                      _buildPicture(context, 'assets/images/Cheese Cake.jpg', 'Cheese Cake', '₱150',
                          'A rich and creamy cheesecake with a graham cracker crust.'),
                      _buildPicture(context, 'assets/images/Strawberry Cake.jpg', 'Strawberry Cake', '₱150',
                          'A moist cake layered with fresh strawberries and cream.'),
                      _buildPicture(context, 'assets/images/Blue Berry Cheese Cake.jpg', 'Blue Berry Cheese Cake', '₱150',
                          'Classic cheesecake topped with a sweet blueberry compote.'),
                      // End of Cakes

                      const SizedBox(height: 30), // Add space between Main Course and Appetizers
                      const Center(
                        child: Text(
                          'Frozen Sweets',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // List of Frozen sweets
                      _buildPicture(context, 'assets/images/banana split.jpg', 'Banana Split', '₱150',
                          'A classic dessert with bananas, ice cream, and a variety of toppings.'),
                      _buildPicture(context, 'assets/images/Ice-Cream-Sundae.jpg', 'Ice Cream Sundae', '₱150',
                          'Ice cream topped with sauces, nuts, and whipped cream.'),
                      _buildPicture(context, 'assets/images/Gelato.jpg', 'Gelato', '₱150',
                          'A rich and creamy Italian-style ice cream.'),
                      // End of frozen sweets

                      const SizedBox(height: 30), // Add space between Desserts and Appetizers
                      const Center(
                        child: Text(
                          'Pies',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // List of Pies
                      _buildPicture(context, 'assets/images/Blue Berry Pie.jpg', 'Blue Berry Pie', '₱900',
                          'A pie filled with sweet and tangy blueberries.'),
                      _buildPicture(context, 'assets/images/Apple Pie.jpg', 'Apple Pie', '₱900',
                          'A classic pie with spiced apples and a flaky crust.'),
                      _buildPicture(context, 'assets/images/Cherry Pie.jpg', 'Cherry Pie', '₱900',
                          'A tart and sweet pie made with fresh cherries.'),
                      // End of Pies

                      const SizedBox(height: 30),
                      const Center(
                        child: Text(
                          'Pudding',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // List of Pudding
                      _buildPicture(context, 'assets/images/Chocolate Pudding.jpg', 'Chocolate Pudding', '₱900',
                          'A rich and creamy chocolate dessert.'),
                      _buildPicture(context, 'assets/images/Bread Pudding.jpg', 'Bread Pudding', '₱900',
                          'A warm and comforting dessert made with bread and custard.'),
                      _buildPicture(context, 'assets/images/Vanilla Pudding.jpg', 'Vanilla Pudding', '₱900',
                          'A smooth and creamy vanilla-flavored pudding.'),
                      // End of Puddings
                      const SizedBox(height: 30), // Add space between Desserts and Beverages
                    ],
                  ),
                ),
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
                          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
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
