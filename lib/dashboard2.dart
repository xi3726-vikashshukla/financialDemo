import 'package:flutter/material.dart';
import 'package:ecomflutter/topbar.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial App'),
      ),
      body: Row(
        children: [
          // Left Side Navigation Bar
          Container(
            width: MediaQuery.of(context).size.width < 768 ? 250 : 80,
            // Adjust the width as needed for small screens
            child: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Home'),
                    onTap: () {
                      // Handle navigation to the Home screen
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                  ListTile(
                    title: Text('Accounts'),
                    onTap: () {
                      // Handle navigation to the Accounts screen
                      Navigator.of(context).pushReplacementNamed('/accounts');
                    },
                  ),
                  // Add more navigation items
                ],
              ),
            ),
          ),

          // Body with 7 Rows
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Row 1
                  TopBar(),
                  // Financial Rows
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7, // Adjust the number of rows as needed
                    itemBuilder: (context, index) {
                      return FinancialRowWidget(); // Customize the row's content here
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FinancialRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      // Customize the row's content here
      child: Row(
        children: [
          // Add widgets for each column in the row
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/financial', // Set the initial route
    routes: {
      '/financial': (context) => FinancialPage(),
      '/home': (context) => HomePage(), // Define your Home screen
      '/accounts': (context) => AccountsPage(), // Define your Accounts screen
    },
  ));
}
