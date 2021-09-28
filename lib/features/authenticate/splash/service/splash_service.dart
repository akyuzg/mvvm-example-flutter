import 'package:dio/dio.dart';
import 'package:mvvm_example_flutter/core/constants/network/network_contants.dart';
import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/model/splash_response.dart';

class SplashService {
  NetworkManager networkManager;

  SplashService(this.networkManager);

  Future<SplashResponse?> getSplash() async {
    Response raw = await networkManager.dio!.get(NetworkConstants.SPLASH);
    SplashResponse response = SplashResponse.fromJson(raw.data);
    return response;
  }
}
