// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_dl_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryDLFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryDLFailure()';
}


}

/// @nodoc
class $GalleryDLFailureCopyWith<$Res>  {
$GalleryDLFailureCopyWith(GalleryDLFailure _, $Res Function(GalleryDLFailure) __);
}


/// @nodoc


class GalleryDLCommandNotFound implements GalleryDLFailure {
  const GalleryDLCommandNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLCommandNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryDLFailure.commandNotFound()';
}


}




/// @nodoc


class GalleryDLGithubURLFailedToOpen implements GalleryDLFailure {
  const GalleryDLGithubURLFailedToOpen();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLGithubURLFailedToOpen);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryDLFailure.githubURLFailedToOpen()';
}


}




/// @nodoc


class GalleryDLContentAlreadyDownloaded implements GalleryDLFailure {
  const GalleryDLContentAlreadyDownloaded(this.downloadInfo);
  

 final  DownloadInfo downloadInfo;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryDLContentAlreadyDownloadedCopyWith<GalleryDLContentAlreadyDownloaded> get copyWith => _$GalleryDLContentAlreadyDownloadedCopyWithImpl<GalleryDLContentAlreadyDownloaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLContentAlreadyDownloaded&&(identical(other.downloadInfo, downloadInfo) || other.downloadInfo == downloadInfo));
}


@override
int get hashCode => Object.hash(runtimeType,downloadInfo);

@override
String toString() {
  return 'GalleryDLFailure.contenAlreadyDownloaded(downloadInfo: $downloadInfo)';
}


}

/// @nodoc
abstract mixin class $GalleryDLContentAlreadyDownloadedCopyWith<$Res> implements $GalleryDLFailureCopyWith<$Res> {
  factory $GalleryDLContentAlreadyDownloadedCopyWith(GalleryDLContentAlreadyDownloaded value, $Res Function(GalleryDLContentAlreadyDownloaded) _then) = _$GalleryDLContentAlreadyDownloadedCopyWithImpl;
@useResult
$Res call({
 DownloadInfo downloadInfo
});


$DownloadInfoCopyWith<$Res> get downloadInfo;

}
/// @nodoc
class _$GalleryDLContentAlreadyDownloadedCopyWithImpl<$Res>
    implements $GalleryDLContentAlreadyDownloadedCopyWith<$Res> {
  _$GalleryDLContentAlreadyDownloadedCopyWithImpl(this._self, this._then);

  final GalleryDLContentAlreadyDownloaded _self;
  final $Res Function(GalleryDLContentAlreadyDownloaded) _then;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? downloadInfo = null,}) {
  return _then(GalleryDLContentAlreadyDownloaded(
null == downloadInfo ? _self.downloadInfo : downloadInfo // ignore: cast_nullable_to_non_nullable
as DownloadInfo,
  ));
}

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadInfoCopyWith<$Res> get downloadInfo {
  
  return $DownloadInfoCopyWith<$Res>(_self.downloadInfo, (value) {
    return _then(_self.copyWith(downloadInfo: value));
  });
}
}

/// @nodoc


class GalleryDLInvalidURL implements GalleryDLFailure {
  const GalleryDLInvalidURL(this.downloadInfo);
  

 final  DownloadInfo downloadInfo;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryDLInvalidURLCopyWith<GalleryDLInvalidURL> get copyWith => _$GalleryDLInvalidURLCopyWithImpl<GalleryDLInvalidURL>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLInvalidURL&&(identical(other.downloadInfo, downloadInfo) || other.downloadInfo == downloadInfo));
}


@override
int get hashCode => Object.hash(runtimeType,downloadInfo);

@override
String toString() {
  return 'GalleryDLFailure.invalidURL(downloadInfo: $downloadInfo)';
}


}

/// @nodoc
abstract mixin class $GalleryDLInvalidURLCopyWith<$Res> implements $GalleryDLFailureCopyWith<$Res> {
  factory $GalleryDLInvalidURLCopyWith(GalleryDLInvalidURL value, $Res Function(GalleryDLInvalidURL) _then) = _$GalleryDLInvalidURLCopyWithImpl;
@useResult
$Res call({
 DownloadInfo downloadInfo
});


$DownloadInfoCopyWith<$Res> get downloadInfo;

}
/// @nodoc
class _$GalleryDLInvalidURLCopyWithImpl<$Res>
    implements $GalleryDLInvalidURLCopyWith<$Res> {
  _$GalleryDLInvalidURLCopyWithImpl(this._self, this._then);

  final GalleryDLInvalidURL _self;
  final $Res Function(GalleryDLInvalidURL) _then;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? downloadInfo = null,}) {
  return _then(GalleryDLInvalidURL(
null == downloadInfo ? _self.downloadInfo : downloadInfo // ignore: cast_nullable_to_non_nullable
as DownloadInfo,
  ));
}

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadInfoCopyWith<$Res> get downloadInfo {
  
  return $DownloadInfoCopyWith<$Res>(_self.downloadInfo, (value) {
    return _then(_self.copyWith(downloadInfo: value));
  });
}
}

/// @nodoc


class GalleryDLFailedToCopyToClipboard implements GalleryDLFailure {
  const GalleryDLFailedToCopyToClipboard(this.url);
  

 final  URL url;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryDLFailedToCopyToClipboardCopyWith<GalleryDLFailedToCopyToClipboard> get copyWith => _$GalleryDLFailedToCopyToClipboardCopyWithImpl<GalleryDLFailedToCopyToClipboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLFailedToCopyToClipboard&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'GalleryDLFailure.failedToCopyToClipboard(url: $url)';
}


}

/// @nodoc
abstract mixin class $GalleryDLFailedToCopyToClipboardCopyWith<$Res> implements $GalleryDLFailureCopyWith<$Res> {
  factory $GalleryDLFailedToCopyToClipboardCopyWith(GalleryDLFailedToCopyToClipboard value, $Res Function(GalleryDLFailedToCopyToClipboard) _then) = _$GalleryDLFailedToCopyToClipboardCopyWithImpl;
@useResult
$Res call({
 URL url
});




}
/// @nodoc
class _$GalleryDLFailedToCopyToClipboardCopyWithImpl<$Res>
    implements $GalleryDLFailedToCopyToClipboardCopyWith<$Res> {
  _$GalleryDLFailedToCopyToClipboardCopyWithImpl(this._self, this._then);

  final GalleryDLFailedToCopyToClipboard _self;
  final $Res Function(GalleryDLFailedToCopyToClipboard) _then;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(GalleryDLFailedToCopyToClipboard(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as URL,
  ));
}


}

/// @nodoc


class GalleryDLUnexpected implements GalleryDLFailure {
  const GalleryDLUnexpected({this.downloadInfo});
  

 final  DownloadInfo? downloadInfo;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryDLUnexpectedCopyWith<GalleryDLUnexpected> get copyWith => _$GalleryDLUnexpectedCopyWithImpl<GalleryDLUnexpected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLUnexpected&&(identical(other.downloadInfo, downloadInfo) || other.downloadInfo == downloadInfo));
}


@override
int get hashCode => Object.hash(runtimeType,downloadInfo);

@override
String toString() {
  return 'GalleryDLFailure.unexpected(downloadInfo: $downloadInfo)';
}


}

/// @nodoc
abstract mixin class $GalleryDLUnexpectedCopyWith<$Res> implements $GalleryDLFailureCopyWith<$Res> {
  factory $GalleryDLUnexpectedCopyWith(GalleryDLUnexpected value, $Res Function(GalleryDLUnexpected) _then) = _$GalleryDLUnexpectedCopyWithImpl;
@useResult
$Res call({
 DownloadInfo? downloadInfo
});


$DownloadInfoCopyWith<$Res>? get downloadInfo;

}
/// @nodoc
class _$GalleryDLUnexpectedCopyWithImpl<$Res>
    implements $GalleryDLUnexpectedCopyWith<$Res> {
  _$GalleryDLUnexpectedCopyWithImpl(this._self, this._then);

  final GalleryDLUnexpected _self;
  final $Res Function(GalleryDLUnexpected) _then;

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? downloadInfo = freezed,}) {
  return _then(GalleryDLUnexpected(
downloadInfo: freezed == downloadInfo ? _self.downloadInfo : downloadInfo // ignore: cast_nullable_to_non_nullable
as DownloadInfo?,
  ));
}

/// Create a copy of GalleryDLFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadInfoCopyWith<$Res>? get downloadInfo {
    if (_self.downloadInfo == null) {
    return null;
  }

  return $DownloadInfoCopyWith<$Res>(_self.downloadInfo!, (value) {
    return _then(_self.copyWith(downloadInfo: value));
  });
}
}

/// @nodoc


class GalleryDLContentURLFailedToOpen implements GalleryDLFailure {
  const GalleryDLContentURLFailedToOpen();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryDLContentURLFailedToOpen);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryDLFailure.contentURLFailedToOpen()';
}


}




// dart format on
