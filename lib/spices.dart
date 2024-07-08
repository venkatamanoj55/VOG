import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myspices extends StatelessWidget {
  const Myspices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spices',
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
      name: 'Kumkum',
      price: 'Rs 15.00',
      imageUrl: 'https://www.pujasthan.com/wp-content/uploads/2022/11/Organic-Pooja-Kumkum-Powder.jpg.webp',
    ),
    Spice(
      name: 'Turmeric powder',
      price: 'Rs 20.00',
      imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2023/7/322144231/HY/VX/KT/42218902/organic-turmeric-powder.jpeg',
    ),
    Spice(
      name: 'Lavang',
      price: 'Rs 50.00',
      imageUrl: 'https://m.media-amazon.com/images/I/51q7tTGFEzL._AC_.jpg',
    ),
    Spice(
      name: 'Elachi',
      price: 'Rs 10.00',
      imageUrl: 'https://m.media-amazon.com/images/I/51mBsFX3OzL._AC_UF894,1000_QL80_.jpg',
    ),
    Spice(
      name: 'Pepper',
      price: 'Rs 20.00',
      imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2021/2/ZL/CG/KW/25937689/black-pepper.jpg',
    ),
    Spice(
      name: 'Chekka',
      price: 'Rs 50.00',
      imageUrl: 'https://m.media-amazon.com/images/I/418pMQ9p2wL._AC_UF1000,1000_QL80_.jpg',
    ),
    Spice(
      name: 'Dhania',
      price: 'Rs 50.00',
      imageUrl: 'https://www.poshtik.in/cdn/shop/products/Poshtik_Dhania_3a8dea0f-ab0f-489f-bd9e-964c9380da05.jpg?v=1565272325',
    ),
    Spice(
      name: 'Ginger',
      price: 'Rs 45.00',
      imageUrl: 'https://www.eatingwell.com/thmb/3kciNkbDMbne5_idW3zspqsXf7U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gigner-peeling-hack-396e818a5c774258a7688a679f4436e3.jpg',
    ),
    Spice(
      name: 'Dry chilli',
      price: 'Rs 45.00',
      imageUrl: 'https://t4.ftcdn.net/jpg/01/81/89/57/360_F_181895708_TBjyYljnfHiWfcdzk1kafqCNWnqcmd26.jpg',
    ),
    Spice(
      name: 'Chilli powder',
      price: 'Rs 45.00',
      imageUrl: 'https://www.shutterstock.com/image-photo/top-view-red-chilly-powder-600nw-2113542206.jpg',
    ),
    Spice(
      name: 'Star lavang',
      price: 'Rs 50.00',
      imageUrl: 'https://m.media-amazon.com/images/I/91yoiIwsTKL._AC_UF1000,1000_QL80_.jpg',
    ),
    Spice(
      name: 'Biriyani leaf',
      price: 'Rs 50.00',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2DTGZB3hNjt22rmaDHGIl0hhfP7ZbeXa7Kg&s',
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