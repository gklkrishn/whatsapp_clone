import 'package:flutter/material.dart';
import 'package:wtsap_clone/chat_screen/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
    required this.messageData,
  }) : super(key: key);
  MessageModel messageData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          (messageData.isSend!) ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          color: (messageData.isSend!)? Color(0xffdcf8c6): Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 40, bottom: 10, left: 5, top: 3),
                child: Text(messageData.message!),
              ),
              Positioned(
                right: 2,
                bottom: -1,
                child: Row(
                  children: [
                    Text(
                      messageData.sendAt!,
                      style: TextStyle(fontSize: 10),
                    ),
                    (messageData.isSend!)
                        ? Icon(
                            Icons.done_all,
                            color: (messageData.isReaded!)
                                ? Colors.blue
                                : Colors.grey,
                            size: 10,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
