import 'dart:math';
import 'package:flutter/material.dart';

class OutcomeStatisticsItem {
  final String title;
  final double amount;
  final Color progressBarColor;
  final Icon icon;

  OutcomeStatisticsItem({
    required this.title,
    required this.amount,
    required this.progressBarColor,
    required this.icon,
  });
}

class OutcomeStatisticsWidget extends StatelessWidget {
  final List<OutcomeStatisticsItem> statisticsList;

  const OutcomeStatisticsWidget({super.key, required this.statisticsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
        padding: const EdgeInsets.all(5.0),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row 1 - Outcome Statistics
            Row(
              children: const [
                Text(
                  'Outcome Statistics',
                  style: TextStyle(
                      fontFamily: 'ReadexPro',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row 2 - List of Items (scrollable)
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: statisticsList.length,
                itemBuilder: (context, index) {
                  final item = statisticsList[index];
                  final randomProgress =
                      Random().nextInt(100); // Random progress value
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            // Row 1 - Icon and Title
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: item.progressBarColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: item.icon,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontFamily: 'ReadexPro',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Row 2 - Progress Bar (rounded)
                            SizedBox(
  height: 15, // Set the desired height
  child: ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: LinearProgressIndicator(
      value: randomProgress / 100,
      backgroundColor: item.progressBarColor.withOpacity(0.2),
      valueColor: AlwaysStoppedAnimation<Color>(item.progressBarColor),
    ),
  ),
)
,
                            SizedBox(height: 10),
                            // Row 3 - Amount and Percentage
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${item.amount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontFamily: 'ReadexPro',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  '$randomProgress%',
                                  style: TextStyle(
                                      fontFamily: 'ReadexPro',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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
      body: OutcomeStatisticsWidget(
        statisticsList: [
          OutcomeStatisticsItem(
            icon: Icon(Icons.airplane_ticket),
            title: 'Travel',
            amount: 612.23,
            progressBarColor: Colors.blue,
          ),
          OutcomeStatisticsItem(
            icon: Icon(Icons.food_bank),
            title: 'Food',
            amount: 125.50,
            progressBarColor: Colors.green,
          ),
          OutcomeStatisticsItem(
            icon: Icon(Icons.shopping_bag),
            title: 'Shopping',
            amount: 300.75,
            progressBarColor: Colors.orange,
          ),
          OutcomeStatisticsItem(
            icon: Icon(Icons.electric_bolt),
            title: 'Utilities',
            amount: 75.00,
            progressBarColor: Colors.purple,
          ),
          OutcomeStatisticsItem(
            icon: Icon(Icons.movie),
            title: 'Entertainment',
            amount: 150.00,
            progressBarColor: Colors.red,
          ),
        ],
      ),
    ),
  ));
}
