import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/model/splash_data.dart';

part 'splash_response.g.dart';

@JsonSerializable()
class SplashResponse extends BaseModel<SplashResponse> {
  SplashData? data;
  SplashResponse({this.data});

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
