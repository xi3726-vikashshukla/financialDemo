import 'package:flutter/material.dart';
import 'home.dart';
import 'notifications.dart';
import 'profile.dart';

class HistoryScreen extends StatefulWidget {
  final int currentIndex;

  const HistoryScreen({super.key, required this.currentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<HistoryItemModel> _historyItems = _getHistoryItems(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Order History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.currentIndex);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            VerticalHistoryList(historyItems: _historyItems),
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(currentIndex: index),
              ),
            );
          } else if (index == 2) {
            //History
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: const [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalHistoryList extends StatelessWidget {
  final List<HistoryItemModel> historyItems;

  const VerticalHistoryList({super.key, required this.historyItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: historyItems.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Image.asset(historyItems[index].productImage,height: 100,
    width: 100),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          SizedBox(height: 8),
                          Text(historyItems[index].restaurantName),
                          Text(historyItems[index].address),
                          Text(historyItems[index].openingTime),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          ElevatedButton(
              onPressed: null,
              child: Text(historyItems[index].deliveryStatus),
            ),
                          
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Row(
                              children: [
                                Text(historyItems[index].viewMenu),
                                Icon(Icons.arrow_circle_down),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    
                    Text(historyItems[index].orderedItems),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(historyItems[index].orderDateTime),
                    Text('\$${historyItems[index].totalCost.toStringAsFixed(2)}'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('Rate'),
                    SizedBox(width: 8),
                    Row(
                      children: List.generate(
                        5,
                        (starIndex) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HistoryItemModel {
  final String productImage;
  final String restaurantName;
  final String address;
  final String openingTime;
  final String deliveryStatus;
  final String viewMenu;
  final String orderedItems;
  final String orderDateTime;
  final double totalCost;

  HistoryItemModel({
    required this.productImage,
    required this.restaurantName,
    required this.address,
    required this.openingTime,
    required this.deliveryStatus,
    required this.viewMenu,
    required this.orderedItems,
    required this.orderDateTime,
    required this.totalCost,
  });
}

List<HistoryItemModel> _getHistoryItems() {
  return [
    HistoryItemModel(
      productImage: 'images/mountain_view.png',
      restaurantName: 'Restaurant A',
      address: '123 Main St, City',
      openingTime: '10:00 AM - 10:00 PM',
      deliveryStatus: 'Delivered',
      viewMenu: 'View Menu',
      orderedItems: '1 x Item A, 2 x Item B',
      orderDateTime: '1 Aug 2023, 08:30 PM',
      totalCost: 45.0,
    ),
    HistoryItemModel(
      productImage: 'logo/app_logo.png',
      restaurantName: 'Restaurant B',
      address: '456 Park Ave, Town',
      openingTime: '09:00 AM - 09:00 PM',
      deliveryStatus: 'Not Delivered',
      viewMenu: 'View Menu',
      orderedItems: '3 x Item C',
      orderDateTime: '2 Aug 2023, 12:15 PM',
      totalCost: 30.0,
    ),
    HistoryItemModel(
      productImage: 'images/mountain_view.png',
      restaurantName: 'Restaurant C',
      address: '789 Center Rd, Village',
      openingTime: '11:00 AM - 08:00 PM',
      deliveryStatus: 'Delivered',
      viewMenu: 'View Menu',
      orderedItems: '1 x Item D, 1 x Item E',
      orderDateTime: '9 Aug 2023, 06:45 PM',
      totalCost: 15.0,
    ),
    HistoryItemModel(
      productImage: 'images/mountain_view.png',
      restaurantName: 'Restaurant D',
      address: '101 River St, Suburb',
      openingTime: '08:00 AM - 11:00 PM',
      deliveryStatus: 'Cancelled',
      viewMenu: 'View Menu',
      orderedItems: '2 x Item F',
      orderDateTime: '8 Aug 2023, 09:30 AM',
      totalCost: 20.0,
    ),
    HistoryItemModel(
      productImage: 'images/mountain_view.png',
      restaurantName: 'Restaurant E',
      address: '222 Lake Dr, Countryside',
      openingTime: '07:00 AM - 07:00 PM',
      deliveryStatus: 'Delivered',
      viewMenu: 'View Menu',
      orderedItems: '1 x Item G, 1 x Item H, 3 x Item I',
      orderDateTime: '7 Aug 2023, 03:20 PM',
      totalCost: 60.0,
    ),
  ];
}
