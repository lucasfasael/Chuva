// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitiesModel _$ActivitiesModelFromJson(Map<String, dynamic> json) =>
    ActivitiesModel(
      count: json['count'] as int?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivitiesModelToJson(ActivitiesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'links': instance.links,
      'data': instance.data,
    };
