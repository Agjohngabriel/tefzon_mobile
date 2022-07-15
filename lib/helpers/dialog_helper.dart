import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/modules/get_started/views/signup_view.dart';
import '../utils/colors.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = "No result", String description = "No results found"}) {
    Get.dialog(Dialog(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/image/empty.png",
              scale: 3.5,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: GoogleFonts.mulish(
                  fontSize: 18,
                  color: AppTheme.blue,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: GoogleFonts.mulish(
                  fontSize: 17,
                  color: AppTheme.darkText,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                    color: AppTheme.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                      "try again",
                      style: GoogleFonts.mulish(
                          color: AppTheme.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(() => SignupView()),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppTheme.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                      "create account",
                      style: GoogleFonts.mulish(
                          color: AppTheme.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
  static void showDialog(
      {String title = "No result", String description = "No results found", required Function() onTap }) {
    Get.dialog(Dialog(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/image/empty.png",
              scale: 3.5,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: GoogleFonts.mulish(
                  fontSize: 18,
                  color: AppTheme.blue,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: GoogleFonts.mulish(
                  fontSize: 17,
                  color: AppTheme.darkText,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                    color: AppTheme.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                      "Ok",
                      style: GoogleFonts.mulish(
                          color: AppTheme.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
