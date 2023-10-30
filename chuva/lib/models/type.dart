import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'title.dart';

part 'type.g.dart';

@JsonSerializable()
class Type {
  int? id;
  Title? title;

  Type({this.id, this.title});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Type) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
