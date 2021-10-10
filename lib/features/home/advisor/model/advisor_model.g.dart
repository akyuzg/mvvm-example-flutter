// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advisor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvisorModel _$AdvisorModelFromJson(Map<String, dynamic> json) {
  return AdvisorModel(
    name: json['name'] as String?,
    imgUrl: json['img_url'] as String?,
  );
}

Map<String, dynamic> _$AdvisorModelToJson(AdvisorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'img_url': instance.imgUrl,
    };
