import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
class AppNavigator {
  AppNavigator._();

  static final AppNavigator instance = AppNavigator._();
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext appContext = navigatorKey!.currentContext!;



  static Future push(dynamic routeClass) {
    return Navigator.push(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }


  static void pushAndRemoveUtil(dynamic routeClass) {
    Navigator.pushAndRemoveUntil(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
  }


  static BuildContext get currentContext => navigatorKey!.currentState!.context;

  static bool get canPop => navigatorKey!.currentState!.canPop();



  static Future<bool> maybePop([result]) {
    return navigatorKey!.currentState!.maybePop(result);
  }

  static void pop([result]) {
    if (canPop) return navigatorKey!.currentState!.pop(result);
  }

  
}
