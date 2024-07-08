import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myjuices extends StatelessWidget {
  const Myjuices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'juices',
          style: GoogleFonts.lobster(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: FruitList(),
    );
  }
}

class FruitList extends StatelessWidget {
  final List<Fruit> fruits = [
    Fruit(
        name: 'Apple',
        price: 'Rs 15.00',
        imageUrl: 'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg'),
    Fruit(
        name: 'Banana',
        price: 'Rs 20.00',
        imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2022/12/EK/NP/CN/49293026/fresh-banana-fruit.webp'),
    Fruit(
        name: 'Watermelon',
        price: 'Rs 50.00',
        imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2022/12/DM/EC/KE/49293026/fresh-watermelon-fruit.webp'),
    Fruit(
        name: 'Guava',
        price: 'Rs 10.00',
        imageUrl: 'https://t4.ftcdn.net/jpg/03/93/00/37/360_F_393003738_ZUGSxld5JsVt7BUVbpRIc7U1nTPFG8Zf.jpg'),
    Fruit(
        name: 'Strawberry',
        price: 'Rs 20.00',
        imageUrl: 'https://www.shutterstock.com/image-photo/strawberry-isolated-on-white-background-260nw-1305308014.jpg'),
    Fruit(
        name: 'Kiwi',
        price: 'Rs 50.00',
        imageUrl: 'https://cdn.britannica.com/45/126445-050-4C0FA9F6/Kiwi-fruit.jpg'),
    Fruit(
        name: 'Mango',
        price: 'Rs 50.00',
        imageUrl: 'https://media.istockphoto.com/id/529964085/photo/mango.jpg?s=612x612&w=0&k=20&c=rmcMZlLOZFdn4NhUcjnaJ3EBHKYZQ4xH4xzpzFU4JgY='),
    Fruit(
        name: 'Sapota',
        price: 'Rs 45.00',
        imageUrl: 'https://specialtyproduce.com/sppics/8433.png'),
    Fruit(
        name: 'Dragon Fruits',
        price: 'Rs 45.00',
        imageUrl: 'https://seedlefarms.com/wp-content/uploads/2021/06/WhatsApp-Image-2021-06-01-at-2.33.32-PM.jpeg'),
    Fruit(
        name: 'Sitaphal',
        price: 'Rs 45.00',
        imageUrl: 'https://t4.ftcdn.net/jpg/03/02/52/63/360_F_302526342_XCZmaUqnhbKmpCoCTdqiX2k60PQ3JR9g.jpg'),
    Fruit(
        name: 'Coconut',
        price: 'Rs 50.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv6xjuKb66vIfDhI01v0Io58CjF7bQpnlw8g&s'),
    Fruit(
        name: 'Pineapple',
        price: 'Rs 50.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmKTJewGjbKALfCH-3wqImdZQGnkmpSAp_GQ&s'),
    Fruit(
        name: 'Green apple',
        price: 'Rs 50.00',
        imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2022/12/LU/LL/KP/49293026/fresh-green-apple-fruit.webp'),
    Fruit(
        name: 'Papaya',
        price: 'Rs 50.00',
        imageUrl: 'https://media.istockphoto.com/id/864053288/photo/whole-and-half-of-ripe-papaya-fruit-with-seeds-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=hJ5DpNTt0oKjZMIHYV6gUHTntB2zIs_78dPKiuDUXgE='),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fruits.length,
      itemBuilder: (context, index) {
        return FruitTile(fruit: fruits[index]);
      },
    );
  }
}

class Fruit {
  final String name;
  final String price;
  final String imageUrl;
  bool isFavorite;
  int count;

  Fruit({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.count = 0,
  });
}

class FruitTile extends StatefulWidget {
  final Fruit fruit;

  FruitTile({required this.fruit, Key? key}) : super(key: key);

  @override
  _FruitTileState createState() => _FruitTileState();
}

class _FruitTileState extends State<FruitTile> {
  void _toggleFavorite() {
    setState(() {
      widget.fruit.isFavorite = !widget.fruit.isFavorite;
    });
  }

  void _incrementCount() {
    setState(() {
      widget.fruit.count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (widget.fruit.count > 0) {
        widget.fruit.count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.fruit.imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.fruit.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.fruit.price,
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    _buildCounterButton(Icons.remove, _decrementCount),
                    SizedBox(width: 8),
                    Text(
                      '${widget.fruit.count}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildCounterButton(Icons.add, _incrementCount),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  widget.fruit.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.fruit.isFavorite ? Colors.red : null,
                ),
                onPressed: _toggleFavorite,
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${widget.fruit.name} added to cart')),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  side: BorderSide(color: Colors.orange),
                ),
                child: Text('Add to Cart'),
              
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}


