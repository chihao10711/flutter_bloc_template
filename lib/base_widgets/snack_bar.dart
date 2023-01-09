import 'package:flutter/material.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  SnackBar snackBar,
) {
  return scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageSnackBar(
  String? title,
) {
  final snackBar = SnackBar(
    content: Text(
      title ?? 'Ops! Something went wrong!',
      textAlign: TextAlign.center,
    ),
  );
  return scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageSnackBars(
  List<String>? titles,
) {
  late String title;
  if (titles == null || titles.isEmpty) {
    title = 'Ops! Something went wrong!';
  } else {
    title = titles.join("\n");
  }
  final snackBar = SnackBar(
    content: Text(
      title,
      textAlign: TextAlign.center,
    ),
  );
  return scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
}
