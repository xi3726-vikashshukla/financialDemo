import 'package:flutter/material.dart';
import 'profile.dart';
import 'history.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            SearchBar(),
            Text('Recommendations as per your taste buds.',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20)),
            HorizontalScrollList(
              items: _getHardCodedItems(),
            ),
            Text('Lets find something special for you.',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20)),
            VerticalScrollList(
              items: _getHardCodedItems(),
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
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen(currentIndex: index)),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen(currentIndex: index)),
            );
          }else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Satisfy your hunger with irresistible choices.',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20)),
          Row(
            children: [
              Text(''),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => CartBottomSheet(),
                  );
                },
              ),
            ],
          ),
        ],
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
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollList extends StatelessWidget {
  final List<CartItemModel> items;

  const HorizontalScrollList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/food_1.png'),
                SizedBox(height: 8),
                Text(items[index].productName,style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${items[index].price.toStringAsFixed(2)}'),
                Text('Rating: ${items[index].rating}',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class VerticalScrollList extends StatelessWidget {
  final List<CartItemModel> items;

  const VerticalScrollList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/food_2.png'),
                SizedBox(height: 6),
                Text(items[index].productName),
                Text('\$${items[index].price.toStringAsFixed(2)}'),
                Text('Rating: ${items[index].rating}',style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text('Kaushalpuri, Ayodhya'),
              TextButton(
                onPressed: () {
                  // Open address edit screen
                },
                child: Text('Edit Address'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            children: const [
              CartItem(
                productName: 'Product 1',
                quantity: 2,
                totalPrice: 100.0,
              ),
              CartItem(
                productName: 'Product 2',
                quantity: 1,
                totalPrice: 50.0,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Total Price:'),
              Text('\$150.0'),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String productName;
  final int quantity;
  final double totalPrice;

  const CartItem({super.key, 
    required this.productName,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$productName ($quantity)'),
          Text('\$$totalPrice'),
        ],
      ),
    );
  }
}

class CartItemModel {
  final String productName;
  final double price;
  final double rating;

  CartItemModel({
    required this.productName,
    required this.price,
    required this.rating,
  });
}

List<CartItemModel> _getHardCodedItems() {
  return [
    CartItemModel(
      productName: 'Product A',
      price: 20.0,
      rating: 4.5,
    ),
    CartItemModel(
      productName: 'Product B',
      price: 15.0,
      rating: 5,
    ),
    CartItemModel(
      productName: 'Product C',
      price: 25.0,
      rating: 4.5,
    ),
    CartItemModel(
      productName: 'Product D',
      price: 10.0,
      rating: 3.8,
    ),
    CartItemModel(
      productName: 'Product E',
      price: 150.0,
      rating: 4.8,
    ),
    CartItemModel(
      productName: 'Product F',
      price: 5.0,
      rating: 5,
    ),
    CartItemModel(
      productName: 'Product G',
      price: 22.0,
      rating: 5,
    ),
    CartItemModel(
      productName: 'Product H',
      price: 34.0,
      rating: 5,
    ),
    CartItemModel(
      productName: 'Product I',
      price: 89.0,
      rating: 1.8,
    ),
    CartItemModel(
      productName: 'Product J',
      price: 90.0,
      rating: 3.5,
    ),
    CartItemModel(
      productName: 'Product K',
      price: 45.0,
      rating: 3,
    ),
    CartItemModel(
      productName: 'Product L',
      price: 23.0,
      rating: 4,
    ),
  ];
}
