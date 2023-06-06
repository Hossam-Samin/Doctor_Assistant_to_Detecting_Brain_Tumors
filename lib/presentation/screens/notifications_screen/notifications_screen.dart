import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: "JF-Flat"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                child: const Center(
                  child: Text(
                    "Systems or doctors send notify for patient ",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // ElevatedButton(
              //     onPressed: sendNotify, child: const Text('Send Notification'))
            ],
          )
        ],
      ),
    ));
  }
}
