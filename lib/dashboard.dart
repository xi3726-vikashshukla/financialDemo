import 'package:ecomflutter/analytics.dart';
import 'package:ecomflutter/outcomestatics.dart';
import 'package:ecomflutter/topbar.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/walletscards.dart';
import 'package:ecomflutter/cardbalancechart.dart';
import 'package:ecomflutter/information.dart';
import 'package:ecomflutter/income.dart';
import 'package:ecomflutter/latesttransactionsnew.dart';
//import 'package:ecomflutter/header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: LeftNavigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE0E7FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopBar(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: LeftColumn(),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        InformationWidget(),
                        AnalyticsWidget(),
                        IncomeList(incomeItems: generateIncomeData()),
                        LatestTransactionList(
                            latestTransactionItems:
                                generateLatestTransactionListData()),
                        // LatestTransactionWidget(
                        //   transactions: generateLatestTransactionData(),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      endDrawer: RightNavigationRail(),
    );
  }
}

class LeftColumn extends StatelessWidget {
  const LeftColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add the content for the left column here
        WalletsAndCardsWidget(
          cardsList: [
            WalletCard(
              cardName: 'Card 1',
              cardBalance: 1000.0,
              cardImage: 'images/flutter_logo.png',
            ),
            WalletCard(
              cardName: 'Card 2',
              cardBalance: 2500.5,
              cardImage: 'images/flutter_logo.png',
            ),
            WalletCard(
              cardName: 'Card 3',
              cardBalance: 350.75,
              cardImage: 'images/flutter_logo.png',
            ),
            WalletCard(
              cardName: 'Card 4',
              cardBalance: 500.2,
              cardImage: 'images/flutter_logo.png',
            ),
            WalletCard(
              cardName: 'Card 5',
              cardBalance: 1200.0,
              cardImage: 'images/flutter_logo.png',
            ),
          ],
        ),
        OutcomeStatisticsWidget(
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
        SizedBox(
          height: 250,
          child: CardBalanceChart(),
        ),
        // Add any additional widgets you need
      ],
    );
  }
}

class LeftNavigationDrawer extends StatelessWidget {
  const LeftNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          drawerHeader(),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            child: roundedButton(
              icon: Icon(Icons.add_home_work_outlined),
              label: 'New Transaction',
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Menu',
              style: TextStyle(
                  fontFamily: 'ReadexPro',
                  fontSize: 16,
                  color: Color(0xFF0F172A)),
            ),
          ),
          SizedBox(height: 10),
          activityRow(Icons.home_max_outlined, 'Home', ''),
          activityRow(Icons.dashboard_customize_outlined, 'Dashboard', '2'),
          activityRow(Icons.departure_board_outlined, 'Deposits', '12'),
          activityRow(Icons.credit_card_off_outlined, 'Credits', '15'),
          activityRow(Icons.help_center_outlined, 'Help Center', '10'),
          activityRow(Icons.photo_camera_front_outlined, 'Portfolio', '2'),
          activityRow(Icons.security_update_warning_outlined, 'Settings', '1'),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/app_logo.png'),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Admin Name',
                style: TextStyle(
                    fontFamily: 'ReadexPro',
                    fontSize: 16,
                    color: Color(0xFF0F172A)),
              ),
              Text(
                'Admin Designation',
                style: TextStyle(
                    fontFamily: 'ReadexPro',
                    fontSize: 12,
                    color: Color(0xFF475569)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedButton({Icon? icon, required String label}) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(width: 5), // Add some spacing between icon and text
            Text(label,
                style: TextStyle(
                  fontFamily: 'ReadexPro',
                  color: Colors.white,
                  fontSize: 14,
                )),
          ],
        ),
      ),
    );
  }

  Widget activityRow(IconData icon, String labelText, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        labelText,
        style: TextStyle(
            fontFamily: 'ReadexPro', fontSize: 14, color: Color(0xFF0F172A)),
      ),
      trailing: Visibility(
        visible: labelText.isNotEmpty,
        child: Container(
          width: 30,
          height: 20,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  fontFamily: 'ReadexPro', fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class RightNavigationRail extends StatelessWidget {
  const RightNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          // Contents of the right navigation rail
        ],
      ),
    );
  }
}
