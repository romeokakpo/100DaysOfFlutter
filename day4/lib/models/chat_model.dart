class ChatModel {
  ChatModel({required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(msg: json["content"], chatIndex: 1);
  }
}
