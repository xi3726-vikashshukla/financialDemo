import 'package:flutter/material.dart';

class LatestTransactionItem {
  final bool isChecked;
  final String relation;
  final String userName;
  final String cardNumber;
  final double amount;
  final String date;

  LatestTransactionItem({
    required this.isChecked,
    required this.relation,
    required this.userName,
    required this.cardNumber,
    required this.amount,
    required this.date,
  });
}

class LatestTransactionList extends StatelessWidget {
  final List<LatestTransactionItem> latestTransactionItems;

  const LatestTransactionList(
      {super.key, required this.latestTransactionItems});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTitle(screenWidth),
          SizedBox(height: 5),
          buildTransactionListView(screenWidth),
        ],
      ),
    );
  }

  Widget buildTitle(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        'Latest Transactions',
        style: TextStyle(
          fontFamily: 'ReadexPro',
          fontWeight: FontWeight.bold,
          fontSize: screenWidth < 600 ? 14 : 18,
        ),
      ),
    );
  }

  Widget buildTransactionListView(double screenWidth) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // Change scroll direction to vertical
      child: Container(
        width: calculateListWidth(latestTransactionItems, screenWidth),
        child: Column(
          // Use a Column to stack list items vertically
          children: latestTransactionItems.map((item) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: buildIncomeItem(item, screenWidth),
            );
          }).toList(),
        ),
      ),
    );
  }

  double calculateListWidth(
      List<LatestTransactionItem> items, double screenWidth) {
    // Calculate the total width required for all items
    double totalWidth = 0;
    for (LatestTransactionItem item in items) {
      // Calculate the width required for each item and add spacing
      totalWidth +=
          calculateItemWidth(item, screenWidth) + 10; // Add 10 for spacing
    }
    return totalWidth;
  }

  double calculateItemWidth(LatestTransactionItem item, double screenWidth) {
    // Calculate the width required for each item based on its content
    return 2 * 5 + // Checkbox and margin
        screenWidth * 0.05 * 2 + // Circular images
        (screenWidth < 600 ? 10 : 12) * 2 + // Relation and User Name
        screenWidth * 0.05 + // Circular image for card picture
        (screenWidth < 600 ? 8 : 12) * 16 + // Card number
        12 + // Amount
        (screenWidth < 600 ? 10 : 12) * 2 + // Button
        (screenWidth < 600 ? 10 : 12) * 2; // Date
  }

  Widget buildIncomeItem(LatestTransactionItem item, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //buildCheckbox(item.isChecked),
        buildCircularImage(screenWidth),
        buildRelationAndUserName(item, screenWidth),
        buildCircularCardImage(screenWidth),
        buildCardNumber(item.cardNumber),
        buildAmount(item.amount),
        buildSuccessButton(),
        buildDate(item.date),
      ],
    );
  }

  Widget buildCheckbox(bool isChecked) {
    return Checkbox(
      value: isChecked,
      onChanged: (newValue) {
        // Handle checkbox state change
      },
    );
  }

  Widget buildCircularCardImage(double screenWidth) {
    return Container(
      width: screenWidth * 0.02,
      height: screenWidth * 0.02,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/images/creditcard1.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCircularImage(double screenWidth) {
    return Container(
      width: screenWidth * 0.02,
      height: screenWidth * 0.02,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person, 
        size: 25.0, 
        color: Colors.white, 
      ),
    );
  }

  Widget buildRelationAndUserName(
      LatestTransactionItem item, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Relation',
          style: TextStyle(
            fontFamily: 'ReadexPro',
            color: Colors.grey,
            fontSize: screenWidth < 600 ? 8 : 10,
          ),
        ),
        Text(
          item.userName,
          style: TextStyle(
            fontFamily: 'ReadexPro',
            color: Colors.black,
            fontSize: screenWidth < 600 ? 10 : 12,
          ),
        ),
      ],
    );
  }

  Widget buildCardNumber(String cardNumber) {
    return Text(
      '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}',
      style: TextStyle(fontFamily: 'ReadexPro', fontSize: 12),
    );
  }

  Widget buildAmount(double amount) {
    return Text('\$${amount.toStringAsFixed(2)}',
        style: TextStyle(fontFamily: 'ReadexPro', fontSize: 12));
  }

  Widget buildSuccessButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Row(
        children: const [
          Icon(Icons.check, color: Colors.green),
          SizedBox(width: 4),
          Text(
            'Success',
            style: TextStyle(
              fontFamily: 'ReadexPro',
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDate(String date) {
    return Text(
      date,
      style: TextStyle(
        fontFamily: 'ReadexPro',
        fontSize: 12,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: LatestTransactionList(
        latestTransactionItems: generateLatestTransactionListData(),
      ),
    ),
  ));
}

List<LatestTransactionItem> generateLatestTransactionListData() {
  return [
    LatestTransactionItem(
      isChecked: false,
      relation: 'Friend',
      userName: 'John Doe',
      cardNumber: '1234567890123456',
      amount: 1443.0,
      date: 'Aug 25, 23',
    ),
    LatestTransactionItem(
      isChecked: false,
      relation: 'Friend',
      userName: 'John Doe',
      cardNumber: '1234567890123456',
      amount: 1443.0,
      date: 'Aug 25, 23',
    ),
    LatestTransactionItem(
      isChecked: false,
      relation: 'Friend',
      userName: 'John Doe',
      cardNumber: '1234567890123456',
      amount: 1443.0,
      date: 'Aug 25, 23',
    ),
    LatestTransactionItem(
      isChecked: false,
      relation: 'Friend',
      userName: 'John Doe',
      cardNumber: '1234567890123456',
      amount: 1443.0,
      date: 'Aug 25, 23',
    ),
  ];
}
