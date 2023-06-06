import 'package:flutter/material.dart';

import '../../widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_model/message.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('Messages');
  TextEditingController messageController = TextEditingController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var chatEmail = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  'Chat Home',
                  style: TextStyle(fontFamily: "JF-Flat", color: Colors.black),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call_rounded,
                        color: Colors.lightBlue,
                        size: 25,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.lightBlue,
                        size: 30,
                      )),
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messageList.length,
                          itemBuilder: (context, index) {
                            return messageList[index].id == chatEmail
                                ? CustomChatBubble(
                                    message: messageList[index],
                                  )
                                : CustomChatBubbleForForDoc(
                                    message: messageList[index]);
                          })),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: messageController,
                      onSubmitted: (value) {
                        messages.add({
                          'message': value,
                          'createdAt': DateTime.now(),
                          'id': chatEmail
                        });
                        messageController.clear();
                        _controller.animateTo(
                          0,
                          // _controller.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Type Message...',
                        hintStyle: const TextStyle(fontFamily: "JF-Flat"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            messages.add({
                              'message': messageController.text,
                              'createdAt': DateTime.now(),
                              'id': chatEmail
                            });
                            messageController.clear();
                            _controller.animateTo(
                              0,
                              // _controller.position.maxScrollExtent,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          },
                          icon: const Icon(Icons.send),
                          color: Colors.blueGrey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  )
                ],
              ));
        }

        return const Scaffold();
      },
    );
  }
}
