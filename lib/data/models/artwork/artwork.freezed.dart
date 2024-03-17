// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Artwork _$ArtworkFromJson(Map<String, dynamic> json) {
  return _Artwork.fromJson(json);
}

/// @nodoc
mixin _$Artwork {
  int get id => throw _privateConstructorUsedError;
  int get addedByUserId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get statusCode => throw _privateConstructorUsedError;
  ArtworkLocation get location => throw _privateConstructorUsedError;
  int? get yearCreated => throw _privateConstructorUsedError;
  int? get artistId => throw _privateConstructorUsedError;
  int? get festivalId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get sourceDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist')
  ArtistPreview? get artistPreview => throw _privateConstructorUsedError;
  @JsonKey(name: 'festival')
  FestivalPreview? get festivalPreview => throw _privateConstructorUsedError;
  List<ImageModel>? get images => throw _privateConstructorUsedError;
  List<String>? get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtworkCopyWith<Artwork> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCopyWith<$Res> {
  factory $ArtworkCopyWith(Artwork value, $Res Function(Artwork) then) =
      _$ArtworkCopyWithImpl<$Res, Artwork>;
  @useResult
  $Res call(
      {int id,
      int addedByUserId,
      String title,
      String updatedAt,
      @JsonKey(name: 'status') String statusCode,
      ArtworkLocation location,
      int? yearCreated,
      int? artistId,
      int? festivalId,
      String? description,
      String? sourceDescription,
      @JsonKey(name: 'artist') ArtistPreview? artistPreview,
      @JsonKey(name: 'festival') FestivalPreview? festivalPreview,
      List<ImageModel>? images,
      List<String>? links});

  $ArtworkLocationCopyWith<$Res> get location;
  $ArtistPreviewCopyWith<$Res>? get artistPreview;
  $FestivalPreviewCopyWith<$Res>? get festivalPreview;
}

/// @nodoc
class _$ArtworkCopyWithImpl<$Res, $Val extends Artwork>
    implements $ArtworkCopyWith<$Res> {
  _$ArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addedByUserId = null,
    Object? title = null,
    Object? updatedAt = null,
    Object? statusCode = null,
    Object? location = null,
    Object? yearCreated = freezed,
    Object? artistId = freezed,
    Object? festivalId = freezed,
    Object? description = freezed,
    Object? sourceDescription = freezed,
    Object? artistPreview = freezed,
    Object? festivalPreview = freezed,
    Object? images = freezed,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addedByUserId: null == addedByUserId
          ? _value.addedByUserId
          : addedByUserId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ArtworkLocation,
      yearCreated: freezed == yearCreated
          ? _value.yearCreated
          : yearCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      artistId: freezed == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int?,
      festivalId: freezed == festivalId
          ? _value.festivalId
          : festivalId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceDescription: freezed == sourceDescription
          ? _value.sourceDescription
          : sourceDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      artistPreview: freezed == artistPreview
          ? _value.artistPreview
          : artistPreview // ignore: cast_nullable_to_non_nullable
              as ArtistPreview?,
      festivalPreview: freezed == festivalPreview
          ? _value.festivalPreview
          : festivalPreview // ignore: cast_nullable_to_non_nullable
              as FestivalPreview?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtworkLocationCopyWith<$Res> get location {
    return $ArtworkLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
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
abstract class _$$ArtworkImplCopyWith<$Res> implements $ArtworkCopyWith<$Res> {
  factory _$$ArtworkImplCopyWith(
          _$ArtworkImpl value, $Res Function(_$ArtworkImpl) then) =
      __$$ArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int addedByUserId,
      String title,
      String updatedAt,
      @JsonKey(name: 'status') String statusCode,
      ArtworkLocation location,
      int? yearCreated,
      int? artistId,
      int? festivalId,
      String? description,
      String? sourceDescription,
      @JsonKey(name: 'artist') ArtistPreview? artistPreview,
      @JsonKey(name: 'festival') FestivalPreview? festivalPreview,
      List<ImageModel>? images,
      List<String>? links});

  @override
  $ArtworkLocationCopyWith<$Res> get location;
  @override
  $ArtistPreviewCopyWith<$Res>? get artistPreview;
  @override
  $FestivalPreviewCopyWith<$Res>? get festivalPreview;
}

/// @nodoc
class __$$ArtworkImplCopyWithImpl<$Res>
    extends _$ArtworkCopyWithImpl<$Res, _$ArtworkImpl>
    implements _$$ArtworkImplCopyWith<$Res> {
  __$$ArtworkImplCopyWithImpl(
      _$ArtworkImpl _value, $Res Function(_$ArtworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addedByUserId = null,
    Object? title = null,
    Object? updatedAt = null,
    Object? statusCode = null,
    Object? location = null,
    Object? yearCreated = freezed,
    Object? artistId = freezed,
    Object? festivalId = freezed,
    Object? description = freezed,
    Object? sourceDescription = freezed,
    Object? artistPreview = freezed,
    Object? festivalPreview = freezed,
    Object? images = freezed,
    Object? links = freezed,
  }) {
    return _then(_$ArtworkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addedByUserId: null == addedByUserId
          ? _value.addedByUserId
          : addedByUserId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ArtworkLocation,
      yearCreated: freezed == yearCreated
          ? _value.yearCreated
          : yearCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      artistId: freezed == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int?,
      festivalId: freezed == festivalId
          ? _value.festivalId
          : festivalId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceDescription: freezed == sourceDescription
          ? _value.sourceDescription
          : sourceDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      artistPreview: freezed == artistPreview
          ? _value.artistPreview
          : artistPreview // ignore: cast_nullable_to_non_nullable
              as ArtistPreview?,
      festivalPreview: freezed == festivalPreview
          ? _value.festivalPreview
          : festivalPreview // ignore: cast_nullable_to_non_nullable
              as FestivalPreview?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkImpl extends _Artwork {
  const _$ArtworkImpl(
      {required this.id,
      required this.addedByUserId,
      required this.title,
      required this.updatedAt,
      @JsonKey(name: 'status') required this.statusCode,
      required this.location,
      this.yearCreated,
      this.artistId,
      this.festivalId,
      this.description,
      this.sourceDescription,
      @JsonKey(name: 'artist') this.artistPreview,
      @JsonKey(name: 'festival') this.festivalPreview,
      final List<ImageModel>? images,
      final List<String>? links})
      : _images = images,
        _links = links,
        super._();

  factory _$ArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkImplFromJson(json);

  @override
  final int id;
  @override
  final int addedByUserId;
  @override
  final String title;
  @override
  final String updatedAt;
  @override
  @JsonKey(name: 'status')
  final String statusCode;
  @override
  final ArtworkLocation location;
  @override
  final int? yearCreated;
  @override
  final int? artistId;
  @override
  final int? festivalId;
  @override
  final String? description;
  @override
  final String? sourceDescription;
  @override
  @JsonKey(name: 'artist')
  final ArtistPreview? artistPreview;
  @override
  @JsonKey(name: 'festival')
  final FestivalPreview? festivalPreview;
  final List<ImageModel>? _images;
  @override
  List<ImageModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
    return 'Artwork(id: $id, addedByUserId: $addedByUserId, title: $title, updatedAt: $updatedAt, statusCode: $statusCode, location: $location, yearCreated: $yearCreated, artistId: $artistId, festivalId: $festivalId, description: $description, sourceDescription: $sourceDescription, artistPreview: $artistPreview, festivalPreview: $festivalPreview, images: $images, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addedByUserId, addedByUserId) ||
                other.addedByUserId == addedByUserId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.yearCreated, yearCreated) ||
                other.yearCreated == yearCreated) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.festivalId, festivalId) ||
                other.festivalId == festivalId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sourceDescription, sourceDescription) ||
                other.sourceDescription == sourceDescription) &&
            (identical(other.artistPreview, artistPreview) ||
                other.artistPreview == artistPreview) &&
            (identical(other.festivalPreview, festivalPreview) ||
                other.festivalPreview == festivalPreview) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      addedByUserId,
      title,
      updatedAt,
      statusCode,
      location,
      yearCreated,
      artistId,
      festivalId,
      description,
      sourceDescription,
      artistPreview,
      festivalPreview,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkImplCopyWith<_$ArtworkImpl> get copyWith =>
      __$$ArtworkImplCopyWithImpl<_$ArtworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkImplToJson(
      this,
    );
  }
}

abstract class _Artwork extends Artwork {
  const factory _Artwork(
      {required final int id,
      required final int addedByUserId,
      required final String title,
      required final String updatedAt,
      @JsonKey(name: 'status') required final String statusCode,
      required final ArtworkLocation location,
      final int? yearCreated,
      final int? artistId,
      final int? festivalId,
      final String? description,
      final String? sourceDescription,
      @JsonKey(name: 'artist') final ArtistPreview? artistPreview,
      @JsonKey(name: 'festival') final FestivalPreview? festivalPreview,
      final List<ImageModel>? images,
      final List<String>? links}) = _$ArtworkImpl;
  const _Artwork._() : super._();

  factory _Artwork.fromJson(Map<String, dynamic> json) = _$ArtworkImpl.fromJson;

  @override
  int get id;
  @override
  int get addedByUserId;
  @override
  String get title;
  @override
  String get updatedAt;
  @override
  @JsonKey(name: 'status')
  String get statusCode;
  @override
  ArtworkLocation get location;
  @override
  int? get yearCreated;
  @override
  int? get artistId;
  @override
  int? get festivalId;
  @override
  String? get description;
  @override
  String? get sourceDescription;
  @override
  @JsonKey(name: 'artist')
  ArtistPreview? get artistPreview;
  @override
  @JsonKey(name: 'festival')
  FestivalPreview? get festivalPreview;
  @override
  List<ImageModel>? get images;
  @override
  List<String>? get links;
  @override
  @JsonKey(ignore: true)
  _$$ArtworkImplCopyWith<_$ArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
