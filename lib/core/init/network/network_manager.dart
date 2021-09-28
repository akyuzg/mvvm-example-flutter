import 'package:dio/dio.dart';
import 'package:mvvm_example_flutter/core/constants/network/network_contants.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    _instance ?? NetworkManager._init();
    return _instance;
  }

  factory NetworkManager.getInstance() {
    var obj = NetworkManager._init();
    _instance = obj;
    return obj;
  }

  Dio? dio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: NetworkConstants.BASE_URL, headers: {});
    dio = Dio(baseOptions);
  }

}