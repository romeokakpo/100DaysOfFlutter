import 'package:day4/providers/chat_providers.dart';
import 'package:day4/request/request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/models_providers.dart';

class MessageInput extends StatefulWidget {
  MessageInput({super.key, required this.scrollToEnd});
  final VoidCallback scrollToEnd;

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final textController = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final modelsProvider = Provider.of<ModelsProviders>(context);
    final chatProvider = Provider.of<ChatProvider>(context);

    return Container(
      color: colors.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                style: TextStyle(color: Colors.white),
                controller: textController,
                onSubmitted: (value) async {
                  await sendMessageFCT(modelsProvider, chatProvider);
                },
                decoration: InputDecoration(
                    hintText: "How can i help you ?",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: () async {
                await sendMessageFCT(modelsProvider, chatProvider);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMessageFCT(
      ModelsProviders modelsProviders, ChatProvider chatProvider) async {
    String msg = textController.text;

    try {
      modelsProviders.setTyping();
      setState(() {
        chatProvider.addUserMessage(msg);
        textController.clear();
        focusNode.unfocus();
      });

      chatProvider.addBotMessge(
          await Request.setMessage(msg, modelsProviders.getCurrentModel));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    } finally {
      modelsProviders.setTyping();
      widget.scrollToEnd();
    }
  }
}
