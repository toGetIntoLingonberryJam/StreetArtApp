// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'festival.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Festival _$FestivalFromJson(Map<String, dynamic> json) {
  return _Festival.fromJson(json);
}

/// @nodoc
mixin _$Festival {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ImageModel? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FestivalCopyWith<Festival> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FestivalCopyWith<$Res> {
  factory $FestivalCopyWith(Festival value, $Res Function(Festival) then) =
      _$FestivalCopyWithImpl<$Res, Festival>;
  @useResult
  $Res call(
      {int id,
      String name,
      ImageModel? image,
      String? description,
      List<String>? links});

  $ImageModelCopyWith<$Res>? get image;
}

/// @nodoc
class _$FestivalCopyWithImpl<$Res, $Val extends Festival>
    implements $FestivalCopyWith<$Res> {
  _$FestivalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageModelCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FestivalImplCopyWith<$Res>
    implements $FestivalCopyWith<$Res> {
  factory _$$FestivalImplCopyWith(
          _$FestivalImpl value, $Res Function(_$FestivalImpl) then) =
      __$$FestivalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      ImageModel? image,
      String? description,
      List<String>? links});

  @override
  $ImageModelCopyWith<$Res>? get image;
}

/// @nodoc
class __$$FestivalImplCopyWithImpl<$Res>
    extends _$FestivalCopyWithImpl<$Res, _$FestivalImpl>
    implements _$$FestivalImplCopyWith<$Res> {
  __$$FestivalImplCopyWithImpl(
      _$FestivalImpl _value, $Res Function(_$FestivalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? links = freezed,
  }) {
    return _then(_$FestivalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FestivalImpl implements _Festival {
  const _$FestivalImpl(
      {required this.id,
      required this.name,
      required this.image,
      this.description,
      final List<String>? links})
      : _links = links;

  factory _$FestivalImpl.fromJson(Map<String, dynamic> json) =>
      _$$FestivalImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final ImageModel? image;
  @override
  final String? description;
  final List<String>? _links;
  @override
  List<String>? get links {
    final value = _links;
    if (value == null) return null;
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Festival(id: $id, name: $name, image: $image, description: $description, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FestivalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, description,
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FestivalImplCopyWith<_$FestivalImpl> get copyWith =>
      __$$FestivalImplCopyWithImpl<_$FestivalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FestivalImplToJson(
      this,
    );
  }
}

abstract class _Festival implements Festival {
  const factory _Festival(
      {required final int id,
      required final String name,
      required final ImageModel? image,
      final String? description,
      final List<String>? links}) = _$FestivalImpl;

  factory _Festival.fromJson(Map<String, dynamic> json) =
      _$FestivalImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  ImageModel? get image;
  @override
  String? get description;
  @override
  List<String>? get links;
  @override
  @JsonKey(ignore: true)
  _$$FestivalImplCopyWith<_$FestivalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
