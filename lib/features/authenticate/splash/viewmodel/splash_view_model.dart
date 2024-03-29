import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_example_flutter/core/base/base_view_model.dart';
import 'package:mvvm_example_flutter/core/init/cache/asset_cache_manager.dart';
import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/service/splash_service.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  SplashService service = SplashService(NetworkManager.getInstance());

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    AssetCacheManager.instance.loadAssets();
    fetchSplash();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      navigation.openApp();
    });
  }

  Future<void> fetchSplash() async {
    // TODO splash service
    //SplashResponse response = await service.getSplash();

    //print(response?.data?.firstName);
  }
}
