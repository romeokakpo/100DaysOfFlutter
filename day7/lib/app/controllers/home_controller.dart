import 'package:day7/app/services/db_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/list_model.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxList<ListModel> lists = <ListModel>[].obs; //List of Lists of Task
  RxList<ListModel> listsByDay = <ListModel>[].obs;
  RxList<ListModel> doneByDay = <ListModel>[].obs;

  DBService db = DBService();

  @override
  void onInit() async {
    await getLists();
    _setListByday();
    super.onInit();
  }

  Future<void> getLists() async {
    lists.assignAll(await db.getLists());
  }

  void addList(ListModel list) async {
    await db.insertList(list);
    await getLists();
    _setListByday();
  }

  void bottomItemTapped(int index) {
    selectedIndex.value = index;
  }

  void _setListByday() {
    listsByDay.value = lists
        .where(
            (p0) => p0.date == DateFormat("y-MM-dd").format(selectedDate.value))
        .toList();
  }

  void dateChanged(DateTime date) {
    selectedDate.value = date;
    _setListByday();
  }
}
