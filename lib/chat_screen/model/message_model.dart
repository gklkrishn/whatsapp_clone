// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.message,
    this.sendAt,
    this.isSend,
    this.isReaded,
  });

  String? message;
  String? sendAt;
  bool? isSend;
  bool? isReaded;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        sendAt: json["sendAt"],
        isSend: json["isSend"],
        isReaded: json["isReaded"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "sendAt": sendAt,
        "isSend": isSend,
        "isReaded": isReaded,
      };
}
