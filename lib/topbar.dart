// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu Bar
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  menuItems.length,
                  (index) => MenuItem(
                    text: menuItems[index],
                    isSelected: index == selectedIndex, 
                    onTap: () {
                      setState(() {
                        selectedIndex = index; 
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          Row(
  children: [
    Icon(Icons.notifications),
    SizedBox(width: 10.0),
    Icon(Icons.apps),
    SizedBox(width: 8.0),
    Stack(
      alignment: Alignment.bottomRight, // Align the icon to the bottom right
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('assets/logo/app_logo.png'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 12.0,
          ),
        ),
      ],
    ),
  ],
),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuItem({super.key, 
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        color: isSelected ? Colors.blue : Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontFamily: 'ReadexPro',
            fontSize: 14.0,
            color: isSelected ? Colors.white : Colors.black, 
          ),
        ),
      ),
    );
  }
}

final List<String> menuItems = [
  'Bank',
  'Insurance',
  'Cash Desk',
  'Business',
  'Accounting',
];
