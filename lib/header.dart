import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 150.0, // Adjust this value as needed for the first row's height
            width: double.infinity,
            color: Colors.blue, // Change the color as per your design
            child: Center(
              child: Text(
                'Row 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned.fill(
            top: 150.0, // Adjust this value as needed for the circular image positioning
            child: Container(
              color: Colors.green, // Change the color as per your design
              child: Center(
                child: Text(
                  'Row 2',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100.0, // Adjust this value as needed for proper centering
            left: 0,
            right: 0,
            child: Container(
              height: 100.0, // Adjust this value as needed for the circle size
              width: 100.0, // Adjust this value as needed for the circle size
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Change the color as per your design
              ),
              child: Center(
                child: Icon(
                  Icons.person, // You can replace this with your circular image
                  size: 60.0, // Adjust the icon size as needed
                  color: Colors.white, // Change the color as per your design
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
