import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';

part 'teller_model.g.dart';

@JsonSerializable()
class TellerModel extends BaseModel<TellerModel>{
  String? name;
  TellerModel({this.name});

  TellerModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
  }

@override
  Map<String, dynamic> toJson() {
    return _$TellerModelToJson(this);
  }

@override
  TellerModel fromJson(Map<String, Object?> json) {
    return _$TellerModelFromJson(json);
  }
}