import 'package:flutter/material.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent(
      {super.key,
      required this.image,
      required this.description,
      required this.title});
  final String image;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Colors.black, fontWeight: FontWeight.bold);

    return Column(
      children: [
        const Spacer(),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceInOut,
          child: Image.asset(image),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0, bottom: 10),
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 17),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
