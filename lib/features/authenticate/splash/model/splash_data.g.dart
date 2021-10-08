// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashData _$SplashDataFromJson(Map<String, dynamic> json) {
  return SplashData(
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
  )..status = json['status'] as int?;
}

Map<String, dynamic> _$SplashDataToJson(SplashData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
