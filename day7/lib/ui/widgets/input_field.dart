import 'package:flutter/material.dart';

import '../themes.dart';

class InputField extends StatelessWidget {
  InputField(
      {super.key,
      required this.title,
      required this.hint,
      this.child,
      this.fieldController});

  final String title;
  final String hint;
  final Widget? child;
  final TextEditingController? fieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey)),
            width: MediaQuery.of(context).size.width * 0.95,
            height: 60,
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                controller: fieldController,
                maxLength: 30,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  counterText: "",
                ),
                readOnly: child != null ? true : false,
              )),
              Container(
                padding: const EdgeInsets.only(right: 5),
                child: child ?? Container(),
              )
            ]),
          )
        ],
      ),
    );
  }
}
