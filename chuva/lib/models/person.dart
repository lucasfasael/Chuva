import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bio.dart';
import 'role.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  int? id;
  String? title;
  String? name;
  String? institution;
  Bio? bio;
  String? picture;
  int? weight;
  Role? role;
  String? hash;

  Person({
    this.id,
    this.title,
    this.name,
    this.institution,
    this.bio,
    this.picture,
    this.weight,
    this.role,
    this.hash,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return _$PersonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Person) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      name.hashCode ^
      institution.hashCode ^
      bio.hashCode ^
      picture.hashCode ^
      weight.hashCode ^
      role.hashCode ^
      hash.hashCode;
}
