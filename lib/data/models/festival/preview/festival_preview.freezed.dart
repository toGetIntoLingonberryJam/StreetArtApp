// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'festival_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FestivalPreview _$FestivalPreviewFromJson(Map<String, dynamic> json) {
  return _FestivalPreview.fromJson(json);
}

/// @nodoc
mixin _$FestivalPreview {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ImageModel? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FestivalPreviewCopyWith<FestivalPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FestivalPreviewCopyWith<$Res> {
  factory $FestivalPreviewCopyWith(
          FestivalPreview value, $Res Function(FestivalPreview) then) =
      _$FestivalPreviewCopyWithImpl<$Res, FestivalPreview>;
  @useResult
  $Res call({int id, String name, ImageModel? image});

  $ImageModelCopyWith<$Res>? get image;
}

/// @nodoc
class _$FestivalPreviewCopyWithImpl<$Res, $Val extends FestivalPreview>
    implements $FestivalPreviewCopyWith<$Res> {
  _$FestivalPreviewCopyWithImpl(this._value, this._then);

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
abstract class _$$FestivalPreviewImplCopyWith<$Res>
    implements $FestivalPreviewCopyWith<$Res> {
  factory _$$FestivalPreviewImplCopyWith(_$FestivalPreviewImpl value,
          $Res Function(_$FestivalPreviewImpl) then) =
      __$$FestivalPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, ImageModel? image});

  @override
  $ImageModelCopyWith<$Res>? get image;
}

/// @nodoc
class __$$FestivalPreviewImplCopyWithImpl<$Res>
    extends _$FestivalPreviewCopyWithImpl<$Res, _$FestivalPreviewImpl>
    implements _$$FestivalPreviewImplCopyWith<$Res> {
  __$$FestivalPreviewImplCopyWithImpl(
      _$FestivalPreviewImpl _value, $Res Function(_$FestivalPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_$FestivalPreviewImpl(
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
class _$FestivalPreviewImpl implements _FestivalPreview {
  const _$FestivalPreviewImpl(
      {required this.id, required this.name, this.image});

  factory _$FestivalPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$FestivalPreviewImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final ImageModel? image;

  @override
  String toString() {
    return 'FestivalPreview(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FestivalPreviewImpl &&
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
  _$$FestivalPreviewImplCopyWith<_$FestivalPreviewImpl> get copyWith =>
      __$$FestivalPreviewImplCopyWithImpl<_$FestivalPreviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FestivalPreviewImplToJson(
      this,
    );
  }
}

abstract class _FestivalPreview implements FestivalPreview {
  const factory _FestivalPreview(
      {required final int id,
      required final String name,
      final ImageModel? image}) = _$FestivalPreviewImpl;

  factory _FestivalPreview.fromJson(Map<String, dynamic> json) =
      _$FestivalPreviewImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  ImageModel? get image;
  @override
  @JsonKey(ignore: true)
  _$$FestivalPreviewImplCopyWith<_$FestivalPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
