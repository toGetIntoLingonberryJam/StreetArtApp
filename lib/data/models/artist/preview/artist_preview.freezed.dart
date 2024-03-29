// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtistPreview _$ArtistPreviewFromJson(Map<String, dynamic> json) {
  return _ArtistPreview.fromJson(json);
}

/// @nodoc
mixin _$ArtistPreview {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ImageModel? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistPreviewCopyWith<ArtistPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistPreviewCopyWith<$Res> {
  factory $ArtistPreviewCopyWith(
          ArtistPreview value, $Res Function(ArtistPreview) then) =
      _$ArtistPreviewCopyWithImpl<$Res, ArtistPreview>;
  @useResult
  $Res call({int id, String name, ImageModel? image});

  $ImageModelCopyWith<$Res>? get image;
}

/// @nodoc
class _$ArtistPreviewCopyWithImpl<$Res, $Val extends ArtistPreview>
    implements $ArtistPreviewCopyWith<$Res> {
  _$ArtistPreviewCopyWithImpl(this._value, this._then);

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
abstract class _$$ArtistPreviewImplCopyWith<$Res>
    implements $ArtistPreviewCopyWith<$Res> {
  factory _$$ArtistPreviewImplCopyWith(
          _$ArtistPreviewImpl value, $Res Function(_$ArtistPreviewImpl) then) =
      __$$ArtistPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, ImageModel? image});

  @override
  $ImageModelCopyWith<$Res>? get image;
}

/// @nodoc
class __$$ArtistPreviewImplCopyWithImpl<$Res>
    extends _$ArtistPreviewCopyWithImpl<$Res, _$ArtistPreviewImpl>
    implements _$$ArtistPreviewImplCopyWith<$Res> {
  __$$ArtistPreviewImplCopyWithImpl(
      _$ArtistPreviewImpl _value, $Res Function(_$ArtistPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_$ArtistPreviewImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistPreviewImpl implements _ArtistPreview {
  const _$ArtistPreviewImpl({required this.id, required this.name, this.image});

  factory _$ArtistPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistPreviewImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final ImageModel? image;

  @override
  String toString() {
    return 'ArtistPreview(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistPreviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistPreviewImplCopyWith<_$ArtistPreviewImpl> get copyWith =>
      __$$ArtistPreviewImplCopyWithImpl<_$ArtistPreviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistPreviewImplToJson(
      this,
    );
  }
}

abstract class _ArtistPreview implements ArtistPreview {
  const factory _ArtistPreview(
      {required final int id,
      required final String name,
      final ImageModel? image}) = _$ArtistPreviewImpl;

  factory _ArtistPreview.fromJson(Map<String, dynamic> json) =
      _$ArtistPreviewImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  ImageModel? get image;
  @override
  @JsonKey(ignore: true)
  _$$ArtistPreviewImplCopyWith<_$ArtistPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
