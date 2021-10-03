import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/initial_pages_for_tabs.dart';
import 'package:mvvm_example_flutter/features/_product/common/not_found_navigation_widget.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);

  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    final initialPageForTab = InitialPages.getPage(tabItem);

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) =>
                initialPageForTab ?? const NotFoundNavigationWidget());
      },
    );
  }
}
