// To parse this JSON data, do
//
//     final chatList = chatListFromJson(jsonString);

import 'dart:convert';

ChatList chatListFromJson(String str) => ChatList.fromJson(json.decode(str));

String chatListToJson(ChatList data) => json.encode(data.toJson());

class ChatList {
  ChatList({
    this.name,
    this.message,
    this.updatedat,
    this.image,
    this.isGroup,
  });

  String? name;
  String? message;
  String? updatedat;
  String? image;
  bool? isGroup;

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
        name: json["name"],
        message: json["message"],
        updatedat: json["updatedat"],
        image: json["image"],
        isGroup: json["isGroup"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "updatedat": updatedat,
        "image": image,
        "isGroup": isGroup,
      };
}
