import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _route();
  }

  void _route() {
    Timer(const Duration(seconds: 1), () async {
      if (Get.find<AuthController>().isLoggedIn()) {
        await Get.find<AuthController>().getProfile();
        Get.offNamed(Routes.DASHBOARD);
      } else
      // {
      //   if (Get.find<SplashController>().isFirstTIme()) {
      //     Get.offNamed(Routes.ONBOARDING);
      //   } else
        {
          Get.offNamed(Routes.LOGIN);
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tefzon Splash Logo"),
      ),
    );
  }
}
