import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'title.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  Title? title;
  String? color;
  @JsonKey(name: 'background-color')
  String? backgroundColor;

  Category({this.id, this.title, this.color, this.backgroundColor});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Category) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ color.hashCode ^ backgroundColor.hashCode;
}
