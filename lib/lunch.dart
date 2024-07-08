import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mylunch extends StatelessWidget {
  const Mylunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lunch',
          style: GoogleFonts.lobster(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SpiceList(),
    );
  }
}

class SpiceList extends StatelessWidget {
  final List<Spice> spices = [
    Spice(
      name: 'full meals',
      price: 'Rs 115.00',
      imageUrl: 'https://thepepper.in/wp-content/uploads/2019/02/South-Meals.jpg',
    ),
    Spice(
      name: 'half meals',
      price: 'Rs 65.00',
      imageUrl: 'https://thepepper.in/wp-content/uploads/2019/02/South-Meals.jpg',
    ),
    Spice(
      name: 'fried rice',
      price: 'Rs 120.00',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh6dSBa7oQ6aEFHQlIQPd-zm6GQ0V4YndOBQ&usqp=CAU',
    ),
    Spice(
      name: 'biryani',
      price: 'Rs 120.00',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh6dSBa7oQ6aEFHQlIQPd-zm6GQ0V4YndOBQ&usqp=CAU',
    ),
    Spice(
      name: 'curd rice',
      price: 'Rs 100.00',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy-F0UYkrrzI64jS4KuCJDmbD5Ts0Nl7mv4A&usqp=CAU',
    ),
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spices.length,
      itemBuilder: (context, index) {
        return SpiceTile(spice: spices[index]);
      },
    );
  }
}

class Spice {
  final String name;
  final String price;
  final String imageUrl;
  bool isFavorite;
  int count;

  Spice({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.count = 0,
  });
}

class SpiceTile extends StatefulWidget {
  final Spice spice;

  SpiceTile({required this.spice, Key? key}) : super(key: key);

  @override
  _SpiceTileState createState() => _SpiceTileState();
}

class _SpiceTileState extends State<SpiceTile> {
  void _toggleFavorite() {
    setState(() {
      widget.spice.isFavorite = !widget.spice.isFavorite;
    });
  }

  void _incrementCount() {
    setState(() {
      widget.spice.count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (widget.spice.count > 0) {
        widget.spice.count--;
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
              widget.spice.imageUrl,
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
                  widget.spice.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.spice.price,
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    _buildCounterButton(Icons.remove, _decrementCount),
                    SizedBox(width: 8),
                    Text(
                      '${widget.spice.count}',
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
                  widget.spice.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.spice.isFavorite ? Colors.red : null,
                ),
                onPressed: _toggleFavorite,
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${widget.spice.name} added to cart')),
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