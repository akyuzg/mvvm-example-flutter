import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_example_flutter/core/base/base_model.dart';

part 'teller.g.dart';

@JsonSerializable()
class Teller extends BaseModel<Teller>{
  String? name;
  Teller({this.name});

  Teller.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
  }

@override
  Map<String, dynamic> toJson() {
    return _$TellerToJson(this);
  }

@override
  Teller fromJson(Map<String, Object?> json) {
    return _$TellerFromJson(json);
  }
}