import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:day7/app/controllers/home_controller.dart';
import 'package:day7/app/services/theme_service.dart';
import 'package:day7/data/onboard_data.dart';
import 'package:day7/ui/widgets/home/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/archive.dart';
import '../widgets/task_done.dart';
import '../widgets/todo_list.dart';

class Home extends GetView<HomeController> {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      TodoList(c: controller),
      TaskDone(c: controller),
      Archive(c: controller)
    ];

    var colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list_alt_outlined),
        title: Obx(() => Text(
              widgetsList[controller.selectedIndex.value]["title"],
              style: const TextStyle(fontWeight: FontWeight.w600),
            )),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  ThemeService().switchTheme();
                },
                icon: Icon(Get.isDarkMode
                    ? Icons.light_mode_sharp
                    : Icons.dark_mode_sharp),
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              DateFormat("MMM d, y")
                                  .format(controller.selectedDate.value),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            )),
                        Obx(() => Text(
                              DateFormat("EEE")
                                  .format(controller.selectedDate.value),
                              style: const TextStyle(fontSize: 16),
                            ))
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Dialogs.newListDialog(
                            controller.selectedDate.value, controller);
                      },
                      icon: Icon(
                        Icons.format_list_bulleted_add,
                        color: Get.isDarkMode ? Colors.white : null,
                      ),
                      label: Text(
                        "New List",
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : null),
                      ),
                      style: ElevatedButton.styleFrom(
                          shadowColor:
                              Get.isDarkMode ? const Color(0x64ffffff) : null,
                          elevation: 4,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 10),
                child: DatePicker(
                  DateTime.now(),
                  height: 90,
                  initialSelectedDate: controller.selectedDate.value,
                  selectionColor:
                      Get.isDarkMode ? const Color(0xff673ab7) : colors.primary,
                  selectedTextColor:
                      Get.isDarkMode ? colors.primary : colors.onPrimary,
                  daysCount: 60,
                  onDateChange: controller.dateChanged,
                  dayTextStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  dateTextStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  monthTextStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(() => Expanded(child: pages[controller.selectedIndex.value]))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: const Color(0xff673ab7),
            selectedFontSize: 16,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_sharp), label: "List"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_sharp), label: "Done"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.archive_sharp), label: "Archive")
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: controller.bottomItemTapped,
          )),
      resizeToAvoidBottomInset: false,
    );
  }
}
