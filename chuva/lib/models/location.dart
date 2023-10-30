import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'title.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  int? id;
  Title? title;
  int? parent;
  dynamic map;

  Location({this.id, this.title, this.parent, this.map});

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Location) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ parent.hashCode ^ map.hashCode;
}
