import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel{

  NavigationService navigation = NavigationService.instance;

  late BuildContext context;
  void setContext(BuildContext context);
  void init();
}