import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.orange, // Customize background color
        title: Text('My profile', style: GoogleFonts.lobster(
          fontSize: 30,
          
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtt5E9SGRv7HC3eS-r4c08Iv88YVgC4iE2rA&s'), 
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('Abhi Ram'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('abhidas@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone number'),
              subtitle: Text('(+91)9573261872'),
            ),
          ],
        ),
      ),
    );
  }
}