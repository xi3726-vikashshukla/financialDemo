import 'package:flutter/material.dart';

class LatestTransactionWidget extends StatelessWidget {
  final List<TransactionItem> transactions;

  const LatestTransactionWidget({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row 1 - Title
            Text(
              'Latest Transaction',
              style: TextStyle(
    fontFamily: 'ReadexPro',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Row 2 - List of Items
            Column(
              children: transactions
                  .map((item) {
                    return buildTransactionColumn(item);
                  })
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionColumn(TransactionItem item) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // for (int i = 0; i < 7; i++) ...[
            //   if (i > 0) SizedBox(width: 10), // Add spacing between columns
            //   buildColumnItem(i, item),
            // ],
            _buildCircularImage(),
            _buildCardName(item.cardName),
            _buildButton(),
            buildCircularCardImage(),
            _buildCardNumber(item.last4Digits),
            _buildAmount(item.amount),
            _buildDate(item.date),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularImage() {
    return Container(
      width: 30,
      height: 30,
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

  Widget buildCircularCardImage() {
    return Container(
      width: 20,
      height: 20,
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

  Widget _buildCardName(String cardName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cardName,
            style: TextStyle(
    fontFamily: 'ReadexPro',
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(height: 5),
        // Add any additional widgets for Column 2 here
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Icon(Icons.check, color: Colors.green),
            SizedBox(width: 4),
            Text('Success', style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 12, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildCardNumber(String last4Digits) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '**** **** **** $last4Digits',
        style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 12),
      ),
    );
  }

  Widget _buildAmount(double amount) {
    return Text('\$$amount');
  }

  Widget _buildDate(String date) {
    return Text(
      date,
      style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 12),
    );
  }
}

class TransactionItem {
  final String cardName;
  final String last4Digits;
  final double amount;
  final String date;

  TransactionItem({
    required this.cardName,
    required this.last4Digits,
    required this.amount,
    required this.date,
  });
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: LatestTransactionWidget(
        transactions: generateLatestTransactionData(),
      ),
    ),
  ));
}

// Function to generate dummy transaction data
List<TransactionItem> generateLatestTransactionData() {
  return [
    TransactionItem(
      cardName: 'Card 1',
      last4Digits: '1234',
      amount: 1443.0,
      date: 'Aug 25, 23',
    ),
    TransactionItem(
      cardName: 'Card 2',
      last4Digits: '5678',
      amount: 100.5,
      date: 'Aug 24, 23',
    ),
    TransactionItem(
      cardName: 'Card 3',
      last4Digits: '9876',
      amount: 500.75,
      date: 'Aug 23, 23',
    ),
    TransactionItem(
      cardName: 'Card 4',
      last4Digits: '4321',
      amount: 300.2,
      date: 'Aug 22, 23',
    ),
    TransactionItem(
      cardName: 'Card 5',
      last4Digits: '8765',
      amount: 750.0,
      date: 'Aug 21, 23',
    ),
  ];
}
