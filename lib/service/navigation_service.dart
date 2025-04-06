import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  //تابع ساخته شده برای جایه جایی بین صفحات

  navigate(Widget widget) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  navigateReplace(Widget widget) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  navigateBack(Widget widget) {
    return navigatorKey.currentState?.pop(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<void> showDialog(
    // BuildContext? context,
    Widget widget,
  ) async {
    await showAdaptiveDialog(
      barrierDismissible: true,
      context:
          // context ??
          navigatorKey.currentContext!,
      builder: (context) => widget,
    );
  }

  void showSnackBar(message) {
    final context = navigatorKey.currentContext!;

    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    final snackBarWidget = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.amber)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarWidget);
  }
}
