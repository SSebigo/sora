// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archives_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchivesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchivesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchivesEvent()';
}


}

/// @nodoc
class $ArchivesEventCopyWith<$Res>  {
$ArchivesEventCopyWith(ArchivesEvent _, $Res Function(ArchivesEvent) __);
}


/// @nodoc


class Init implements ArchivesEvent {
  const Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchivesEvent.init()';
}


}




/// @nodoc


class ItemsCounted implements ArchivesEvent {
  const ItemsCounted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemsCounted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchivesEvent.itemsCounted()';
}


}




/// @nodoc


class OpenInNewPressed implements ArchivesEvent {
  const OpenInNewPressed(this.downloadInfo);
  

 final  DownloadInfo downloadInfo;

/// Create a copy of ArchivesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenInNewPressedCopyWith<OpenInNewPressed> get copyWith => _$OpenInNewPressedCopyWithImpl<OpenInNewPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenInNewPressed&&(identical(other.downloadInfo, downloadInfo) || other.downloadInfo == downloadInfo));
}


@override
int get hashCode => Object.hash(runtimeType,downloadInfo);

@override
String toString() {
  return 'ArchivesEvent.openInNewPressed(downloadInfo: $downloadInfo)';
}


}

/// @nodoc
abstract mixin class $OpenInNewPressedCopyWith<$Res> implements $ArchivesEventCopyWith<$Res> {
  factory $OpenInNewPressedCopyWith(OpenInNewPressed value, $Res Function(OpenInNewPressed) _then) = _$OpenInNewPressedCopyWithImpl;
@useResult
$Res call({
 DownloadInfo downloadInfo
});


$DownloadInfoCopyWith<$Res> get downloadInfo;

}
/// @nodoc
class _$OpenInNewPressedCopyWithImpl<$Res>
    implements $OpenInNewPressedCopyWith<$Res> {
  _$OpenInNewPressedCopyWithImpl(this._self, this._then);

  final OpenInNewPressed _self;
  final $Res Function(OpenInNewPressed) _then;

/// Create a copy of ArchivesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? downloadInfo = null,}) {
  return _then(OpenInNewPressed(
null == downloadInfo ? _self.downloadInfo : downloadInfo // ignore: cast_nullable_to_non_nullable
as DownloadInfo,
  ));
}

/// Create a copy of ArchivesEvent
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


class PagePressed implements ArchivesEvent {
  const PagePressed(this.idx);
  

 final  int idx;

/// Create a copy of ArchivesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagePressedCopyWith<PagePressed> get copyWith => _$PagePressedCopyWithImpl<PagePressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagePressed&&(identical(other.idx, idx) || other.idx == idx));
}


@override
int get hashCode => Object.hash(runtimeType,idx);

@override
String toString() {
  return 'ArchivesEvent.pagePressed(idx: $idx)';
}


}

/// @nodoc
abstract mixin class $PagePressedCopyWith<$Res> implements $ArchivesEventCopyWith<$Res> {
  factory $PagePressedCopyWith(PagePressed value, $Res Function(PagePressed) _then) = _$PagePressedCopyWithImpl;
@useResult
$Res call({
 int idx
});




}
/// @nodoc
class _$PagePressedCopyWithImpl<$Res>
    implements $PagePressedCopyWith<$Res> {
  _$PagePressedCopyWithImpl(this._self, this._then);

  final PagePressed _self;
  final $Res Function(PagePressed) _then;

/// Create a copy of ArchivesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? idx = null,}) {
  return _then(PagePressed(
null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CopyURLToClipboardPressed implements ArchivesEvent {
  const CopyURLToClipboardPressed(this.url);
  

 final  URL url;

/// Create a copy of ArchivesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopyURLToClipboardPressedCopyWith<CopyURLToClipboardPressed> get copyWith => _$CopyURLToClipboardPressedCopyWithImpl<CopyURLToClipboardPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopyURLToClipboardPressed&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ArchivesEvent.copyURLToClipboardPressed(url: $url)';
}


}

/// @nodoc
abstract mixin class $CopyURLToClipboardPressedCopyWith<$Res> implements $ArchivesEventCopyWith<$Res> {
  factory $CopyURLToClipboardPressedCopyWith(CopyURLToClipboardPressed value, $Res Function(CopyURLToClipboardPressed) _then) = _$CopyURLToClipboardPressedCopyWithImpl;
@useResult
$Res call({
 URL url
});




}
/// @nodoc
class _$CopyURLToClipboardPressedCopyWithImpl<$Res>
    implements $CopyURLToClipboardPressedCopyWith<$Res> {
  _$CopyURLToClipboardPressedCopyWithImpl(this._self, this._then);

  final CopyURLToClipboardPressed _self;
  final $Res Function(CopyURLToClipboardPressed) _then;

/// Create a copy of ArchivesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(CopyURLToClipboardPressed(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as URL,
  ));
}


}

/// @nodoc
mixin _$ArchivesState {

 Option<Result<Unit, CoreFailure>> get failureOrOption; List<DownloadInfo> get downloadInfos; int get itemsCount; int get paginationIdx;
/// Create a copy of ArchivesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchivesStateCopyWith<ArchivesState> get copyWith => _$ArchivesStateCopyWithImpl<ArchivesState>(this as ArchivesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchivesState&&(identical(other.failureOrOption, failureOrOption) || other.failureOrOption == failureOrOption)&&const DeepCollectionEquality().equals(other.downloadInfos, downloadInfos)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.paginationIdx, paginationIdx) || other.paginationIdx == paginationIdx));
}


@override
int get hashCode => Object.hash(runtimeType,failureOrOption,const DeepCollectionEquality().hash(downloadInfos),itemsCount,paginationIdx);

@override
String toString() {
  return 'ArchivesState(failureOrOption: $failureOrOption, downloadInfos: $downloadInfos, itemsCount: $itemsCount, paginationIdx: $paginationIdx)';
}


}

/// @nodoc
abstract mixin class $ArchivesStateCopyWith<$Res>  {
  factory $ArchivesStateCopyWith(ArchivesState value, $Res Function(ArchivesState) _then) = _$ArchivesStateCopyWithImpl;
@useResult
$Res call({
 Option<Result<Unit, CoreFailure>> failureOrOption, List<DownloadInfo> downloadInfos, int itemsCount, int paginationIdx
});




}
/// @nodoc
class _$ArchivesStateCopyWithImpl<$Res>
    implements $ArchivesStateCopyWith<$Res> {
  _$ArchivesStateCopyWithImpl(this._self, this._then);

  final ArchivesState _self;
  final $Res Function(ArchivesState) _then;

/// Create a copy of ArchivesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? failureOrOption = null,Object? downloadInfos = null,Object? itemsCount = null,Object? paginationIdx = null,}) {
  return _then(_self.copyWith(
failureOrOption: null == failureOrOption ? _self.failureOrOption : failureOrOption // ignore: cast_nullable_to_non_nullable
as Option<Result<Unit, CoreFailure>>,downloadInfos: null == downloadInfos ? _self.downloadInfos : downloadInfos // ignore: cast_nullable_to_non_nullable
as List<DownloadInfo>,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,paginationIdx: null == paginationIdx ? _self.paginationIdx : paginationIdx // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _ArchivesState implements ArchivesState {
  const _ArchivesState({required this.failureOrOption, required final  List<DownloadInfo> downloadInfos, required this.itemsCount, required this.paginationIdx}): _downloadInfos = downloadInfos;
  

@override final  Option<Result<Unit, CoreFailure>> failureOrOption;
 final  List<DownloadInfo> _downloadInfos;
@override List<DownloadInfo> get downloadInfos {
  if (_downloadInfos is EqualUnmodifiableListView) return _downloadInfos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_downloadInfos);
}

@override final  int itemsCount;
@override final  int paginationIdx;

/// Create a copy of ArchivesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchivesStateCopyWith<_ArchivesState> get copyWith => __$ArchivesStateCopyWithImpl<_ArchivesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchivesState&&(identical(other.failureOrOption, failureOrOption) || other.failureOrOption == failureOrOption)&&const DeepCollectionEquality().equals(other._downloadInfos, _downloadInfos)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.paginationIdx, paginationIdx) || other.paginationIdx == paginationIdx));
}


@override
int get hashCode => Object.hash(runtimeType,failureOrOption,const DeepCollectionEquality().hash(_downloadInfos),itemsCount,paginationIdx);

@override
String toString() {
  return 'ArchivesState(failureOrOption: $failureOrOption, downloadInfos: $downloadInfos, itemsCount: $itemsCount, paginationIdx: $paginationIdx)';
}


}

/// @nodoc
abstract mixin class _$ArchivesStateCopyWith<$Res> implements $ArchivesStateCopyWith<$Res> {
  factory _$ArchivesStateCopyWith(_ArchivesState value, $Res Function(_ArchivesState) _then) = __$ArchivesStateCopyWithImpl;
@override @useResult
$Res call({
 Option<Result<Unit, CoreFailure>> failureOrOption, List<DownloadInfo> downloadInfos, int itemsCount, int paginationIdx
});




}
/// @nodoc
class __$ArchivesStateCopyWithImpl<$Res>
    implements _$ArchivesStateCopyWith<$Res> {
  __$ArchivesStateCopyWithImpl(this._self, this._then);

  final _ArchivesState _self;
  final $Res Function(_ArchivesState) _then;

/// Create a copy of ArchivesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failureOrOption = null,Object? downloadInfos = null,Object? itemsCount = null,Object? paginationIdx = null,}) {
  return _then(_ArchivesState(
failureOrOption: null == failureOrOption ? _self.failureOrOption : failureOrOption // ignore: cast_nullable_to_non_nullable
as Option<Result<Unit, CoreFailure>>,downloadInfos: null == downloadInfos ? _self._downloadInfos : downloadInfos // ignore: cast_nullable_to_non_nullable
as List<DownloadInfo>,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,paginationIdx: null == paginationIdx ? _self.paginationIdx : paginationIdx // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
