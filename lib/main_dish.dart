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
                          'assets/images/grilled steak.jpg', 'Grilled Steak', '₱750', 'Juicy, tender steak grilled to perfection and served with sides.'),
                      _buildPicture(
                          'assets/images/roast chicken.jpg', 'Roast Chicken', '₱150', 'Herb-seasoned roast chicken served with roasted potatoes and vegetables.'),
                      _buildPicture(
                          'assets/images/lamb chops.jpg', 'Lamb Chops', '₱150', 'Tender lamb chops grilled and served with mint sauce.'),
                      _buildPicture(
                          'assets/images/chicken wings.jpg', 'Chicken Wings', '₱150', 'Crispy chicken wings tossed in your choice of sauce.'),
                      _buildPicture(
                          'assets/images/Beef-Burgers.jpg', 'Beef Burgers', '₱150', 'Classic beef burger with lettuce, tomato, and cheese.'),
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
                      _buildPicture('assets/images/oysters.jpg',
                          'Oysters on the Half Shell', '₱750', 'Fresh oysters served with lemon and cocktail sauce.'),
                      _buildPicture('assets/images/grilled salmon.jpeg',
                          'Grilled Salmon', '₱750', 'Grilled salmon fillet served with a side of vegetables.'),
                      _buildPicture('assets/images/lobster-tail.jpg',
                          'Lobster Tail', '₱750', 'Succulent lobster tail served with drawn butter.'),
                      _buildPicture('assets/images/tuna_steak.jpg',
                          'Grilled Tuna Steak', '₱750', 'Grilled tuna steak served rare with a side of greens.'),
                      _buildPicture('assets/images/Calamari.jpg',
                          'Calamari', '₱750', 'Crispy fried calamari served with marinara sauce.'),
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
                          'assets/images/cauliflower curry.jpg', 'Cauliflower Curry', '₱900', 'Spicy cauliflower curry served with rice.'),
                      _buildPicture('assets/images/eggplant-parmesan.jpg',
                          'Eggplant Parmesan', '₱900', 'Breaded eggplant slices baked with marinara sauce and cheese.'),
                      _buildPicture('assets/images/greeksalad.jpg',
                          'Greek Salad', '₱900', 'Fresh salad with cucumbers, tomatoes, olives, and feta cheese.'),
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
                          'assets/images/pizza ittaliano.png', 'Pizza Italiano', '₱900', 'Classic Italian pizza with fresh tomatoes, mozzarella, and basil.'),
                      _buildPicture('assets/images/Lasagna.jpg',
                          'Lasagna', '₱900', 'Layers of pasta, meat sauce, ricotta, and mozzarella.'),
                      _buildPicture('assets/images/Carbonara.jpg',
                          'Carbonara', '₱900', 'Pasta with creamy egg sauce, pancetta, and Parmesan.'),
                      _buildPicture('assets/images/Mac-Cheese.jpg',
                          'Mac and Cheese', '₱900', 'Creamy macaroni and cheese baked to perfection.'),
                      //end of pasta italiano
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
