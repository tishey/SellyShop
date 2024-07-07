import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellyshop/src/core/utils/app_color.dart';
import 'package:sellyshop/src/core/utils/app_gap.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSizes.screenWidth(context),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.appBrandColor),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.redHatDisplay(
                color: AppColor.whiteColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
