import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'description.dart';
import 'location.dart';
import 'person.dart';
import 'title.dart';
import 'type.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  int? changed;
  String? start;
  String? end;
  Title? title;
  Description? description;
  Category? category;
  List<Location>? locations;
  Type? type;
  List<dynamic>? papers;
  List<Person>? people;
  int? status;
  int? weight;
  dynamic addons;
  dynamic parent;
  String? event;

  Datum({
    this.id,
    this.changed,
    this.start,
    this.end,
    this.title,
    this.description,
    this.category,
    this.locations,
    this.type,
    this.papers,
    this.people,
    this.status,
    this.weight,
    this.addons,
    this.parent,
    this.event,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      changed.hashCode ^
      start.hashCode ^
      end.hashCode ^
      title.hashCode ^
      description.hashCode ^
      category.hashCode ^
      locations.hashCode ^
      type.hashCode ^
      papers.hashCode ^
      people.hashCode ^
      status.hashCode ^
      weight.hashCode ^
      addons.hashCode ^
      parent.hashCode ^
      event.hashCode;
}
