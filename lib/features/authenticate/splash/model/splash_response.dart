import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_response_model.dart';
part 'splash_response.g.dart';

@JsonSerializable()
class SplashResponse extends BaseResponse {
  SplashResponse();

  @override
  Map<String, dynamic> toJson() {
    return _$SplashResponseToJson(this);
  }

  factory SplashResponse.fromJson(Map<String, dynamic> json) {
    return _$SplashResponseFromJson(json);
  }

  @override
  SplashResponse fromJson(Map<String, Object?> json) {
    return _$SplashResponseFromJson(json);
  }
}
