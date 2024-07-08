import 'package:flutter/material.dart';
import 'package:myapp/home1.dart';
import 'package:myapp/profile.dart';
class HomeRest extends StatefulWidget {
  @override
  _HomeRestState createState() => _HomeRestState();
}

class _HomeRestState extends State<HomeRest> {
  int _currentIndex = 0;

   final List<Widget> _tabs = [
    MyHomePage1(),
     ProfilePage(),
     MyCartPage(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
      body: _tabs[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  CategoryItem({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: 150,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example pages for Home, Profile, and Cart


class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Page'),
    );
  }
}
