// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashResponse _$SplashResponseFromJson(Map<String, dynamic> json) {
  return SplashResponse(
    data: json['data'] == null
        ? null
        : SplashData.fromJson((json['data'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, e as Object),
          )),
  );
}

Map<String, dynamic> _$SplashResponseToJson(SplashResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
