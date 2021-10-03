import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_example_flutter/features/_product/tabnavigator/bottom_navigation.dart';
import 'package:mvvm_example_flutter/features/_product/tabnavigator/tab_navigator.dart';
import 'package:mvvm_example_flutter/features/main/viewmodel/main_view_model.dart';

class _MainView extends State<MainView> {
  var navigationService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
        viewModel: MainViewModel(),
        onModelReady: (vm) {
          vm.setContext(context);
          vm.init();
        },
        onPageBuilder: (BuildContext context, MainViewModel viewModel) =>
            WillPopScope(
              onWillPop: _onWillPop,
              child: _buildScaffold(),
            ));
  }

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab = !await navigationService
        .navigatorKeys[navigationService.currentTab]!.currentState!
        .maybePop();
    if (isFirstRouteInCurrentTab) {
      // if not on the 'main' tab
      if (navigationService.currentTab != TabItem.home) {
        // select 'main' tab
        _selectTab(TabItem.home);
        // back button handled by app
        return false;
      }
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      body: _buildTabContainers(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Stack _buildTabContainers() {
    return Stack(children: [
      _buildOffstageNavigator(TabItem.home),
      _buildOffstageNavigator(TabItem.store),
      _buildOffstageNavigator(TabItem.campaign),
      _buildOffstageNavigator(TabItem.profile),
    ]);
  }

  BottomNavigation _buildBottomNavigation() {
    return BottomNavigation(
      currentTab: navigationService.currentTab,
      onSelectTab: _selectTab,
    );
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == navigationService.currentTab) {
      // pop to first route
      navigationService.navigatorKeys[tabItem]!.currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() => navigationService.currentTab = tabItem);
    }
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: navigationService.currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigationService.navigatorKeys[tabItem],
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
