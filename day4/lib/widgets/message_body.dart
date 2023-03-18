import 'package:day4/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chat_model.dart';
import '../providers/chat_providers.dart';

class MessageBody extends StatefulWidget {
  MessageBody({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    List<ChatModel> chatList = chatProvider.chatList;

    return ListView.builder(
        controller: widget.scrollController,
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatWidget(
            msg: chatList[index].msg,
            index: chatList[index].chatIndex,
          );
        });
  }
}
