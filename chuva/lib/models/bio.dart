import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bio.g.dart';

@JsonSerializable()
class Bio {
  @JsonKey(name: 'pt-br')
  String? ptBr;

  Bio({this.ptBr});

  factory Bio.fromJson(Map<String, dynamic> json) => _$BioFromJson(json);

  Map<String, dynamic> toJson() => _$BioToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Bio) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => ptBr.hashCode;
}
