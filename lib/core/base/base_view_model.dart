import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
  NetworkManager networkManager = NetworkManager.getInstance();

  late BuildContext context;
  void setContext(BuildContext context);
  void init();
}
