// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advisors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvisorsResponse _$AdvisorsResponseFromJson(Map<String, dynamic> json) {
  return AdvisorsResponse(
    advisors: (json['tellers'] as List<dynamic>?)
        ?.map((e) => AdvisorModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..status = json['status'] as int?;
}

Map<String, dynamic> _$AdvisorsResponseToJson(AdvisorsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'tellers': instance.advisors,
    };
