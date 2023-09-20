import 'package:flutter/material.dart';
import 'history.dart';
import 'home.dart';
import 'notifications.dart';

class ProfileScreen extends StatefulWidget {
  final int currentIndex;

  const ProfileScreen({super.key, required this.currentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.currentIndex);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('logo/app_logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: 'John Doe',
                  ),
                  SizedBox(height: 16.0),
                  Text('Mobile',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: '+91234567890', 
                  ),
                  SizedBox(height: 16.0),
                  Text('Email',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: 'johndoe@example.com', 
                  ),
                  SizedBox(height: 16.0),
                  Text('DOB',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: '01/01/1990', 
                  ),
                  SizedBox(height: 16.0),
                  Text('Anniversary',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: '05/15/2015', 
                  ),
                  SizedBox(height: 16.0),
                  Text('Gender',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: 'Male', 
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Need to Update profile logic
                    },
                    child: Text('Update Profile',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: 1, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); 
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen(currentIndex: index)),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen(currentIndex: index)),
            );
          }
        },
      ),
    );
  }
}
