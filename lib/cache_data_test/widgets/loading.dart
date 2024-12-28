import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading() async {
  EasyLoading.show(status: "Please wait...");

  await Future.delayed(
    const Duration(seconds: 2),
  );

  EasyLoading.dismiss();
}

// apply just for success
Future<void> showSuccess() async {
  EasyLoading.instance
    ..backgroundColor = Colors.green
    ..textColor = Colors.white
    ..indicatorColor = Colors.white;

  EasyLoading.showSuccess("Success!");

  await Future.delayed(
    const Duration(seconds: 2),
  );

  EasyLoading.dismiss();
}

// apply just for error
Future<void> showError() async {
  EasyLoading.instance
    ..backgroundColor = Colors.red
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..radius = 5;

  EasyLoading.showError("Error occurred!");

  await Future.delayed(
    const Duration(seconds: 2),
  );

  EasyLoading.dismiss();
}

// Show toast in the top-right corner
void showTopToast() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.indigo
    ..textColor = Colors.white
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..userInteractions = true // Allow user interactions during toast
    ..dismissOnTap = true;

  EasyLoading.showToast(
    "This is a toast",
    duration: const Duration(seconds: 2),
  );
}

// calls before running app to apply all usage of loading in entire app
void configureEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..textColor = Colors.black
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false; // Prevent user interactions during loading
}
