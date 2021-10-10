import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_example_flutter/core/base/base_view_model.dart';
import 'package:mvvm_example_flutter/core/constants/network/response_contants.dart';
import 'package:mvvm_example_flutter/features/home/advisor/model/advisor_model.dart';
import 'package:mvvm_example_flutter/features/home/model/response/advisors_response.dart';
import 'package:mvvm_example_flutter/features/home/service/home_service.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late HomeService homeService;

  @observable
  List<AdvisorModel>? advisors = [];

  @observable
  String? errorMesage;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    homeService = HomeService(networkManager);
    getListAll();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    AdvisorsResponse response = await homeService.fetchAdvisors();

    if (response.status == ResponseStatus.OK) {
      advisors = response.advisors;
    }
    errorMesage = response.message;
    _changeLoading();
  }
}
