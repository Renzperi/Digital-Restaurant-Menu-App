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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0, // Set the height of the expanded AppBar
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'MAIN DISHES',
                style: TextStyle(
                  fontFamily: 'Gabarito-Regular',
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              background: Container(
                color: Colors.white, // Optional: Add a background color
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
                const Center(
                  child: Text(
                    'Meat Options',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // List of Meat Options
                _buildPicture(context, 'assets/images/grilled steak.jpg', 'Grilled Steak', '₱750', 'Juicy, tender steak grilled to perfection and served with sides.'),
                _buildPicture(context, 'assets/images/roast chicken.jpg', 'Roast Chicken', '₱150', 'Herb-seasoned roast chicken served with roasted potatoes and vegetables.'),
                _buildPicture(context, 'assets/images/lamb chops.jpg', 'Lamb Chops', '₱150', 'Tender lamb chops grilled and served with mint sauce.'),
                _buildPicture(context, 'assets/images/chicken wings.jpg', 'Chicken Wings', '₱150', 'Crispy chicken wings tossed in your choice of sauce.'),
                _buildPicture(context, 'assets/images/Beef-Burgers.jpg', 'Beef Burgers', '₱150', 'Classic beef burger with lettuce, tomato, and cheese.'),
                // End of Meat Options

                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Sea Foods',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // List of Sea Foods
                _buildPicture(context, 'assets/images/oysters.jpg', 'Oysters on the Half Shell', '₱750', 'Fresh oysters served with lemon and cocktail sauce.'),
                _buildPicture(context, 'assets/images/grilled salmon.jpeg', 'Grilled Salmon', '₱750', 'Grilled salmon fillet served with a side of vegetables.'),
                _buildPicture(context, 'assets/images/lobster-tail.jpg', 'Lobster Tail', '₱750', 'Succulent lobster tail served with drawn butter.'),
                _buildPicture(context, 'assets/images/tuna_steak.jpg', 'Grilled Tuna Steak', '₱750', 'Grilled tuna steak served rare with a side of greens.'),
                _buildPicture(context, 'assets/images/Calamari.jpg', 'Calamari', '₱750', 'Crispy fried calamari served with marinara sauce.'),
                // End of Sea Foods

                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Veggie Meals',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // List of Veggie Meals
                _buildPicture(context, 'assets/images/cauliflower curry.jpg', 'Cauliflower Curry', '₱900', 'Spicy cauliflower curry served with rice.'),
                _buildPicture(context, 'assets/images/eggplant-parmesan.jpg', 'Eggplant Parmesan', '₱900', 'Breaded eggplant slices baked with marinara sauce and cheese.'),
                _buildPicture(context, 'assets/images/greeksalad.jpg', 'Greek Salad', '₱900', 'Fresh salad with cucumbers, tomatoes, olives, and feta cheese.'),
                // End of Veggie Meals

                const SizedBox(height: 30), // Space between categories
                const Center(
                  child: Text(
                    'Pasta Dishes',
                    style: TextStyle(
                      fontFamily: 'Gabarito-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // List of Pasta Dishes
                _buildPicture(context, 'assets/images/pizza ittaliano.png', 'Pizza Italiano', '₱900', 'Classic Italian pizza with fresh tomatoes, mozzarella, and basil.'),
                _buildPicture(context, 'assets/images/Lasagna.jpg', 'Lasagna', '₱900', 'Layers of pasta, meat sauce, ricotta, and mozzarella.'),
                _buildPicture(context, 'assets/images/Carbonara.jpg', 'Carbonara', '₱900', 'Pasta with creamy egg sauce, pancetta, and Parmesan.'),
                _buildPicture(context, 'assets/images/Mac-Cheese.jpg', 'Mac and Cheese', '₱900', 'Creamy macaroni and cheese baked to perfection.'),
                // End of Pasta Dishes

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
