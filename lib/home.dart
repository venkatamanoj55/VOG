import 'package:flutter/material.dart';
import 'package:myapp/categories.dart';
import 'package:myapp/fruits.dart';
import 'package:myapp/paste.dart';
import 'package:myapp/pickles.dart';
import 'package:myapp/pulses.dart';
import 'package:myapp/snacks.dart';
import 'package:myapp/soaps.dart';
import 'package:myapp/spices.dart';
import 'package:myapp/vegetables.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1030921772.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1061797254.
        backgroundColor: Colors.orange,
        title: Text("Grocery",style: TextStyle(fontSize: 20,color: Colors.black,)))   ,

      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              CategoryItem(
                title: 'Pulses',
                imageUrl: 'https://7thff.com/img/banner/largest-producer-of-pulses-in-india.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mypulses()));
                },
              ),
              CategoryItem(
                title: 'Spices',
                imageUrl: 'https://someindiangirl.com/wp-content/uploads/2020/01/780-2.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Myspices()));
                },
              ),
              CategoryItem(
                title: 'Snacks',
                imageUrl: 'https://s7ap1.scene7.com/is/image/itcportalprod/HeroBanner_PC_Desktop_5120x2880_4x?fmt=webp-alpha',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mysnacks()));
                },
              ),
              CategoryItem(
                title: 'Vegetables',
                imageUrl: 'https://cdn.britannica.com/17/196817-159-9E487F15/vegetables.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Myvegetables()));
                },
              ),
              CategoryItem(
                title: 'Pickles',
                imageUrl: 'https://m.media-amazon.com/images/I/71pY43Sj0RL.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mypickles()));
                },
              ),
              CategoryItem(
                title: 'Soaps',
                imageUrl: 'https://5.imimg.com/data5/SL/FC/BO/SELLER-760892/natural-organic-handmade-butter-soaps.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MySoaps()));
                },
              ),
              CategoryItem(
                title: 'Paste',
                imageUrl: 'https://media.licdn.com/dms/image/C5612AQGMfGjUu1NVZQ/article-cover_image-shrink_600_2000/0/1639367939586?e=2147483647&v=beta&t=7cGuMvLF5eoXWaAk1CpHsmihi_VZyn2TA6uPHoIGfXM',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mypastes()));
                },
              ),
              CategoryItem(
                title: 'Fruits',
                imageUrl: 'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyFruits()));
                },
              ),
            ],
          ),
        ),
    );
  }
}