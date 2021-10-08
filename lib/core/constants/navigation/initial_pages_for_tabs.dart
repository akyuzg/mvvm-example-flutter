import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/features/_product/common/test_page_widget.dart';
import 'package:mvvm_example_flutter/features/_product/common/test_page_with_button.dart';
import 'package:mvvm_example_flutter/features/home/view/home_view.dart';

class InitialPages {
  static const Map<TabItem, Widget> _pages = {
    TabItem.home: HomeView(),
    TabItem.store: TestPageWidget(),
    TabItem.campaign: TestPageWithButtonWidget(),
    TabItem.profile: TestPageWithButtonWidget()
  };

  static getPage(TabItem item) => _pages[item];
}
