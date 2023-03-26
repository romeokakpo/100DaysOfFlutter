import 'package:day6/providers/app_prrovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.content, required this.color});
  final String content;
  final Color color;
  @override
  Widget build(BuildContext context) {
    AppProvider appState = context.watch<AppProvider>();
    bool mode = appState.mode;

    return ElevatedButton(
      onPressed: () {
        if (content == "=") {
          appState.setResult();
        } else if (content == "AC") {
          appState.removeLeft();
        } else {
          if ("+-x÷".contains(content)) {
            appState.addEnteredText(" $content ");
          } else {
            appState.addEnteredText(content);
          }
        }
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(60, 60),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: mode ? Color(0xfff7f7f7) : Color(0xff272b33)),
      child: Text(
        content,
        style: TextStyle(fontSize: 20, color: color),
      ),
    );
  }
}
