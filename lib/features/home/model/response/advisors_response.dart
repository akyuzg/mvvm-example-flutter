import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';
import 'package:mvvm_example_flutter/features/home/advisor/model/advisor_model.dart';

part 'advisors_response.g.dart';

@JsonSerializable()
class AdvisorsResponse extends BaseModel<AdvisorsResponse> {
  int? status;
  @JsonKey(name: "tellers")
  List<AdvisorModel>? advisors;

  AdvisorsResponse({this.status, this.advisors});

  @override
  Map<String, dynamic> toJson() {
    return _$AdvisorsResponseToJson(this);
  }

  factory AdvisorsResponse.fromJson(Map<String, dynamic> json) {
    return _$AdvisorsResponseFromJson(json);
  }

  @override
  AdvisorsResponse fromJson(Map<String, Object?> json) {
    return _$AdvisorsResponseFromJson(json);
  }
}
