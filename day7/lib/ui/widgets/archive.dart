import 'package:day7/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archive extends StatelessWidget {
  Archive({super.key, required this.c});

  final HomeController c;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(c.selectedIndex.string),
    );
  }
}
