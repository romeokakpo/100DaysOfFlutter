import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/home_controller.dart';

class TaskDone extends StatelessWidget {
  TaskDone({super.key, required this.c});
  final HomeController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(c.selectedIndex.string),
    );
  }
}
