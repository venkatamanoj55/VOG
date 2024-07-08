import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mypulses extends StatelessWidget {
  const Mypulses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pulses',
          style: GoogleFonts.lobster(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: PulseList(),
    );
  }
}

class PulseList extends StatelessWidget {
  final List<Pulse> pulses = [
    Pulse(
        name: 'Kandi Pappu',
        price: 'Rs 15.00',
        imageUrl: 'https://www.healthyorganic.in/cdn/shop/products/organic-toor-dal-500x500_837491a8-755b-4548-b082-42c110c406aa_grande.jpg?v=1552055341'),
    Pulse(
        name: 'Pesara Pappu',
        price: 'Rs 20.00',
        imageUrl: 'https://totalfoods.in/static/uploads/product_image/Moong_Dal_Dals_and_Pulses_48572367.jpg'),
    Pulse(
        name: 'Pachisenaga Pappu',
        price: 'Rs 50.00',
        imageUrl: 'https://intintiki.com/images/products/1f4d944cece15b33cb562ddf21953250.jpg'),
    Pulse(
        name: 'Minapagullu',
        price: 'Rs 10.00',
        imageUrl: 'https://images.heybandi.com/uploads/product/urad-dal-whole__03-1606912919727.jpg'),
    Pulse(
        name: 'Idly Rava',
        price: 'Rs 20.00',
        imageUrl: 'https://m.media-amazon.com/images/I/41qZYBmxR8L._AC_UF1000,1000_QL80_.jpg'),
    Pulse(
        name: 'Pesalu',
        price: 'Rs 50.00',
        imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2023/5/309558838/OP/MP/QN/183288793/pesalu.webp'),
    Pulse(
        name: 'Atta',
        price: 'Rs 50.00',
        imageUrl: 'https://5.imimg.com/data5/ANDROID/Default/2021/3/VU/ES/ZU/8849152/product-jpeg-500x500.jpg'),
    Pulse(
        name: 'Attukulu',
        price: 'Rs 45.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwU5x63sS4zRcIHM2UfZaCe0bNy1C0-Ojn5A&s'),
    Pulse(
        name: 'Chinthapandu',
        price: 'Rs 45.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFM-3pdwhqqEvwg0kTP5yGevLUBMSRE98htA&s'),
    Pulse(
        name: 'Red Kandi Pappu',
        price: 'Rs 45.00',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8C2L17_UlgbjGpJGNoFvZVGJAVnnXIrg_sg&s'),
    Pulse(
        name: 'Bobbarlu',
        price: 'Rs 50.00',
        imageUrl: 'https://cdnaz.plotch.io/image/upload/w_551/C/V/PLOpcw6EJX1713008189_0a6b4c4b9d189aa04838119c629d1bd8420ee10a85ba7aea9e6ddaa87e170a20.jpg?product_id=1126864490&s=1'),
    Pulse(
        name: 'Red Senagalu',
        price: 'Rs 50.00',
        imageUrl: 'https://dukaan.b-cdn.net/700x700/webp/584209/a0a36e7d-ae7b-40fe-880e-4309e5bd75f2.png'),
    Pulse(
        name: 'Senagalu',
        price: 'Rs 50.00',
        imageUrl: 'https://lh5.googleusercontent.com/proxy/CQTXocRxiLbFYbD8vyzwrumOmL3SAM4Fw7f9RkAQ_ANJaZz9M5tt50DrXZDvlIx1xWdOaddybQk7KOui-FNEt6kNUxNh8wZZ2S-uNBlAV6IhqU6naNbReRde7B8VxZJ2RkTyPt07dgc-U63nvM1Jci8WRhSWrg'),
    Pulse(
        name: 'Green Peas',
        price: 'Rs 50.00',
        imageUrl: 'https://exoticvegetablespune.com/wp-content/uploads/2020/11/Frozen-Green-Peas-removebg-preview.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pulses.length,
      itemBuilder: (context, index) {
        return PulseTile(pulse: pulses[index]);
      },
    );
  }
}

class Pulse {
  final String name;
  final String price;
  final String imageUrl;
  bool isFavorite;
  int count;

  Pulse({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.count = 0,
  });
}

class PulseTile extends StatefulWidget {
  final Pulse pulse;

  PulseTile({required this.pulse, Key? key}) : super(key: key);

  @override
  _PulseTileState createState() => _PulseTileState();
}

class _PulseTileState extends State<PulseTile> {
  void _toggleFavorite() {
    setState(() {
      widget.pulse.isFavorite = !widget.pulse.isFavorite;
    });
  }

  void _incrementCount() {
    setState(() {
      widget.pulse.count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (widget.pulse.count > 0) {
        widget.pulse.count--;
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
              widget.pulse.imageUrl,
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
                  widget.pulse.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.pulse.price,
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    _buildCounterButton(Icons.remove, _decrementCount),
                    SizedBox(width: 8),
                    Text(
                      '${widget.pulse.count}',
                      style: TextStyle(
                        fontSize: 18,
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
                  widget.pulse.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.pulse.isFavorite ? Colors.red : null,
                ),
                onPressed: _toggleFavorite,
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${widget.pulse.name} added to cart')),
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