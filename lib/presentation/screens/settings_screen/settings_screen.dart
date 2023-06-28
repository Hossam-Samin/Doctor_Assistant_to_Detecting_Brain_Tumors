import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../Home_App/home_App.dart';
import '../maps_screen/Map_pagee.dart';
import '../notifications_screen/notifications_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'question_scrren.dart';
import 'support_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool iconClick = true;

  IconData toggle_off = FontAwesomeIcons.toggleOff;
  IconData toggle_on = FontAwesomeIcons.toggleOn;

  sendNotify() async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: 'Doctor',
      body: 'Please, Take The Treatment Now ',
    ));
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontFamily: "JF-Flat"),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Column(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FQS(),
                        ));
                      },
                      trailing: const Text(
                        "FAQS",
                        style: TextStyle(fontFamily: "JF-Flat"),
                      ),
                      leading: const Icon(
                        Icons.question_mark_rounded,
                        color: Colors.blueGrey,
                      ),
                      minLeadingWidth: 80,
                      contentPadding: const EdgeInsets.only(
                        top: 5,
                        left: 5,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        launch("https://www.drugs.com/cg/brain-tumors.html");
                      },
                      trailing: const Text(
                        "Instructions",
                        style: TextStyle(fontFamily: "JF-Flat"),
                      ),
                      leading: const Icon(
                        Icons.integration_instructions_rounded,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                      minLeadingWidth: 73,
                      contentPadding: const EdgeInsets.only(
                        top: 5,
                        left: 5,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ));
                      },
                      trailing: const Text(
                        "Push Notification",
                        style: TextStyle(fontFamily: "JF-Flat"),
                      ),
                      leading: IconButton(
                        color: Colors.blueGrey,
                        onPressed: () {
                          setState(() {
                            iconClick = !iconClick;

                            if (iconClick == false) {
                              sendNotify();
                            } else {
                              print("The button is off");
                            }
                          });
                        },
                        icon: Icon(
                          iconClick == false ? toggle_on : toggle_off,
                          size: 35,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, left: 5),
                      minLeadingWidth: 76,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const GoogleMapsPge(),
                        ));
                      },
                      trailing: const Text(
                        "Maps",
                        style: TextStyle(fontFamily: "JF-Flat"),
                      ),
                      leading: const Icon(
                        Icons.location_pin,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, left: 5),
                      minLeadingWidth: 76,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Support(),
                        ));
                      },
                      trailing: const Text(
                        "Help and Support",
                        style: TextStyle(fontFamily: "JF-Flat"),
                      ),
                      leading: const Icon(
                        Icons.add_reaction_sharp,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, left: 5),
                      minLeadingWidth: 76,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  "Log out",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "JF-Flat"),
                                ),
                                content: const Text(
                                  "Are you sure?",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: "JF-Flat"),
                                ),
                                actions: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 10,
                                              right: 10)),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "JF-Flat"),
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                            (route) => false);
                                      },
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors.orangeAccent),
                                          primary: Colors.orangeAccent,
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 10,
                                              right: 10)),
                                      child: const Text(
                                        "Sure",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "JF-Flat"),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      trailing: const Text(
                        "Log out",
                        style: TextStyle(fontFamily: "JF-Flat"),
                      ),
                      leading: const Icon(
                        Icons.logout_rounded,
                        color: Colors.blueGrey,
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, left: 5),
                      minLeadingWidth: 75,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
