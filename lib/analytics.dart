import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: AnalyticsWidget(),
    ),
  ));
}

class AnalyticsWidget extends StatelessWidget {
  final List<BarChartGroupData> barChartData = [
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(y: 3, colors: [Colors.blue]),
      BarChartRodData(y: 4, colors: [const Color.fromARGB(255, 6, 52, 89)]),
      BarChartRodData(y: 5, colors: [Color.fromARGB(255, 195, 224, 247)]),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(y: 3, colors: [Colors.blue]),
      BarChartRodData(y: 7, colors: [const Color.fromARGB(255, 6, 52, 89)]),
      BarChartRodData(y: 2, colors: [Color.fromARGB(255, 195, 224, 247)]),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(y: 9, colors: [Colors.blue]),
      BarChartRodData(y: 4, colors: [const Color.fromARGB(255, 6, 52, 89)]),
      BarChartRodData(y: 3, colors: [Color.fromARGB(255, 195, 224, 247)]),
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(y: 3, colors: [Colors.blue]),
      BarChartRodData(y: 4, colors: [Color.fromARGB(255, 13, 13, 13)]),
      BarChartRodData(y: 5, colors: [Color.fromARGB(255, 195, 224, 247)]),
    ]),
    // ... (other data points)
  ];

  final List<String> menuItems = ['Week', 'Month', 'Year', 'All'];
  final List<String> legendLabels = ['Legend 1', 'Legend 2', 'Legend 3'];

  AnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1 - Title
          Row(
            children: const [
              Text('Analytics',
                  style: TextStyle(
                      fontFamily: 'ReadexPro', fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          // Row 2 - Horizontal Menu Bar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: menuItems
                  .map((label) =>
                      _menuBarItem(label, menuItems.indexOf(label) == 0))
                  .toList(),
            ),
          ),
          SizedBox(height: 20),
          // Row 3 - Bar Chart
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: barChartData,
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(showTitles: true),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: false,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Row 4 - Legends
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: legendLabels
                  .map((label) => _legendItem(_randomColor(), label))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuBarItem(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFEEF2FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: TextStyle(
            fontFamily: 'ReadexPro',
            color: isSelected ? Color(0xFF6366F1) : Colors.black),
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label,
                style: TextStyle(
                    fontFamily: 'ReadexPro',
                    fontSize: 10,
                    fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }

  Color _randomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
