import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';

import '../providers/models_providers.dart';
import '../services/services.dart';
import '../widgets/message_body.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final modelsProvider = Provider.of<ModelsProviders>(context);
    bool isTyping = modelsProvider.isTyping;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        leading: Icon(SimpleIcons.chatbot),
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
              icon: Icon(Icons.more_vert_rounded),
              onPressed: () async {
                await Services.showModalSheet(context);
              },
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: MessageBody(scrollController: _scrollController),
          ),
          if (isTyping) ...[
            SpinKitThreeBounce(color: colors.primary, size: 15)
          ],
          MessageInput(
            scrollToEnd: scrollToEnd,
          )
        ],
      )),
    );
  }

  void scrollToEnd() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2), curve: Curves.easeOut);
  }
}
