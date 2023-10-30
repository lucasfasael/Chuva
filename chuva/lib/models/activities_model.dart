import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';

part 'activities_model.g.dart';

@JsonSerializable()
class ActivitiesModel {
  int? count;
  Links? links;
  List<Datum>? data;

  ActivitiesModel({this.count, this.links, this.data});

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitiesModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActivitiesModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => count.hashCode ^ links.hashCode ^ data.hashCode;
}
