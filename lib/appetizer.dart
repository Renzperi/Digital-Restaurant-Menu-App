import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class Appetizer extends StatelessWidget {
  const Appetizer({super.key});

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
                  'MENU',
                  style:
                      TextStyle(fontFamily: 'Rosarivo-Regular', fontSize: 20),
                ),
                const SizedBox(
                    height: 20), // Space between DIGIRESTO and pictures
                SizedBox(
                  height: 350, // Adjust height to accommodate text below images
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Center(
                        child: Text(
                          'Main Course',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildPicture(
                          'assets/images/image1.png', 'Pizza Italiano', '₱750'),
                      _buildPicture(
                          'assets/images/image2.png', 'Cesar Salad', '₱150'),
                      _buildPicture('assets/images/image3.png',
                          'Truffle Arancini', '₱200'),
                      _buildPicture('assets/images/image4.png',
                          'Beet and Goat Cheese Salad', '₱250'),
                      _buildPicture('assets/images/image5.png',
                          'Maine Lobster Tail', '₱1100'),
                      _buildPicture('assets/images/image6.png',
                          'Wild Mushroom Risotto', '₱200'),

                      const SizedBox(
                          height:
                              30), // Add space between Main Course and Appetizers

                      const Center(
                        child: Text(
                          'Appetizers',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      _buildPicture('assets/images/image7.jpg',
                          'Oysters on the Half Shell', '₱750'),
                      _buildPicture('assets/images/image8.jpg',
                          'Foie Gras Terine', '₱750'),
                      _buildPicture('assets/images/image9.jpg',
                          'Pan Seared Scallops', '₱900'),
                      _buildPicture('assets/images/image10.jpg',
                          'Wild Mushroom Risotto', '₱900'),

                      const SizedBox(
                          height:
                              30), // Add space between Desserts and Appetizers

                      const Center(
                        child: Text(
                          'Desserts',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      _buildPicture(
                          'assets/images/image11.jpg', 'Crame brulee', '₱900'),
                      _buildPicture('assets/images/image12.jpg',
                          'Chocolate Lava Cake', '₱900'),
                      _buildPicture(
                          'assets/images/image13.jpg', 'Chessecake', '₱900'),
                      _buildPicture(
                          'assets/images/image14.jpg', 'Tiramisu', '₱900'),

                      const SizedBox(
                          height:
                              30), // Add space between Desserts and Beverages

                      const Center(
                        child: Text(
                          'Beverages',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      _buildPicture('assets/images/image15.jpg',
                          'Novellino Red Wine', '₱900'),
                      _buildPicture('assets/images/image16.jpg',
                          'Lieblling Wine', '₱900'),
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

  Widget _buildPicture(String imagePath, String dishName, String price) {
    return Container(
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
                width:
                    double.infinity, // Make the image take up the card's width
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
