import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../repository/authentication_repo.dart';
import '../../../data/models/favourite.dart';

class GetStartedController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
