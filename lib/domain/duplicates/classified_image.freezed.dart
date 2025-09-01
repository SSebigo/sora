// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classified_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClassifiedImage {

 String get path; int get size; DateTime get lastModified; ImageType get imageType; double get typeConfidence; bool get isSelected;
/// Create a copy of ClassifiedImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassifiedImageCopyWith<ClassifiedImage> get copyWith => _$ClassifiedImageCopyWithImpl<ClassifiedImage>(this as ClassifiedImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifiedImage&&(identical(other.path, path) || other.path == path)&&(identical(other.size, size) || other.size == size)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.imageType, imageType) || other.imageType == imageType)&&(identical(other.typeConfidence, typeConfidence) || other.typeConfidence == typeConfidence)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,path,size,lastModified,imageType,typeConfidence,isSelected);

@override
String toString() {
  return 'ClassifiedImage(path: $path, size: $size, lastModified: $lastModified, imageType: $imageType, typeConfidence: $typeConfidence, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $ClassifiedImageCopyWith<$Res>  {
  factory $ClassifiedImageCopyWith(ClassifiedImage value, $Res Function(ClassifiedImage) _then) = _$ClassifiedImageCopyWithImpl;
@useResult
$Res call({
 String path, int size, DateTime lastModified, ImageType imageType, double typeConfidence, bool isSelected
});




}
/// @nodoc
class _$ClassifiedImageCopyWithImpl<$Res>
    implements $ClassifiedImageCopyWith<$Res> {
  _$ClassifiedImageCopyWithImpl(this._self, this._then);

  final ClassifiedImage _self;
  final $Res Function(ClassifiedImage) _then;

/// Create a copy of ClassifiedImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? size = null,Object? lastModified = null,Object? imageType = null,Object? typeConfidence = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,imageType: null == imageType ? _self.imageType : imageType // ignore: cast_nullable_to_non_nullable
as ImageType,typeConfidence: null == typeConfidence ? _self.typeConfidence : typeConfidence // ignore: cast_nullable_to_non_nullable
as double,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ClassifiedImage implements ClassifiedImage {
  const _ClassifiedImage({required this.path, required this.size, required this.lastModified, required this.imageType, required this.typeConfidence, required this.isSelected});
  

@override final  String path;
@override final  int size;
@override final  DateTime lastModified;
@override final  ImageType imageType;
@override final  double typeConfidence;
@override final  bool isSelected;

/// Create a copy of ClassifiedImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassifiedImageCopyWith<_ClassifiedImage> get copyWith => __$ClassifiedImageCopyWithImpl<_ClassifiedImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassifiedImage&&(identical(other.path, path) || other.path == path)&&(identical(other.size, size) || other.size == size)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.imageType, imageType) || other.imageType == imageType)&&(identical(other.typeConfidence, typeConfidence) || other.typeConfidence == typeConfidence)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,path,size,lastModified,imageType,typeConfidence,isSelected);

@override
String toString() {
  return 'ClassifiedImage(path: $path, size: $size, lastModified: $lastModified, imageType: $imageType, typeConfidence: $typeConfidence, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$ClassifiedImageCopyWith<$Res> implements $ClassifiedImageCopyWith<$Res> {
  factory _$ClassifiedImageCopyWith(_ClassifiedImage value, $Res Function(_ClassifiedImage) _then) = __$ClassifiedImageCopyWithImpl;
@override @useResult
$Res call({
 String path, int size, DateTime lastModified, ImageType imageType, double typeConfidence, bool isSelected
});




}
/// @nodoc
class __$ClassifiedImageCopyWithImpl<$Res>
    implements _$ClassifiedImageCopyWith<$Res> {
  __$ClassifiedImageCopyWithImpl(this._self, this._then);

  final _ClassifiedImage _self;
  final $Res Function(_ClassifiedImage) _then;

/// Create a copy of ClassifiedImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? size = null,Object? lastModified = null,Object? imageType = null,Object? typeConfidence = null,Object? isSelected = null,}) {
  return _then(_ClassifiedImage(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,imageType: null == imageType ? _self.imageType : imageType // ignore: cast_nullable_to_non_nullable
as ImageType,typeConfidence: null == typeConfidence ? _self.typeConfidence : typeConfidence // ignore: cast_nullable_to_non_nullable
as double,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ClassificationResult {

 List<ClassifiedImage> get photos; List<ClassifiedImage> get drawings; List<ClassifiedImage> get unknown;
/// Create a copy of ClassificationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassificationResultCopyWith<ClassificationResult> get copyWith => _$ClassificationResultCopyWithImpl<ClassificationResult>(this as ClassificationResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassificationResult&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.drawings, drawings)&&const DeepCollectionEquality().equals(other.unknown, unknown));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(drawings),const DeepCollectionEquality().hash(unknown));

@override
String toString() {
  return 'ClassificationResult(photos: $photos, drawings: $drawings, unknown: $unknown)';
}


}

/// @nodoc
abstract mixin class $ClassificationResultCopyWith<$Res>  {
  factory $ClassificationResultCopyWith(ClassificationResult value, $Res Function(ClassificationResult) _then) = _$ClassificationResultCopyWithImpl;
@useResult
$Res call({
 List<ClassifiedImage> photos, List<ClassifiedImage> drawings, List<ClassifiedImage> unknown
});




}
/// @nodoc
class _$ClassificationResultCopyWithImpl<$Res>
    implements $ClassificationResultCopyWith<$Res> {
  _$ClassificationResultCopyWithImpl(this._self, this._then);

  final ClassificationResult _self;
  final $Res Function(ClassificationResult) _then;

/// Create a copy of ClassificationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photos = null,Object? drawings = null,Object? unknown = null,}) {
  return _then(_self.copyWith(
photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<ClassifiedImage>,drawings: null == drawings ? _self.drawings : drawings // ignore: cast_nullable_to_non_nullable
as List<ClassifiedImage>,unknown: null == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as List<ClassifiedImage>,
  ));
}

}


/// @nodoc


class _ClassificationResult extends ClassificationResult {
  const _ClassificationResult({required final  List<ClassifiedImage> photos, required final  List<ClassifiedImage> drawings, required final  List<ClassifiedImage> unknown}): _photos = photos,_drawings = drawings,_unknown = unknown,super._();
  

 final  List<ClassifiedImage> _photos;
@override List<ClassifiedImage> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

 final  List<ClassifiedImage> _drawings;
@override List<ClassifiedImage> get drawings {
  if (_drawings is EqualUnmodifiableListView) return _drawings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drawings);
}

 final  List<ClassifiedImage> _unknown;
@override List<ClassifiedImage> get unknown {
  if (_unknown is EqualUnmodifiableListView) return _unknown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unknown);
}


/// Create a copy of ClassificationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassificationResultCopyWith<_ClassificationResult> get copyWith => __$ClassificationResultCopyWithImpl<_ClassificationResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassificationResult&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._drawings, _drawings)&&const DeepCollectionEquality().equals(other._unknown, _unknown));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_drawings),const DeepCollectionEquality().hash(_unknown));

@override
String toString() {
  return 'ClassificationResult(photos: $photos, drawings: $drawings, unknown: $unknown)';
}


}

/// @nodoc
abstract mixin class _$ClassificationResultCopyWith<$Res> implements $ClassificationResultCopyWith<$Res> {
  factory _$ClassificationResultCopyWith(_ClassificationResult value, $Res Function(_ClassificationResult) _then) = __$ClassificationResultCopyWithImpl;
@override @useResult
$Res call({
 List<ClassifiedImage> photos, List<ClassifiedImage> drawings, List<ClassifiedImage> unknown
});




}
/// @nodoc
class __$ClassificationResultCopyWithImpl<$Res>
    implements _$ClassificationResultCopyWith<$Res> {
  __$ClassificationResultCopyWithImpl(this._self, this._then);

  final _ClassificationResult _self;
  final $Res Function(_ClassificationResult) _then;

/// Create a copy of ClassificationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photos = null,Object? drawings = null,Object? unknown = null,}) {
  return _then(_ClassificationResult(
photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<ClassifiedImage>,drawings: null == drawings ? _self._drawings : drawings // ignore: cast_nullable_to_non_nullable
as List<ClassifiedImage>,unknown: null == unknown ? _self._unknown : unknown // ignore: cast_nullable_to_non_nullable
as List<ClassifiedImage>,
  ));
}


}

// dart format on
