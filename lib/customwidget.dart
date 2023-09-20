import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 1,
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      color: Color(0xFF334155),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        title: Row(
          children: [
            Text(
              '•••• 9417',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w500,
                height: 0.13,
                letterSpacing: 0.50,
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE80B26),
                    shape: CircleBorder(),
                  ),
                ),
                Positioned(
                  left: 9.75,
                  top: 5.25,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF59D31),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.person, // You can choose any icon you prefer
      color: Colors.blue, // Change the color as needed
      size: 48, // Adjust the size as needed
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Custom Icon Example'),
      ),
      body: Center(
        child: CustomIcon(),
      ),
    ),
  ));
}
