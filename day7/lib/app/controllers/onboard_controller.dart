import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  RxBool lastPage = false.obs;
  PageController c = PageController();

  void pageChange(int index) {
    lastPage.value = (index == 2);
  }
}
