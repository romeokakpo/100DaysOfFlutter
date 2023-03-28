import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:day7/data/onboard_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  DateTime _selectedDate = DateTime.now();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list_alt_outlined),
        title: Text(
          widgetsList[_selectedIndex]["title"],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.dark_mode_sharp),
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
                        Text(
                          DateFormat("MMM d, y").format(_selectedDate),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Text(
                          DateFormat("EEE").format(_selectedDate),
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.format_list_bulleted_add),
                      label: const Text("New List"),
                      style: ElevatedButton.styleFrom(
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
                  initialSelectedDate: _selectedDate,
                  selectionColor: colors.primary,
                  selectedTextColor: colors.onPrimary,
                  daysCount: 60,
                  onDateChange: (selectedDate) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  },
                ),
              ),
              const Expanded(child: Placeholder())
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_sharp), label: "List"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_sharp), label: "Done"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.archive_sharp), label: "Archive")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
