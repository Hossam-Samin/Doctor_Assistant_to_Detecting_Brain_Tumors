import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/favirote_model/favirote_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../business_logic/favirote_model/db_helper.dart';
import '../../../business_logic/favirote_model/favirote_provider.dart';

class FaviroteScreen extends StatefulWidget {
  const FaviroteScreen({super.key});

  @override
  State<FaviroteScreen> createState() => _FaviroteScreenState();
}

DBHelper? dbHelper = DBHelper();

class _FaviroteScreenState extends State<FaviroteScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<FavProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          " My Favorite",
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
      body: FutureBuilder<List<FaviroteModel>>(
        future: cart.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  "The Favirote page is Empty...",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "JF-Flat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.green.withOpacity(0.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ListTile(
                              title: Text(
                                "Name: ${snapshot.data![index].patientName.toString()}",
                                style: const TextStyle(
                                    fontFamily: "JF-Flat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              // leading: Image.file(snapshot.data![index].image),
                              trailing: IconButton(
                                onPressed: () {
                                  dbHelper!.delete(snapshot.data![index].id);
                                  cart.removeCounter();
                                },
                                icon: const Icon(FontAwesomeIcons.trash),
                              ),
                            ),
                            Text(
                                "Result: ${snapshot.data![index].result.toString()}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "JF-Flat",
                                )),
                            Text("Rate: ${snapshot.data![index].rate} ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "JF-Flat",
                                )),
                            Text("Time & Date: ${snapshot.data![index].date} ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "JF-Flat",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            // Image.file(snapshot.data![index].image as File),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
