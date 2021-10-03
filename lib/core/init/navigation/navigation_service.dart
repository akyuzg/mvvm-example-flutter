import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/features/tabhost/view/tabhost_view.dart';
import 'inavigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> mainNavigator = GlobalKey();

  var currentTab = TabItem.home;

  final navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.store: GlobalKey<NavigatorState>(),
    TabItem.campaign: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;
  NavigatorState get _currentTabState =>
      navigatorKeys[currentTab]!.currentState!;
  GlobalKey<NavigatorState> get currentTabNavigatorKey =>
      navigatorKeys[currentTab]!;

  Future<bool> get isFirstRouteInTheCurrentTab => _currentTabState.maybePop();

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await _currentTabState.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> openPage({String? path, Object? data}) async {
    await mainNavigator.currentState!.pushNamed(path!, arguments: data);
  }

  Future<void> openApp() async {
    await mainNavigator.currentState?.pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => const TabHostView(),
      transitionDuration: Duration.zero,
    ));
  }

  popToFirstRouteInTheCurrentTab() {
    _currentTabState.popUntil((route) => route.isFirst);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await mainNavigator.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
}
