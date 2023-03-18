import 'package:day4/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];

  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage(String msg) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  void addBotMessge(List<ChatModel> msg) {
    chatList.addAll(msg);
    notifyListeners();
  }
}
