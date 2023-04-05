import 'package:day7/ui/widgets/home/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/home_controller.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key, required this.c});
  final HomeController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: [
        Expanded(
          child: Obx(
            () => c.listsByDay.isNotEmpty
                ? ListView.builder(
                    itemCount: c.listsByDay.length,
                    itemBuilder: (context, index) {
                      List<String> split = c.listsByDay[index].date.split('-');

                      return Todo(
                        color: Color(c.listsByDay[index].color).withOpacity(.9),
                        title: c.listsByDay[index].title,
                        date: "${split[2]}/${split[1]}/${split[0]}",
                      );
                    })
                : const Center(
                    child: Text("Empty task list :)"),
                  ),
          ),
        )
      ]),
    );
  }
}
