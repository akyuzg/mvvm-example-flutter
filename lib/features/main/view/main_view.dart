import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/features/_product/tabnavigator/bottom_navigation.dart';
import 'package:mvvm_example_flutter/features/_product/tabnavigator/tab_navigator.dart';
import 'package:mvvm_example_flutter/features/main/viewmodel/main_view_model.dart';

class _MainView extends State<MainView> {
  //const _MainView({Key? key}) : super(key: key);

  TabItem _currentTab = TabItem.home;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.store: GlobalKey<NavigatorState>(),
    TabItem.campaign: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>()
  };

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
        viewModel: MainViewModel(),
        onModelReady: (vm) {
          vm.setContext(context);
          vm.init();
        },
        onPageBuilder: (BuildContext context, MainViewModel viewModel) =>
            buildWillPopScope(viewModel));
  }

  //For Android back button
  Widget buildWillPopScope(MainViewModel vm) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await navigatorKeys[_currentTab]!.currentState!.maybePop();
          if (isFirstRouteInCurrentTab) {
            // if not on the 'main' tab
            if (_currentTab != TabItem.home) {
              // select 'main' tab
              _selectTab(TabItem.home);
              // back button handled by app
              return false;
            }
          }
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: buildScaffold(context, vm));
  }

  Widget buildScaffold(BuildContext context, MainViewModel viewModel) {
    return Scaffold(
      body: Stack(children: [
        _buildOffstageNavigator(context, TabItem.home),
        _buildOffstageNavigator(context, TabItem.store),
        _buildOffstageNavigator(context, TabItem.campaign),
        _buildOffstageNavigator(context, TabItem.profile),
      ]),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  Widget _buildOffstageNavigator(BuildContext context, TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainView();
}
