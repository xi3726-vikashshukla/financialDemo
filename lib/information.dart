import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double progressBarWidth = screenWidth * 0.4;

    return Container(
      margin: EdgeInsets.all(5),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row 1 - Title
            Row(
              children: const [
                Text('Information', style: TextStyle(
      fontFamily: 'ReadexPro',fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            // Row 2 - List of Items
            SizedBox(
              height: 150, // Set the fixed height for each item
              child: ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
      List<Widget Function()> items = [
        () => buildItem('\$3,000',screenWidth, progressBarWidth, Color(0xFFE0E7FF)),
        () => buildItem('\$890',screenWidth, progressBarWidth, Color(0xFFFFEDD5)),
        () => buildItem('\$490',screenWidth, progressBarWidth, Color(0xFFDCFCE7)),
        () => buildItem('\$4,890',screenWidth, progressBarWidth, Color(0xFFFCE7F3)),
        () => buildItem('\$5,000',screenWidth, progressBarWidth, Color(0xFFE6B4EF)),
      ];
    
      if (index >= 0 && index < items.length) {
        return items[index]();
      } else {
        return Container(); // Handle out-of-bounds index as needed
      }
      },
    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String amount, double screenWidth, double progressBarWidth, Color backgroundColor) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          width: 160, // Set a fixed width
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
    fontFamily: 'ReadexPro',
                        color: Colors.black,
                        fontSize: screenWidth * 0.015,
                      ),
                    ),
                    Text(
                      'Of \$5,000 Monthly Limits',
                      style: TextStyle(
    fontFamily: 'ReadexPro',
                        color: Colors.black,
                        fontSize: screenWidth * 0.008,
                      ),
                    ),
                    SizedBox(height: 12),
                    Semantics(
                      value: '50%', // Set the current value
                      label: 'Progress: 50%', // Set a label for accessibility
                      child: Container(
                        height: 14, // Set the height of the progress bar
                        decoration: BoxDecoration(
                          color: Color(0xFFC7D2FE),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.5, // 50% progress
                            minHeight: 14, // Set the height of the progress bar
                            backgroundColor: Color(0xFFC7D2FE),
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4338CA)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: InformationWidget(),
    ),
  ));
}
