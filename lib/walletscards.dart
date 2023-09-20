import 'package:flutter/material.dart';

class WalletCard {
  final String cardName;
  final double cardBalance;
  final String cardImage;

  WalletCard({
    required this.cardName,
    required this.cardBalance,
    required this.cardImage,
  });
}

class WalletCardWidget extends StatelessWidget {
  final WalletCard card;

  const WalletCardWidget({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          color: Colors.white,
          child: Row(
            children: [
              // Column 1 - Icon
              Column(
                children: [
  Padding(
    padding: EdgeInsets.all(5),
    child: Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.blue, // You can change the color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        'assets/images/creditcard1.png', // Replace with the actual path to your image
        width: 20, // Adjust the width and height as needed
        height: 20,
      ),
    ),
  ),
]
,
              ),
              // Column 2 - Card name and balance
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.cardName,
                      style: TextStyle(
    fontFamily: 'ReadexPro',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${card.cardBalance.toStringAsFixed(2)}',
                      style: TextStyle(
    fontFamily: 'ReadexPro',
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Column 3 - Image of card
              Icon(Icons.credit_card),
            ],
          ),
        ),
      ],
    );
  }
}

class WalletsAndCardsWidget extends StatelessWidget {
  final List<WalletCard> cardsList;

  const WalletsAndCardsWidget({Key? key, required this.cardsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Row 1 - Wallets and Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Wallets and Cards',
                    style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text('Hide balance',style: TextStyle(
    fontFamily: 'ReadexPro',fontSize: 12, fontWeight: FontWeight.normal),),
                ],
              ),
              SizedBox(height: 5),
              // Row 2 - List of Items (scrollable)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: cardsList.length,
                  itemBuilder: (context, index) {
                    return WalletCardWidget(card: cardsList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: WalletsAndCardsWidget(
        cardsList: [
          WalletCard(
            cardName: 'Card 1',
            cardBalance: 1000.0,
            cardImage:
                '', // Replace with your image path
          ),
          WalletCard(
            cardName: 'Card 2',
            cardBalance: 2500.5,
            cardImage:
                '', // Replace with your image path
          ),
          WalletCard(
            cardName: 'Card 3',
            cardBalance: 350.75,
            cardImage:
                '', // Replace with your image path
          ),
          WalletCard(
            cardName: 'Card 4',
            cardBalance: 500.2,
            cardImage:
                '', // Replace with your image path
          ),
          WalletCard(
            cardName: 'Card 5',
            cardBalance: 1200.0,
            cardImage:
                '', // Replace with your image path
          ),
        ],
      ),
    ),
  ));
}
