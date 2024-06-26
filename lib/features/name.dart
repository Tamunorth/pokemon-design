import 'package:freezed_annotation/freezed_annotation.dart';

part 'name.freezed.dart';
part 'name.g.dart';

@freezed
class Name with _$Name {
  factory Name({
    required String? name,
    required num age,
    String? car,
  }) = _Name;
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
