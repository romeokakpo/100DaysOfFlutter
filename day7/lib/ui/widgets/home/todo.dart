import 'package:day7/ui/themes.dart';
import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  const Todo(
      {super.key,
      required this.color,
      required this.title,
      required this.date});
  final Color color;
  final String title;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      padding: const EdgeInsets.only(top: 10, left: 15, bottom: 15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: titleStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today_sharp, color: Colors.white),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ]),
          ),
          PopupMenuButton(
              offset: const Offset(-20, 40),
              icon: const Icon(
                Icons.more_vert_sharp,
                color: Colors.white,
              ),
              onSelected: (int value) {},
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Row(children: [
                      const Icon(Icons.done_sharp, color: Colors.green),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Done",
                        style: TextStyle(color: Colors.green),
                      )
                    ]),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(children: [
                      const Icon(Icons.archive_sharp, color: Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Archive",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(children: [
                      const Icon(Icons.delete_outline, color: Colors.red),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      )
                    ]),
                  ),
                ];
              })
        ],
      ),
    );
  }
}
