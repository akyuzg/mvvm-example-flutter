import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_example_flutter/features/_product/common/test_page_widget.dart';
import 'package:mvvm_example_flutter/features/_product/common/test_page_with_button.dart';

class TabNavigator extends StatelessWidget {
  
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;



  ValueChanged<int>? _push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return TestPageWidget();
      }),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      NavigationContants.TEST_WITH_BUTTON_VIEW: (context) =>
          TestPageWithButtonWidget(
            onPush: (aa) => _push(context),
          ),
      NavigationContants.TEST_VIEW: (context) => TestPageWidget()
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: NavigationService.instance.initialRouteForTabs(tabItem),
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
