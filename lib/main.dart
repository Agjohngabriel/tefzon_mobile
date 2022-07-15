import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'dependencies/dependencies.dart' as Dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Dep.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
