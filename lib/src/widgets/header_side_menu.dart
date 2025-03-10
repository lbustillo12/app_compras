import 'package:flutter/material.dart';

class HeaderSideMenu extends StatelessWidget {
  const HeaderSideMenu({super.key, required this.title, required this.email});

  final String title;
  final String email;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromARGB(255, 135, 88, 216),
            child: Text(
              title[0],
              style: TextStyle(fontSize: 30, color: Colors.teal[50]),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 135, 88, 216),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
