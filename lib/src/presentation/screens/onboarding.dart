import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellyshop/src/core/navigator/app_navigator.dart';
import 'package:sellyshop/src/core/utils/app_gap.dart';
import 'package:sellyshop/src/core/utils/app_images.dart';
import 'package:sellyshop/src/core/widget/app_button_widget.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AppImages.onboardingShor),
            Text(
              'Summer Collection',
              style: GoogleFonts.redHatDisplay(
                  fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              'Get the best fit sneaker of male and females shoe at affordable price without breaking the bank',
              style: GoogleFonts.redHatDisplay(fontSize: 14),
            ),
            AppSizes.addVerticalSpacing(100),
            AppPrimaryButton(
              onTap: () {
                AppNavigator.pushAndRemoveUtil(const HomeScreen());
              },
              label: 'Get Started',
            )
          ],
        ),
      ),
    );
  }
}
