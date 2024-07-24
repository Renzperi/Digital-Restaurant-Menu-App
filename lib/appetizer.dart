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
                  'APPETIZERS MENU',
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
                          'Chip and Dips',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //list of chips and dips
                      _buildPicture(
                          'assets/images/buffalo-chicken-dip.jpg',
                          'Buffalo Chicken Dip',
                          '₱150',
                          'A creamy, spicy dip made with shredded chicken, cream cheese, and Buffalo sauce.'),
                      _buildPicture(
                          'assets/images/image2.png',
                          'Caesar Salad',
                          '₱150',
                          'Crispy romaine lettuce tossed with Caesar dressing, croutons, and parmesan cheese.'),
                      _buildPicture(
                          'assets/images/Blue-Cheese-Dip.jpg',
                          'Blue Cheese Dip',
                          '₱150',
                          'A rich and tangy dip made with creamy blue cheese and sour cream.'),
                      _buildPicture(
                          'assets/images/Bacon-Cheddar-Dip.jpg',
                          'Bacon Cheddar Dip',
                          '₱150',
                          'A savory dip with crispy bacon, sharp cheddar cheese, and creamy base.'),
                      //end of chips and dips

                      const SizedBox(
                          height:
                              30), // Add space between Main Course and Appetizers
                      const Center(
                        child: Text(
                          'Cocktails',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //list of cocktails
                      _buildPicture(
                          'assets/images/Red Wine.jpg',
                          'Red Wine',
                          '₱250',
                          'A selection of fine red wines to complement your meal.'),
                      _buildPicture(
                          'assets/images/White Wine.jpg',
                          'White Wine',
                          '₱250',
                          'A selection of crisp and refreshing white wines.'),
                      //end of cocktails
                      const SizedBox(
                          height:
                              30), // Add space between Desserts and Appetizers
                      const Center(
                        child: Text(
                          'Fruit Appetizers',
                          style: TextStyle(
                            fontFamily: 'Rosarivo-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //list of fruit appetizers
                      _buildPicture(
                          'assets/images/Crame brulee.jpg',
                          'Creme Brulee',
                          '₱150',
                          'A creamy custard dessert topped with a layer of caramelized sugar.'),
                      _buildPicture(
                          'assets/images/Caprese Skewers.jpg',
                          'Caprese Skewers',
                          '₱150',
                          'Skewers of cherry tomatoes, mozzarella, and basil drizzled with balsamic glaze.'),
                      _buildPicture(
                          'assets/images/Strawberry-Balsamic-Bruschetta.jpg',
                          'Strawberry Balsamic Bruschetta',
                          '₱150',
                          'Toasted baguette topped with strawberries, basil, and balsamic reduction.'),
                      _buildPicture(
                          'assets/images/stuffed-dates.jpg',
                          'Stuffed Dates',
                          '₱150',
                          'Dates filled with creamy goat cheese and a sprinkle of nuts.'),
                      //end of fruit appetizers
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

  Widget _buildPicture(String imagePath, String dishName, String price, String description) {
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
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.black),
                    maxLines: 2, // Limit to two lines
                    overflow: TextOverflow.ellipsis, // Add ellipsis if overflow
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
