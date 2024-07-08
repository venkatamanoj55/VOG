import 'package:flutter/material.dart';
import 'package:myapp/Tiffins.dart';
import 'package:myapp/chinese.dart';
import 'package:myapp/juices.dart';
// import 'package:myapp/lunch.dart';

class MyRestaurent extends StatefulWidget {
  const MyRestaurent({super.key});

  @override
  State<MyRestaurent> createState() => _MyRestaurentState();
}

class _MyRestaurentState extends State<MyRestaurent> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyTiffins(),
    // MyLunch(),
    Myjuices(),
    Mychinese(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.breakfast_dining),
            label: 'Tiffins',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_dining),
            label: 'Lunch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Juices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            label: 'Chinese',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
