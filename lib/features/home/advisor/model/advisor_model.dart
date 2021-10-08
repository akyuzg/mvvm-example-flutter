import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';

part 'advisor_model.g.dart';

@JsonSerializable()
class AdvisorModel extends BaseModel<AdvisorModel> {
  String? name;

  @JsonKey(name: "img_url")
  String? imgUrl;

  AdvisorModel({this.name, this.imgUrl});

  @override
  Map<String, dynamic> toJson() {
    return _$AdvisorModelToJson(this);
  }

  factory AdvisorModel.fromJson(Map<String, dynamic> json) {
    return _$AdvisorModelFromJson(json);
  }

  @override
  AdvisorModel fromJson(Map<String, Object?> json) {
    return _$AdvisorModelFromJson(json);
  }
}
