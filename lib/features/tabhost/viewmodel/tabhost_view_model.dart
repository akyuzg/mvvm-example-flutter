import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_example_flutter/core/base/base_view_model.dart';

part 'tabhost_view_model.g.dart';

class TabHostViewModel = _TabHostModelBase with _$TabHostViewModel;

abstract class _TabHostModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
