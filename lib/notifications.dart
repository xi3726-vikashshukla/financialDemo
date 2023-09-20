import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'history.dart';

class NotificationScreen extends StatefulWidget {
  final int currentIndex;

  const NotificationScreen({super.key, required this.currentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationModel> _notifications = _getDummyNotifications();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.currentIndex);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return GestureDetector(
            onTap: () {
              _showNotificationDetails(notification, context);
            },
            child: NotificationItem(notification: notification),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: widget.currentIndex,
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
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen(currentIndex: index)),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen(currentIndex: index)),
            );
          } else if (index == 3) {
            // Stay on Notifications screen
          }
        },
      ),
    );
  }

  void _showNotificationDetails(NotificationModel notification, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  notification.senderName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification.receiverDetails),
                          SizedBox(height: 8),
                          Text(
                            notification.timestamp,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.star_border),
                  ],
                ),
                SizedBox(height: 16),
                Text(notification.description),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              notification.senderName.substring(0, 1),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.senderName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  notification.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                notification.timestamp,
                style: TextStyle(
                  color: notification.isRead ? Colors.grey : Colors.blue,
                ),
              ),
              Icon(
                Icons.star_border,
                color: notification.isFavorite ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationModel {
  final String senderName;
  final String receiverDetails;
  final String timestamp;
  final String description;
  final bool isRead;
  final bool isFavorite;

  NotificationModel({
    required this.senderName,
    required this.receiverDetails,
    required this.timestamp,
    required this.description,
    this.isRead = false,
    this.isFavorite = false,
  });
}

List<NotificationModel> _getDummyNotifications() {
  return List.generate(15, (index) {
    if(index%2==0) {
return NotificationModel(
      senderName: 'Sender $index',
      receiverDetails: 'Receiver Details $index',
      timestamp: 'Today, 12:34 PM',
      description: 'Notification description $index',
      isRead: true,
      isFavorite: true,
    );
    } else {
      return NotificationModel(
      senderName: 'Sender $index',
      receiverDetails: 'Receiver Details $index',
      timestamp: 'Today, 12:34 PM',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. $index',
      isRead: false,
      isFavorite: false,
    );
    }
    
  });
}
