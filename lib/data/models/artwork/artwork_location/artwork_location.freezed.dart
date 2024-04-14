// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkLocation _$ArtworkLocationFromJson(Map<String, dynamic> json) {
  return _ArtworkLocation.fromJson(json);
}

/// @nodoc
mixin _$ArtworkLocation {
  int get artworkId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get address =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'thumbnail_image')
  String? get previewUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtworkLocationCopyWith<ArtworkLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkLocationCopyWith<$Res> {
  factory $ArtworkLocationCopyWith(
          ArtworkLocation value, $Res Function(ArtworkLocation) then) =
      _$ArtworkLocationCopyWithImpl<$Res, ArtworkLocation>;
  @useResult
  $Res call(
      {int artworkId,
      double latitude,
      double longitude,
      String address,
      @JsonKey(name: 'thumbnail_image') String? previewUrl});
}

/// @nodoc
class _$ArtworkLocationCopyWithImpl<$Res, $Val extends ArtworkLocation>
    implements $ArtworkLocationCopyWith<$Res> {
  _$ArtworkLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artworkId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? previewUrl = freezed,
  }) {
    return _then(_value.copyWith(
      artworkId: null == artworkId
          ? _value.artworkId
          : artworkId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtworkLocationImplCopyWith<$Res>
    implements $ArtworkLocationCopyWith<$Res> {
  factory _$$ArtworkLocationImplCopyWith(_$ArtworkLocationImpl value,
          $Res Function(_$ArtworkLocationImpl) then) =
      __$$ArtworkLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int artworkId,
      double latitude,
      double longitude,
      String address,
      @JsonKey(name: 'thumbnail_image') String? previewUrl});
}

/// @nodoc
class __$$ArtworkLocationImplCopyWithImpl<$Res>
    extends _$ArtworkLocationCopyWithImpl<$Res, _$ArtworkLocationImpl>
    implements _$$ArtworkLocationImplCopyWith<$Res> {
  __$$ArtworkLocationImplCopyWithImpl(
      _$ArtworkLocationImpl _value, $Res Function(_$ArtworkLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artworkId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? previewUrl = freezed,
  }) {
    return _then(_$ArtworkLocationImpl(
      artworkId: null == artworkId
          ? _value.artworkId
          : artworkId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkLocationImpl extends _ArtworkLocation {
  const _$ArtworkLocationImpl(
      {required this.artworkId,
      required this.latitude,
      required this.longitude,
      required this.address,
      @JsonKey(name: 'thumbnail_image') required this.previewUrl})
      : super._();

  factory _$ArtworkLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkLocationImplFromJson(json);

  @override
  final int artworkId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String address;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'thumbnail_image')
  final String? previewUrl;

  @override
  String toString() {
    return 'ArtworkLocation(artworkId: $artworkId, latitude: $latitude, longitude: $longitude, address: $address, previewUrl: $previewUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkLocationImpl &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, artworkId, latitude, longitude, address, previewUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkLocationImplCopyWith<_$ArtworkLocationImpl> get copyWith =>
      __$$ArtworkLocationImplCopyWithImpl<_$ArtworkLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkLocationImplToJson(
      this,
    );
  }
}

abstract class _ArtworkLocation extends ArtworkLocation {
  const factory _ArtworkLocation(
      {required final int artworkId,
      required final double latitude,
      required final double longitude,
      required final String address,
      @JsonKey(name: 'thumbnail_image')
      required final String? previewUrl}) = _$ArtworkLocationImpl;
  const _ArtworkLocation._() : super._();

  factory _ArtworkLocation.fromJson(Map<String, dynamic> json) =
      _$ArtworkLocationImpl.fromJson;

  @override
  int get artworkId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get address;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'thumbnail_image')
  String? get previewUrl;
  @override
  @JsonKey(ignore: true)
  _$$ArtworkLocationImplCopyWith<_$ArtworkLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
