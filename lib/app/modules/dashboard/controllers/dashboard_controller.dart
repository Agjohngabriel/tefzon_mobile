import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tefzon/app/modules/home/views/home_page.dart';
import 'package:tefzon/app/modules/squad/views/select_squad.dart';

class DashboardController extends GetxController {
  int Index = 0;
  void changeTabIndex(int index) {
    index = Index;
    update();
  }

  void selectTabIndex(page) {
    Index = page;
    update();
  }

  final pages = [
    const SelectSquad(),
    const HomepageView(),
    Container(),
    Container(),
  ];
}