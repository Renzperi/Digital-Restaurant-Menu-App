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
                          'Cakes',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //list of Cakes
                      _buildPicture(
                          'assets/images/image1.png', 'Pizza Italiano', '₱750'),
                      _buildPicture(
                          'assets/images/image2.png', 'Cesar Salad', '₱150'),
                      //end of Cakes
                      const SizedBox(
                          height:
                              30), // Add space between Main Course and Appetizers
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
                      //list of Frozen sweets
                      _buildPicture('assets/images/image7.jpg',
                          'Oysters on the Half Shell', '₱750'),
                      _buildPicture('assets/images/image8.jpg',
                          'Foie Gras Terine', '₱750'),
                      //end of frozen sweets
                      const SizedBox(
                          height:
                              30), // Add space between Desserts and Appetizers
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
                      //list of Pies
                      _buildPicture(
                          'assets/images/image11.jpg', 'Crame brulee', '₱900'),
                      _buildPicture('assets/images/image12.jpg',
                          'Chocolate Lava Cake', '₱900'),
                      //end of Pies
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
                      //list of Pudding
                      _buildPicture(
                          'assets/images/image11.jpg', 'Crame brulee', '₱900'),
                      _buildPicture('assets/images/image12.jpg',
                          'Chocolate Lava Cake', '₱900'),
                      //end of Puddings
                      const SizedBox(
                          height:
                              30), // Add space between Desserts and Beverages
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
