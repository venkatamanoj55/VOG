import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySoaps extends StatelessWidget {
  const MySoaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soaps',
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
        name: 'Neem',
        price: 'Rs 55.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR21bXMLBCw6P6V-koncJ0_4XPCH-qu-NVWtg&usqp=CAU'),
    Fruit(
        name: 'Alovera',
        price: 'Rs 60.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOW5FstvHcLXtzDm73QmkvSphYmPdW5N8qcQ&usqp=CAU'),
    Fruit(
        name: 'Glysarin',
        price: 'Rs 50.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1MkhKZSf9ywv8Mr9m7Yet6_iEh1EjX937Kw&usqp=CAU'),
    Fruit(
        name: 'Tyrmeric',
        price: 'Rs 10.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjhNIJ4riyOMwoDy4z_rw5d9WysqpS7ErJ3w&usqp=CAU'),
    Fruit(
        name: 'milk',
        price: 'Rs 20.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeo8cx4PeaSx-KwqvpTrC3qWLcF0lQp6khVA&usqp=CAU'),
    Fruit(
        name: 'neem liquid',
        price: 'Rs 50.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdwlsKFlyErWt73QO-NbcniX6A89QuZJ8LXg&usqp=CAU'),
    Fruit(
        name: 'glysarin liquid',
        price: 'Rs 50.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3Eu23WRjdyvtHDKDIYwdmYAFKZ4KzFxNj0Q&usqp=CAU'),
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


