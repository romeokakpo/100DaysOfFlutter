import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key, required this.msg, required this.index});

  final String msg;
  final int index;
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(8),
      color: index == 0 ? colors.primaryContainer : colors.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          index == 0
              ? Icon(
                  Icons.person,
                  size: 30,
                )
              : Icon(SimpleIcons.probot),
          SizedBox(width: 8),
          Expanded(
              child: index == 0
                  ? Text(
                      msg,
                      style: TextStyle(color: colors.onPrimaryContainer),
                    )
                  : DefaultTextStyle(
                      style: TextStyle(color: colors.onSurface),
                      child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          displayFullTextOnTap: true,
                          totalRepeatCount: 1,
                          animatedTexts: [TyperAnimatedText(msg.trim())]),
                    )),
          index == 0
              ? SizedBox.shrink()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.thumb_up_alt_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.thumb_down_alt_outlined)
                  ],
                )
        ]),
      ),
    );
  }
}
