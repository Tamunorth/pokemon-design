// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonListModel _$PokemonListModelFromJson(Map<String, dynamic> json) {
  return _PokemonListModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonListModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonListModelCopyWith<PokemonListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListModelCopyWith<$Res> {
  factory $PokemonListModelCopyWith(
          PokemonListModel value, $Res Function(PokemonListModel) then) =
      _$PokemonListModelCopyWithImpl<$Res, PokemonListModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonListModelCopyWithImpl<$Res, $Val extends PokemonListModel>
    implements $PokemonListModelCopyWith<$Res> {
  _$PokemonListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListModelImplCopyWith<$Res>
    implements $PokemonListModelCopyWith<$Res> {
  factory _$$PokemonListModelImplCopyWith(_$PokemonListModelImpl value,
          $Res Function(_$PokemonListModelImpl) then) =
      __$$PokemonListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonListModelImplCopyWithImpl<$Res>
    extends _$PokemonListModelCopyWithImpl<$Res, _$PokemonListModelImpl>
    implements _$$PokemonListModelImplCopyWith<$Res> {
  __$$PokemonListModelImplCopyWithImpl(_$PokemonListModelImpl _value,
      $Res Function(_$PokemonListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonListModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListModelImpl extends _PokemonListModel {
  _$PokemonListModelImpl({required this.name, required this.url}) : super._();

  factory _$PokemonListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonListModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListModelImplCopyWith<_$PokemonListModelImpl> get copyWith =>
      __$$PokemonListModelImplCopyWithImpl<_$PokemonListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonListModel extends PokemonListModel {
  factory _PokemonListModel(
      {required final String name,
      required final String url}) = _$PokemonListModelImpl;
  _PokemonListModel._() : super._();

  factory _PokemonListModel.fromJson(Map<String, dynamic> json) =
      _$PokemonListModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$PokemonListModelImplCopyWith<_$PokemonListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
