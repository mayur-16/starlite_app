import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  BuildContext getContext() {
    return navigationKey.currentState!.context;
  }

  pushNamedAndRemoveUntil(String rn, bool Function(Route<dynamic>) predicate, {Object? arguments}) {
    return navigationKey.currentState?.pushNamedAndRemoveUntil(rn, predicate, arguments: arguments);
  }

  pushAndRemoveUntil(Route<Object> rn, bool Function(Route<dynamic>) predicate) {
    return navigationKey.currentState?.pushAndRemoveUntil(rn, predicate);
  }

  pushReplacementNamed(String rn, {Object? arguments}) {
    return navigationKey.currentState?.pushReplacementNamed(rn, arguments: arguments);
  }

  pushReplacement(Route<Object> rn) {
    return navigationKey.currentState?.pushReplacement(rn);
  }

  pushNamed(String rn, {Object? arguments}) {
    return navigationKey.currentState?.pushNamed(rn, arguments: arguments);
  }

  push(Widget rn) {
    return navigationKey.currentState?.push(MaterialPageRoute(builder: (context) => rn));
  }

  pop() {
    return navigationKey.currentState?.pop();
  }
}
