import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/features/_product/tabnavigator/bottom_navigation.dart';
import 'package:mvvm_example_flutter/features/_product/tabnavigator/tab_navigator.dart';
import 'package:mvvm_example_flutter/features/tabhost/viewmodel/tabhost_view_model.dart';

class TabHostView extends StatefulWidget {
  const TabHostView({Key? key}) : super(key: key);

  @override
  State<TabHostView> createState() => _TabHostView();
}

class _TabHostView extends State<TabHostView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TabHostViewModel>(
        viewModel: TabHostViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (BuildContext context, TabHostViewModel viewModel) =>
            WillPopScope(
              onWillPop: () => _onWillPop(viewModel),
              child: _buildScaffold(viewModel),
            ));
  }

  Scaffold _buildScaffold(TabHostViewModel viewModel) {
    return Scaffold(
      body: _buildTabContainers(viewModel),
      bottomNavigationBar: _buildBottomNavigation(viewModel),
    );
  }

  BottomNavigation _buildBottomNavigation(TabHostViewModel viewModel) {
    return BottomNavigation(
      currentTab: viewModel.navigation.currentTab,
      onSelectTab: (TabItem tabItem) => _selectTab(viewModel, tabItem),
    );
  }

  _selectTab(TabHostViewModel viewModel, TabItem tabItem) {
    if (tabItem == viewModel.navigation.currentTab) {
      viewModel.navigation.popToFirstRouteInTheCurrentTab();
    } else {
      setState(() => viewModel.navigation.currentTab = tabItem);
    }
  }

  Stack _buildTabContainers(TabHostViewModel viewModel) {
    return Stack(children: [
      _buildOffstageNavigator(viewModel, TabItem.home),
      _buildOffstageNavigator(viewModel, TabItem.store),
      _buildOffstageNavigator(viewModel, TabItem.campaign),
      _buildOffstageNavigator(viewModel, TabItem.profile),
    ]);
  }

  Widget _buildOffstageNavigator(TabHostViewModel viewModel, tabItem) {
    return Offstage(
      offstage: viewModel.navigation.currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: viewModel.navigation.currentTabNavigatorKey,
        tabItem: tabItem,
      ),
    );
  }

  Future<bool> _onWillPop(TabHostViewModel viewModel) async {
    final isFirstRouteInCurrentTab =
        await viewModel.navigation.isFirstRouteInTheCurrentTab;
    // if not on the 'main' tab
    if (isFirstRouteInCurrentTab &&
        viewModel.navigation.currentTab != TabItem.home) {
      _selectTab(viewModel, TabItem.home);
      // back button handled by app
      return false;
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }
}
