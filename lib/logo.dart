import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('VOG'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Text
             
              // Symbol
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 60, 0), // Customize background color
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'VOG',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Customize text color
                    ),
                  ),
                ),
              ),
               Text(
                'V Organics',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Customize color as needed
                ),
              ),
              SizedBox(height: 10.0), // Spacer

            ],
          ),
        ),
      ),
    );
  }
}
