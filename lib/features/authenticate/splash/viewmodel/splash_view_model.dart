import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_example_flutter/core/base/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}