import 'package:day7/app/controllers/home_controller.dart';
import 'package:day7/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/models/list_model.dart';
import '../input_field.dart';

class Dialogs {
  static colorPickerDialog(colorPicked, colorChanged) {
    return Get.defaultDialog(
        title: "Pick a color",
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: colorPicked.value,
            onColorChanged: (color) {
              colorChanged(color);
              Get.back();
            },
          ),
        ));
  }

  static getDateFromUser(selecteDate, dateChanged) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selecteDate.value,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      dateChanged(pickedDate);
    }
  }

  static newListDialog(DateTime selecteDate, HomeController ctrl) {
    Rx<Color> colorPicked = const Color.fromARGB(255, 255, 0, 0).obs;
    Rx<DateTime> datePicked = selecteDate.obs;

    final titleEditingController = TextEditingController();

    void colorChanged(Color color) {
      colorPicked.value = color;
    }

    void dateChanged(DateTime date) {
      datePicked.value = date;
    }

    void validateField() {
      if (titleEditingController.text.isEmpty) {
        Get.showSnackbar(
          GetSnackBar(
            icon: const Icon(
              Icons.warning_amber_sharp,
              color: Colors.white,
            ),
            message: "Title is required",
            onTap: (GetSnackBar bar) {
              Get.back();
            },
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red.shade500,
          ),
        );
      } else {
        //Save new record here
        ctrl.addList(
          ListModel(
              null,
              titleEditingController.text,
              DateFormat("y-MM-dd").format(datePicked.value),
              colorPicked.value.value,
              'PENDING', []),
        );

        Get.back();

        Get.showSnackbar(
          GetSnackBar(
            icon: const Icon(
              Icons.done_sharp,
              color: Colors.white,
            ),
            message: "Saved",
            onTap: (GetSnackBar bar) {
              Get.back();
            },
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green.shade500,
          ),
        );
      }
    }

    return Get.defaultDialog(
        title: "New List",
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        radius: 15,
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                InputField(
                  fieldController: titleEditingController,
                  title: "Title",
                  hint: "Enter your title here",
                ),
                Obx(() => InputField(
                      title: "Date",
                      hint: DateFormat("dd/MM/y").format(datePicked.value),
                      child: IconButton(
                          onPressed: () {
                            getDateFromUser(datePicked, dateChanged);
                          },
                          icon: const Icon(Icons.calendar_today_sharp)),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        "Pick Color",
                        style: titleStyle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () =>
                            colorPickerDialog(colorPicked, colorChanged),
                        child: Obx(() => CircleAvatar(
                              backgroundColor: colorPicked.value,
                              child: const Icon(Icons.check),
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: validateField,
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30)),
                            child: const Text(
                              "Save",
                              style: TextStyle(),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
