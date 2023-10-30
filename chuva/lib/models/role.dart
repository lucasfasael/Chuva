import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'label.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  int? id;
  Label? label;

  Role({this.id, this.label});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Role) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode;
}
