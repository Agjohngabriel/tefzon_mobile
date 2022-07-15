import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:tefzon/utils/colors.dart';

class BottomNavItem extends StatelessWidget {
  final String iconData;
  final VoidCallback onTap;
  final bool isSelected;
  String title;
  BottomNavItem(
      {required this.iconData,
      required this.onTap,
      this.isSelected = false,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Iconify(
                iconData,
                size: 25,
              ),
              onPressed: onTap,
            ),
            Center(
              child: Text(
                title,
                style: GoogleFonts.mulish(color: AppTheme.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
