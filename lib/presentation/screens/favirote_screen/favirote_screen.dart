import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaviroteScreen extends StatefulWidget {
  const FaviroteScreen({super.key});

  @override
  State<FaviroteScreen> createState() => _FaviroteScreenState();
}

var time = DateTime.now();

class _FaviroteScreenState extends State<FaviroteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorite",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "JF-Flat",
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.green.withOpacity(0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: const Text(
                    "Hossam Samin",
                    style: TextStyle(fontFamily: "JF-Flat", fontSize: 24),
                  ),
                  subtitle: Text(
                    "No, this case not have tumor",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(.3),
                        fontFamily: "JF-Flat"),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.trash),
                  ),
                ),
                Text(
                    "Current Time: ${time.hour} : ${time.minute} : ${time.second}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(.3),
                      fontFamily: "JF-Flat",
                    )),
                Text("Current Date: ${time.day} - ${time.month} - ${time.year}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(.3),
                      fontFamily: "JF-Flat",
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
