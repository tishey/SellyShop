
import 'package:flutter/material.dart';

class AppSizes {


static SizedBox addVerticalSpacing(double h) {
  return SizedBox(
    height: h,
  );
}

static SizedBox addHorizontalSpacing(double w) {
  return SizedBox(
    width: w,
  );
}

static screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

static screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

}