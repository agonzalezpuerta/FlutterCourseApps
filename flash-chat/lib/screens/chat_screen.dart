import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/auth_service.dart';
import 'package:flash_chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

AuthService myAuthService = AuthService();

final currentUser = myAuthService.checkCurrentUser();

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String messageText;

  final myTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                myAuthService.logoutUser();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStreamer(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: myTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      _firebaseFirestore.collection("messages").add({
                        'sender': myAuthService.checkCurrentUser().email,
                        'text': messageText,
                        'timestamp': FieldValue.serverTimestamp(),
                      });

                      myTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStreamer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firebaseFirestore
            .collection('messages')
            .orderBy('timestamp')
            .snapshots(),
        builder: (context, snapshot) {
          // Initialize list of widgets to be filled later
          List<MessageBubble> messageBubbles = [];

          if (snapshot.hasData) {
            // Get latest snapshots with all the available messages
            final messages = snapshot.data.docs;

            // Loop through message list in query
            for (var message in messages) {
              final messageSender = message.data()['sender'];
              final messageText = message.data()['text'];

              final messageBubble = MessageBubble(
                  sender: messageSender,
                  text: messageText,
                  isMe: messageSender == currentUser.email);

              messageBubbles.add(messageBubble);
            }

            return Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                children: messageBubbles,
                reverse: false,
              ),
            );
          }
          return Text(snapshot.data.toString());
        });
  }
}
