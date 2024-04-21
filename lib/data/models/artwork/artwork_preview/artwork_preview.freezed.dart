// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkPreview _$ArtworkPreviewFromJson(Map<String, dynamic> json) {
  return _ArtworkPreview.fromJson(json);
}

/// @nodoc
mixin _$ArtworkPreview {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist')
  ArtistPreview? get artistPreview => throw _privateConstructorUsedError;
  @JsonKey(name: 'festival')
  FestivalPreview? get festivalPreview => throw _privateConstructorUsedError;
  @JsonKey(name: 'preview_image')
  String? get previewUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtworkPreviewCopyWith<ArtworkPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkPreviewCopyWith<$Res> {
  factory $ArtworkPreviewCopyWith(
          ArtworkPreview value, $Res Function(ArtworkPreview) then) =
      _$ArtworkPreviewCopyWithImpl<$Res, ArtworkPreview>;
  @useResult
  $Res call(
      {int id,
      String title,
      String address,
      @JsonKey(name: 'status') String statusCode,
      @JsonKey(name: 'artist') ArtistPreview? artistPreview,
      @JsonKey(name: 'festival') FestivalPreview? festivalPreview,
      @JsonKey(name: 'preview_image') String? previewUrl});

  $ArtistPreviewCopyWith<$Res>? get artistPreview;
  $FestivalPreviewCopyWith<$Res>? get festivalPreview;
}

/// @nodoc
class _$ArtworkPreviewCopyWithImpl<$Res, $Val extends ArtworkPreview>
    implements $ArtworkPreviewCopyWith<$Res> {
  _$ArtworkPreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? address = null,
    Object? statusCode = null,
    Object? artistPreview = freezed,
    Object? festivalPreview = freezed,
    Object? previewUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      artistPreview: freezed == artistPreview
          ? _value.artistPreview
          : artistPreview // ignore: cast_nullable_to_non_nullable
              as ArtistPreview?,
      festivalPreview: freezed == festivalPreview
          ? _value.festivalPreview
          : festivalPreview // ignore: cast_nullable_to_non_nullable
              as FestivalPreview?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistPreviewCopyWith<$Res>? get artistPreview {
    if (_value.artistPreview == null) {
      return null;
    }

    return $ArtistPreviewCopyWith<$Res>(_value.artistPreview!, (value) {
      return _then(_value.copyWith(artistPreview: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FestivalPreviewCopyWith<$Res>? get festivalPreview {
    if (_value.festivalPreview == null) {
      return null;
    }

    return $FestivalPreviewCopyWith<$Res>(_value.festivalPreview!, (value) {
      return _then(_value.copyWith(festivalPreview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtworkPreviewImplCopyWith<$Res>
    implements $ArtworkPreviewCopyWith<$Res> {
  factory _$$ArtworkPreviewImplCopyWith(_$ArtworkPreviewImpl value,
          $Res Function(_$ArtworkPreviewImpl) then) =
      __$$ArtworkPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String address,
      @JsonKey(name: 'status') String statusCode,
      @JsonKey(name: 'artist') ArtistPreview? artistPreview,
      @JsonKey(name: 'festival') FestivalPreview? festivalPreview,
      @JsonKey(name: 'preview_image') String? previewUrl});

  @override
  $ArtistPreviewCopyWith<$Res>? get artistPreview;
  @override
  $FestivalPreviewCopyWith<$Res>? get festivalPreview;
}

/// @nodoc
class __$$ArtworkPreviewImplCopyWithImpl<$Res>
    extends _$ArtworkPreviewCopyWithImpl<$Res, _$ArtworkPreviewImpl>
    implements _$$ArtworkPreviewImplCopyWith<$Res> {
  __$$ArtworkPreviewImplCopyWithImpl(
      _$ArtworkPreviewImpl _value, $Res Function(_$ArtworkPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? address = null,
    Object? statusCode = null,
    Object? artistPreview = freezed,
    Object? festivalPreview = freezed,
    Object? previewUrl = freezed,
  }) {
    return _then(_$ArtworkPreviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      artistPreview: freezed == artistPreview
          ? _value.artistPreview
          : artistPreview // ignore: cast_nullable_to_non_nullable
              as ArtistPreview?,
      festivalPreview: freezed == festivalPreview
          ? _value.festivalPreview
          : festivalPreview // ignore: cast_nullable_to_non_nullable
              as FestivalPreview?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkPreviewImpl extends _ArtworkPreview {
  const _$ArtworkPreviewImpl(
      {required this.id,
      required this.title,
      required this.address,
      @JsonKey(name: 'status') required this.statusCode,
      @JsonKey(name: 'artist') this.artistPreview,
      @JsonKey(name: 'festival') this.festivalPreview,
      @JsonKey(name: 'preview_image') required this.previewUrl})
      : super._();

  factory _$ArtworkPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkPreviewImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String address;
  @override
  @JsonKey(name: 'status')
  final String statusCode;
  @override
  @JsonKey(name: 'artist')
  final ArtistPreview? artistPreview;
  @override
  @JsonKey(name: 'festival')
  final FestivalPreview? festivalPreview;
  @override
  @JsonKey(name: 'preview_image')
  final String? previewUrl;

  @override
  String toString() {
    return 'ArtworkPreview(id: $id, title: $title, address: $address, statusCode: $statusCode, artistPreview: $artistPreview, festivalPreview: $festivalPreview, previewUrl: $previewUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkPreviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.artistPreview, artistPreview) ||
                other.artistPreview == artistPreview) &&
            (identical(other.festivalPreview, festivalPreview) ||
                other.festivalPreview == festivalPreview) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, address, statusCode,
      artistPreview, festivalPreview, previewUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkPreviewImplCopyWith<_$ArtworkPreviewImpl> get copyWith =>
      __$$ArtworkPreviewImplCopyWithImpl<_$ArtworkPreviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkPreviewImplToJson(
      this,
    );
  }
}

abstract class _ArtworkPreview extends ArtworkPreview {
  const factory _ArtworkPreview(
          {required final int id,
          required final String title,
          required final String address,
          @JsonKey(name: 'status') required final String statusCode,
          @JsonKey(name: 'artist') final ArtistPreview? artistPreview,
          @JsonKey(name: 'festival') final FestivalPreview? festivalPreview,
          @JsonKey(name: 'preview_image') required final String? previewUrl}) =
      _$ArtworkPreviewImpl;
  const _ArtworkPreview._() : super._();

  factory _ArtworkPreview.fromJson(Map<String, dynamic> json) =
      _$ArtworkPreviewImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get address;
  @override
  @JsonKey(name: 'status')
  String get statusCode;
  @override
  @JsonKey(name: 'artist')
  ArtistPreview? get artistPreview;
  @override
  @JsonKey(name: 'festival')
  FestivalPreview? get festivalPreview;
  @override
  @JsonKey(name: 'preview_image')
  String? get previewUrl;
  @override
  @JsonKey(ignore: true)
  _$$ArtworkPreviewImplCopyWith<_$ArtworkPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
