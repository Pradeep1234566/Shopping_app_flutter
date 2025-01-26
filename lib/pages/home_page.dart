import 'package:flutter/material.dart';
import 'package:shopping/pages/favourites_page.dart';
import 'package:shopping/pages/search_page.dart';
import 'package:shopping/pages/shopping_page.dart';
import 'package:shopping/widgets/W1.dart';
import 'package:shopping/widgets/W2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget? currentDisplay; // Track the currently displayed widget

  final List<Widget> _pages = [
    HomePage(), // Assuming this is the homepage itself
    SearchPage(),
    ShoppingPage(),
    FavouritesPage(),
  ];

  final List<String> Name = [
    'assest/Images/S1.jpg',
    'assest/Images/S2.jpg',
  ];

  final List<String> Watch = [
    'assest/Images/W1.jpg',
    'assest/Images/W2.jpg',
  ];
  final List<String> watch_name = [
    'Rolex',
    'Casio',
  ];

  final List<String> Shoe = [
    'Nike Air Max 200',
    'Nike Air Max 97',
  ];

  final List<String> cost = [
    '\$120',
    '\$160',
  ];

  final List<String> status = [
    'Available',
    'Out of Stock',
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index != _selectedIndex) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _pages[index]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: Column(
          children: [
            _buildTopBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our',
                    style: TextStyle(fontSize: 30),
                  ),
                  const Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  _buildCategoryButtons(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (currentDisplay != null) currentDisplay!, // Display the widget
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          _buildBottomNavItem(Icons.home, 'Home', 0),
          _buildBottomNavItem(Icons.search, 'Search', 1),
          _buildBottomNavItem(Icons.shopping_cart, 'Cart', 2),
          _buildBottomNavItem(Icons.favorite, 'Favourite', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.orange : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.white : Colors.grey,
        ),
      ),
      label: label,
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assest/Images/P1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                Text(
                  'Search Products...',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.tune, color: Colors.grey),
      ],
    );
  }

  Widget _buildCategoryButtons() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          IconButton(
            icon: const Icon(Icons.snowshoeing),
            onPressed: () {
              setState(() {
                currentDisplay = display(
                  Name: Name,
                  Shoe: Shoe,
                  cost: cost,
                  status: status,
                );
              });
            },
            tooltip: 'Shoes',
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.watch),
            onPressed: () {
              setState(() {
                currentDisplay = display(
                  Name: Watch,
                  Shoe: watch_name,
                  cost: cost,
                  status: status,
                );
              });
            },
            tooltip: 'Watches',
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.dry_cleaning),
            onPressed: () {
              setState(() {
                currentDisplay = display(
                  Name: Name,
                  Shoe: Shoe,
                  cost: cost,
                  status: status,
                );
              });
            },
            tooltip: 'Jackets',
          ),
        ],
      ),
    );
  }
}
