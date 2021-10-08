import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_example_flutter/core/base/base_view_model.dart';

part 'advisor_item_viewmodel.g.dart';

class AdvisorItemViewModel = _AdvisorItemViewModelBase
    with _$AdvisorItemViewModel;

abstract class _AdvisorItemViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
