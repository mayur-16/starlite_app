
import 'package:flutter/material.dart';

import '../core/navigation_service.dart';

class Utils {
  Utils._();

  static void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(NavigationService.instance.getContext())
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

}
