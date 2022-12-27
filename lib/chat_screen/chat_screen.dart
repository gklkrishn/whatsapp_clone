import 'package:flutter/material.dart';
import 'package:wtsap_clone/chat_screen/charttile.dart';
import 'package:wtsap_clone/chat_screen/model/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<ChatList> chatsData = [
    ChatList(
      name: 'meiza',
      message: 'hi....',
      isGroup: false,
      image: '',
      updatedat: '9:am',
    ),
    ChatList(
      name: 'sherin',
      message: 'hey....',
      isGroup: false,
      image:
          'https://cdn.cnn.com/cnnnext/dam/assets/220930165943-01-neymar-super-tease.jpg',
      updatedat: '10:am',
    ),
    ChatList(
      name: 'cr7ss',
      message: 'da....',
      isGroup: true,
      image: '',
      updatedat: '9:am',
    ),
    ChatList(
        name: 'neymarjrr',
        message: 'hi....',
        isGroup: true,
        image:
            'https://cdn.cnn.com/cnnnext/dam/assets/220930165943-01-neymar-super-tease.jpg',
        updatedat: '9:am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatsData.length,
        itemBuilder: (context, index) {
          print(index);
          return ChatTile(chatsData: chatsData[index]);
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.message)),
    );
  }
}
