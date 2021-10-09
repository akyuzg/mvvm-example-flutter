import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel<BaseResponse> {
  int? status;
  String? message;

  BaseResponse({this.status, this.message});

  @override
  Map<String, dynamic> toJson() {
    return _$BaseResponseToJson(this);
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseFromJson(json);
  }

  @override
  BaseResponse fromJson(Map<String, Object?> json) {
    return _$BaseResponseFromJson(json);
  }
}
