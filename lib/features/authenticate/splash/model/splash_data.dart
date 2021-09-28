import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';

part 'splash_data.g.dart';

@JsonSerializable()
class SplashData extends BaseModel<SplashData> {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  SplashData({this.firstName, this.lastName});

  @override
  Map<String, dynamic> toJson() {
    return _$SplashDataToJson(this);
  }
  
  factory SplashData.fromJson(Map<String, Object> json) {
    return _$SplashDataFromJson(json);
  }

  @override
  SplashData fromJson(Map<String, Object?> json) {
    return _$SplashDataFromJson(json);
  }
}
