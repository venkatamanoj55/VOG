import 'package:flutter/material.dart';
import 'package:myapp/Tiffins.dart';
import 'package:myapp/categories.dart';
import 'package:myapp/chinese.dart';

import 'package:myapp/juices.dart';
import 'package:myapp/lunch.dart';


class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.orange,
        title: Text("Restaurent",style: TextStyle(fontSize: 20,color: Colors.black,))) ,  

      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              CategoryItem(
                title: 'Tiffins',
                imageUrl: 'https://b.zmtcdn.com/data/pictures/chains/2/18796272/c0bc33a000ba29158ecec8881373446a_o2_featured_v2.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyTiffins()));
                },
              ),
              CategoryItem(
                title: 'Lunch',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8OujlPe18n2kaC1DUjZS61zomvi9HQ1AjBw&usqp=CAU',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mylunch()));
                },
              ),
              CategoryItem(
                title: 'juices',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMKgCn-Dyvm2RHWOuJHencHEzuPumi8jer3w&usqp=CAU',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Myjuices()));
                },
              ),
              CategoryItem(
                title: 'chinese',
                imageUrl: 'https://assets.zeezest.com/blogs/PROD_Banner_1663162846668.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mychinese()));
                 },
      ),
    ],
  ),
),);}}