import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:wtsap_clone/chat_screen/chat_bubble.dart';
import 'package:wtsap_clone/chat_screen/model/chat_model.dart';
import 'package:wtsap_clone/chat_screen/model/message_model.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.chatdata});

  ChatList chatdata;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<MessageModel> messageList = [
    MessageModel(
        message: 'hiii', sendAt: '10:00am', isSend: true, isReaded: true),
    MessageModel(
        message: 'hlo', sendAt: '10:2am', isSend: false, isReaded: true),
    MessageModel(
        message: 'wtsap??', sendAt: '10:3am', isSend: true, isReaded: true),
    MessageModel(
        message: 'good', sendAt: '10:4am', isSend: false, isReaded: true),
    MessageModel(
        message: 'okkk', sendAt: '10:5am', isSend: true, isReaded: false),
  ];
  bool showSend = false;
  bool showEmoji = true;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: Row(
            children: [
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back)),
              CircleAvatar(
                  backgroundImage: (widget.chatdata.image == '')
                      ? NetworkImage((widget.chatdata.isGroup!)
                          ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxmH_7CpVsPciTqZFm1Avh9d49g-wlIilxTg&usqp=CAU')
                      : NetworkImage(widget.chatdata.image!))
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.chatdata.name!),
              Text(
                'online',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: (widget.chatdata.isGroup!)
                          ? Text('group info')
                          : Text('view contact')),
                  PopupMenuItem(
                      child: (widget.chatdata.isGroup!)
                          ? Text('group media')
                          : Text('media,links,and,docs')),
                  PopupMenuItem(child: Text('search')),
                  PopupMenuItem(child: Text('mute notification')),
                  PopupMenuItem(child: Text('disappearing messages')),
                  PopupMenuItem(child: Text('walpaper')),
                  PopupMenuItem(child: Text('more')),
                ];
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/wtsapwp.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  messageData: messageList[index],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 70,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextField(
                          controller: messageController,
                          onTap: () {
                            if (!showEmoji) {
                              setState(() {
                                showEmoji = true;
                              });
                            }
                          },
                          onChanged: (value) {
                            // print(value);
                            if (value.length > 0) {
                              setState(() {
                                showSend = true;
                              });
                            } else {
                              setState(() {
                                showSend = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Message',
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: IconButton(
                                    onPressed: () {},
                                    icon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            (showEmoji)
                                                ? FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus()
                                                : FocusManager.instance
                                                    .primaryFocus?.requestFocus;
                                            setState(() {});
                                            showEmoji = !showEmoji;
                                          });
                                        },
                                        child: Icon((showEmoji)
                                            ? Icons.emoji_emotions_outlined
                                            : Icons.keyboard)),
                                  )),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => menu(),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.currency_rupee)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt)),
                                ],
                              )),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          print(messageController.text);
                          setState(() {
                            messageList.add(
                              MessageModel(
                                  message: messageController.text,
                                  isSend: true,
                                  sendAt: '10:00am',
                                  isReaded: false),
                            );
                          });
                          messageController.clear();
                        },
                        child: (showSend) ? Icon(Icons.send) : Icon(Icons.mic),
                      )
                    ],
                  ),
                  Offstage(
                    offstage: showEmoji,
                    child: SizedBox(height: 300, child: EmojiPicker()),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Container menu() {
    return Container(
        height: 300,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                menuItem('document', Colors.blueAccent,
                    Icon(Icons.insert_drive_file)),
                menuItem('camera', Colors.red, Icon(Icons.camera_alt)),
                menuItem('gallery', Colors.pink, Icon(Icons.insert_photo)),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                menuItem('audio', Colors.blue, Icon(Icons.headphones)),
                menuItem('location', Colors.green, Icon(Icons.location_pin)),
                menuItem('payment', Colors.teal, Icon(Icons.currency_rupee)),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                menuItem('contact', Colors.indigo, Icon(Icons.headphones)),
                menuItem('poll', Colors.teal, Icon(Icons.poll)),
                SizedBox(
                  width: 50,
                )
              ])
            ],
          ),
        ));
  }

  Column menuItem(String text, Color color, Icon icon) {
    return Column(
      children: [
        CircleAvatar(
          child: icon,
          backgroundColor: color,
          radius: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(text),
      ],
    );
  }
}
