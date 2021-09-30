import 'package:flutter/cupertino.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_example_flutter/features/main/view/main_view.dart';

import 'inavigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> mainNavigator = GlobalKey();

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.store: GlobalKey<NavigatorState>(),
    TabItem.campaign: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>()
  };

  String initialRouteForTabs(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return NavigationContants.TEST_WITH_BUTTON_VIEW;
      case TabItem.store:
        return NavigationContants.TEST_VIEW;
      case TabItem.campaign:
        return NavigationContants.TEST_WITH_BUTTON_VIEW;
      case TabItem.profile:
        return NavigationContants.TEST_VIEW;
      default:
        return NavigationContants.NOT_FOUND;
    }
  }

  



  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await mainNavigator.currentState!.pushNamed(path!, arguments: data);
  }

  Future<void> openApp() async {
    await mainNavigator.currentState?.pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => const MainView(),
      transitionDuration: Duration.zero,
    ));
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await mainNavigator.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
}
