// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArtworkTicket {
  int get id => throw _privateConstructorUsedError;
  Artwork get artwork => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtworkTicketCopyWith<ArtworkTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkTicketCopyWith<$Res> {
  factory $ArtworkTicketCopyWith(
          ArtworkTicket value, $Res Function(ArtworkTicket) then) =
      _$ArtworkTicketCopyWithImpl<$Res, ArtworkTicket>;
  @useResult
  $Res call({int id, Artwork artwork});

  $ArtworkCopyWith<$Res> get artwork;
}

/// @nodoc
class _$ArtworkTicketCopyWithImpl<$Res, $Val extends ArtworkTicket>
    implements $ArtworkTicketCopyWith<$Res> {
  _$ArtworkTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artwork = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      artwork: null == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtworkCopyWith<$Res> get artwork {
    return $ArtworkCopyWith<$Res>(_value.artwork, (value) {
      return _then(_value.copyWith(artwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtworkTicketImplCopyWith<$Res>
    implements $ArtworkTicketCopyWith<$Res> {
  factory _$$ArtworkTicketImplCopyWith(
          _$ArtworkTicketImpl value, $Res Function(_$ArtworkTicketImpl) then) =
      __$$ArtworkTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Artwork artwork});

  @override
  $ArtworkCopyWith<$Res> get artwork;
}

/// @nodoc
class __$$ArtworkTicketImplCopyWithImpl<$Res>
    extends _$ArtworkTicketCopyWithImpl<$Res, _$ArtworkTicketImpl>
    implements _$$ArtworkTicketImplCopyWith<$Res> {
  __$$ArtworkTicketImplCopyWithImpl(
      _$ArtworkTicketImpl _value, $Res Function(_$ArtworkTicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artwork = null,
  }) {
    return _then(_$ArtworkTicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      artwork: null == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork,
    ));
  }
}

/// @nodoc

class _$ArtworkTicketImpl implements _ArtworkTicket {
  _$ArtworkTicketImpl({required this.id, required this.artwork});

  @override
  final int id;
  @override
  final Artwork artwork;

  @override
  String toString() {
    return 'ArtworkTicket._(id: $id, artwork: $artwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkTicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.artwork, artwork) || other.artwork == artwork));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, artwork);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkTicketImplCopyWith<_$ArtworkTicketImpl> get copyWith =>
      __$$ArtworkTicketImplCopyWithImpl<_$ArtworkTicketImpl>(this, _$identity);
}

abstract class _ArtworkTicket implements ArtworkTicket {
  factory _ArtworkTicket(
      {required final int id,
      required final Artwork artwork}) = _$ArtworkTicketImpl;

  @override
  int get id;
  @override
  Artwork get artwork;
  @override
  @JsonKey(ignore: true)
  _$$ArtworkTicketImplCopyWith<_$ArtworkTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
