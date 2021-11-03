import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';
import 'package:mvvm_example_flutter/core/base/base_response_model.dart';
import 'package:mvvm_example_flutter/core/constants/network/network_contants.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    _instance ?? NetworkManager._init();
    return _instance;
  }

  Future<dynamic> get<T extends BaseResponse>(
      {required String path, required T model}) async {
    try {
      Response raw = (await dio.get(path));
      return _parseModel(model, raw.data);
    } on DioError catch (e) {
      return _parseModel(model, decodeErrorResponse(e));
    }
  }

  T _parseModel<T extends BaseResponse>(T model, dynamic data) {
    return model.fromJson(data) as T;
  }

  factory NetworkManager.getInstance() {
    var obj = NetworkManager._init();
    _instance = obj;
    return obj;
  }

  late final Dio dio;

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: NetworkConstants.baseUrl, headers: {});
    dio = Dio(baseOptions);
  }

  dynamic decodeErrorResponse(dynamic e) {
    var data = {"status": -1, "message": "Unknown Error"};
    if (e is DioError) {
      if (e.type == DioErrorType.response) {
        final response = e.response;
        try {
          if (response != null && response.data != null) {
            final Map responseData =
                json.decode(response.data as String) as Map;
            data["message"] = responseData['message'] as String;
            data["status"] = response.statusCode!;
          }
        } catch (e) {
          data["message"] = "Internal Error Catch";
        }
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        data["message"] = "Request timeout";
        data["status"] = 408;
      } else if (e.error is SocketException) {
        data["message"] = "No Internet Connection!";
      }
    }
    return data;
  }
}
