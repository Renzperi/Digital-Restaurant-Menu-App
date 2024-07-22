import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MainDish extends StatelessWidget {
  const MainDish({super.key});

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
                  'MAIN DISHES',
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
                          'Meat Options',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //list of Meat Options Dishes
                      _buildPicture(
                          'assets/images/image1.png', 'Pizza Italiano', '₱750'),
                      _buildPicture(
                          'assets/images/image2.png', 'Cesar Salad', '₱150'),
                      //end of Meat Dishes
                      const SizedBox(
                          height:
                              30), // Add space between Main Course and Appetizers
                      const Center(
                        child: Text(
                          'Sea Foods',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //list of Sea foods
                      _buildPicture('assets/images/image7.jpg',
                          'Oysters on the Half Shell', '₱750'),
                      _buildPicture('assets/images/image8.jpg',
                          'Foie Gras Terine', '₱750'),
                      //end of Sea foods
                      const SizedBox(
                          height:
                              30), // Add space between Desserts and Appetizers
                      const Center(
                        child: Text(
                          'Veggie Meals',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //list of veggie meals
                      _buildPicture(
                          'assets/images/image11.jpg', 'Crame brulee', '₱900'),
                      _buildPicture('assets/images/image12.jpg',
                          'Chocolate Lava Cake', '₱900'),
                      //end of veggie meals
                      const SizedBox(height: 30),
                      const Center(
                        child: Text(
                          'Pasta Dishes',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //list of Pasta dishes
                      _buildPicture(
                          'assets/images/image11.jpg', 'Crame brulee', '₱900'),
                      _buildPicture('assets/images/image12.jpg',
                          'Chocolate Lava Cake', '₱900'),
                      //end of pasta iitaalianoo
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
