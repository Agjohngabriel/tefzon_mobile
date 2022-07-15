import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:tefzon/app/modules/dashboard/views/widgets/bottom_nav_item.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/icons.dart';
import '../../../routes/app_pages.dart';
import '../../leagues/views/join_league.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppTheme.nearlyWhite,
              body: controller.pages[controller.Index],
              bottomNavigationBar: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.4,
                      child: Container(
                        height: 55.0,
                        width: 55.0,
                        child: FloatingActionButton(
                          backgroundColor: AppTheme.grey,
                          onPressed: () {
                            Get.dialog(Dialog(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    InkWell(
                                      onTap: () => Get.toNamed(Routes.CREATELEAGUE),
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        margin: const EdgeInsets.only(left: 5, right: 5),
                                        decoration: const BoxDecoration(
                                            color: Colors.lightGreen,
                                            borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: ListTile(
                                          leading: const Iconify(AppIcon.create),
                                          title: Text(
                                            "Create League",
                                            style: GoogleFonts.mulish(
                                                color: AppTheme.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () => Get.to(() => JoinLeague(index: 1,)),
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        margin: const EdgeInsets.only(left: 5, right: 5),
                                        decoration: const BoxDecoration(
                                            color: Colors.yellowAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: ListTile(
                                          leading: const Iconify(AppIcon.joinPublic),
                                          title: Text(
                                            "Join Private",
                                            style: GoogleFonts.mulish(
                                                color: AppTheme.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () => Get.to(() => JoinLeague(index: 0,)),
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        margin: const EdgeInsets.only(left: 5, right: 5),
                                        decoration: const BoxDecoration(
                                            color: AppTheme.green,
                                            borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: ListTile(
                                          leading: const Iconify(AppIcon.join),
                                          title: Text(
                                            "Join Public",
                                            style: GoogleFonts.mulish(
                                                color: AppTheme.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          },
                          child: const Iconify(
                            AppIcon.soc,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BottomNavItem(
                            title: "Squad",
                              isSelected: true,
                              iconData: AppIcon.squad,
                              onTap: () {}),
                          BottomNavItem(
                            title: "Transfer",
                              iconData: AppIcon.transfer, onTap: () {}),
                          Container(
                            width: size.width * 0.20,
                          ),
                          BottomNavItem(
                              title: "Stats",
                              iconData: AppIcon.stats, onTap: () {}),
                          BottomNavItem(
                            title: "More",
                              iconData: AppIcon.more, onTap: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, AppTheme.nearlyWhite, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
