import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_example_flutter/features/_product/common/not_found_navigation_widget.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/view/splash_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return navigate(const SplashView());
      default:
       return navigate(const NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute navigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
