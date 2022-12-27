import 'package:flutter/material.dart';
import 'package:wtsap_clone/chat_screen/chat_details.dart';
import 'package:wtsap_clone/chat_screen/model/chat_model.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.chatsData,
  }) : super(key: key);

  final ChatList chatsData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetails(chatdata: chatsData),
            ));
      },
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: (chatsData.image == '')
              ? NetworkImage((!chatsData.isGroup!)
                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxmH_7CpVsPciTqZFm1Avh9d49g-wlIilxTg&usqp=CAU'
                  : 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo')
              : NetworkImage(chatsData.image!)),
      title: Text(chatsData.name!),
      subtitle: Text(chatsData.message!),
      trailing: Text(chatsData.updatedat!),
    );
  }
}
