import 'package:chaty_app/models/message_model.dart';
import 'package:chaty_app/widgets/constants.dart';
import 'package:chaty_app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/message_shape.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessageCollections);
    TextEditingController controller = TextEditingController();
    CollectionReference message =
        FirebaseFirestore.instance.collection(kMessageCollections);
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJosn(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kIcon,
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return messagesList[index].id == email
                          ? MessageShape(
                              message: messagesList[index].message,
                            )
                          : MessageShapeReceiver(
                              message: messagesList[index].message,
                            );
                    },
                  ),
                ),
                CustomTextField(
                  controller: controller,
                  onSubmitted: (value) {
                    messages.add({
                      kMessage: value,
                      kCreatedAt: DateTime.now(),
                      kID: email,
                    });
                    controller.clear();
                    _controller.animateTo(
                      0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(body: Center(child: Text('Loading...')));
        }
      },
    );
  }
}
