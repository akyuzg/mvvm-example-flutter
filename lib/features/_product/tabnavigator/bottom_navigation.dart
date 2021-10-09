import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/bottom_navigation_constants.dart';
import 'package:mvvm_example_flutter/core/extensions/string_extension.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(context, TabItem.home),
        _buildItem(context, TabItem.store),
        _buildItem(context, TabItem.campaign),
        _buildItem(context, TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: Theme.of(context).primaryColor,
    );
  }

  BottomNavigationBarItem _buildItem(BuildContext context, TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: SizedBox(
          key: Key(tabIcons[tabItem] ?? "TabKey"),
          width: 32,
          height: 32,
          child: SvgPicture.asset(tabIcons[tabItem]!.toSVG,
              color: currentTab == tabItem
                  ? Theme.of(context).primaryColor
                  : Colors.grey)),
      label: tabName[tabItem],
    );
  }
}
