// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duplicate_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DuplicateImage {

 String get path; String get hash; int get size; DateTime get lastModified; bool get isSelected; ImageType get imageType; double get typeConfidence;
/// Create a copy of DuplicateImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuplicateImageCopyWith<DuplicateImage> get copyWith => _$DuplicateImageCopyWithImpl<DuplicateImage>(this as DuplicateImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicateImage&&(identical(other.path, path) || other.path == path)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.size, size) || other.size == size)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.imageType, imageType) || other.imageType == imageType)&&(identical(other.typeConfidence, typeConfidence) || other.typeConfidence == typeConfidence));
}


@override
int get hashCode => Object.hash(runtimeType,path,hash,size,lastModified,isSelected,imageType,typeConfidence);

@override
String toString() {
  return 'DuplicateImage(path: $path, hash: $hash, size: $size, lastModified: $lastModified, isSelected: $isSelected, imageType: $imageType, typeConfidence: $typeConfidence)';
}


}

/// @nodoc
abstract mixin class $DuplicateImageCopyWith<$Res>  {
  factory $DuplicateImageCopyWith(DuplicateImage value, $Res Function(DuplicateImage) _then) = _$DuplicateImageCopyWithImpl;
@useResult
$Res call({
 String path, String hash, int size, DateTime lastModified, bool isSelected, ImageType imageType, double typeConfidence
});




}
/// @nodoc
class _$DuplicateImageCopyWithImpl<$Res>
    implements $DuplicateImageCopyWith<$Res> {
  _$DuplicateImageCopyWithImpl(this._self, this._then);

  final DuplicateImage _self;
  final $Res Function(DuplicateImage) _then;

/// Create a copy of DuplicateImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? hash = null,Object? size = null,Object? lastModified = null,Object? isSelected = null,Object? imageType = null,Object? typeConfidence = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,imageType: null == imageType ? _self.imageType : imageType // ignore: cast_nullable_to_non_nullable
as ImageType,typeConfidence: null == typeConfidence ? _self.typeConfidence : typeConfidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _DuplicateImage implements DuplicateImage {
  const _DuplicateImage({required this.path, required this.hash, required this.size, required this.lastModified, required this.isSelected, required this.imageType, required this.typeConfidence});
  

@override final  String path;
@override final  String hash;
@override final  int size;
@override final  DateTime lastModified;
@override final  bool isSelected;
@override final  ImageType imageType;
@override final  double typeConfidence;

/// Create a copy of DuplicateImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuplicateImageCopyWith<_DuplicateImage> get copyWith => __$DuplicateImageCopyWithImpl<_DuplicateImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuplicateImage&&(identical(other.path, path) || other.path == path)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.size, size) || other.size == size)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.imageType, imageType) || other.imageType == imageType)&&(identical(other.typeConfidence, typeConfidence) || other.typeConfidence == typeConfidence));
}


@override
int get hashCode => Object.hash(runtimeType,path,hash,size,lastModified,isSelected,imageType,typeConfidence);

@override
String toString() {
  return 'DuplicateImage(path: $path, hash: $hash, size: $size, lastModified: $lastModified, isSelected: $isSelected, imageType: $imageType, typeConfidence: $typeConfidence)';
}


}

/// @nodoc
abstract mixin class _$DuplicateImageCopyWith<$Res> implements $DuplicateImageCopyWith<$Res> {
  factory _$DuplicateImageCopyWith(_DuplicateImage value, $Res Function(_DuplicateImage) _then) = __$DuplicateImageCopyWithImpl;
@override @useResult
$Res call({
 String path, String hash, int size, DateTime lastModified, bool isSelected, ImageType imageType, double typeConfidence
});




}
/// @nodoc
class __$DuplicateImageCopyWithImpl<$Res>
    implements _$DuplicateImageCopyWith<$Res> {
  __$DuplicateImageCopyWithImpl(this._self, this._then);

  final _DuplicateImage _self;
  final $Res Function(_DuplicateImage) _then;

/// Create a copy of DuplicateImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? hash = null,Object? size = null,Object? lastModified = null,Object? isSelected = null,Object? imageType = null,Object? typeConfidence = null,}) {
  return _then(_DuplicateImage(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,imageType: null == imageType ? _self.imageType : imageType // ignore: cast_nullable_to_non_nullable
as ImageType,typeConfidence: null == typeConfidence ? _self.typeConfidence : typeConfidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$DuplicateGroup {

 String get hash; List<DuplicateImage> get images;
/// Create a copy of DuplicateGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuplicateGroupCopyWith<DuplicateGroup> get copyWith => _$DuplicateGroupCopyWithImpl<DuplicateGroup>(this as DuplicateGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicateGroup&&(identical(other.hash, hash) || other.hash == hash)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,hash,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'DuplicateGroup(hash: $hash, images: $images)';
}


}

/// @nodoc
abstract mixin class $DuplicateGroupCopyWith<$Res>  {
  factory $DuplicateGroupCopyWith(DuplicateGroup value, $Res Function(DuplicateGroup) _then) = _$DuplicateGroupCopyWithImpl;
@useResult
$Res call({
 String hash, List<DuplicateImage> images
});




}
/// @nodoc
class _$DuplicateGroupCopyWithImpl<$Res>
    implements $DuplicateGroupCopyWith<$Res> {
  _$DuplicateGroupCopyWithImpl(this._self, this._then);

  final DuplicateGroup _self;
  final $Res Function(DuplicateGroup) _then;

/// Create a copy of DuplicateGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? images = null,}) {
  return _then(_self.copyWith(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<DuplicateImage>,
  ));
}

}


/// @nodoc


class _DuplicateGroup implements DuplicateGroup {
  const _DuplicateGroup({required this.hash, required final  List<DuplicateImage> images}): _images = images;
  

@override final  String hash;
 final  List<DuplicateImage> _images;
@override List<DuplicateImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of DuplicateGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuplicateGroupCopyWith<_DuplicateGroup> get copyWith => __$DuplicateGroupCopyWithImpl<_DuplicateGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuplicateGroup&&(identical(other.hash, hash) || other.hash == hash)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,hash,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'DuplicateGroup(hash: $hash, images: $images)';
}


}

/// @nodoc
abstract mixin class _$DuplicateGroupCopyWith<$Res> implements $DuplicateGroupCopyWith<$Res> {
  factory _$DuplicateGroupCopyWith(_DuplicateGroup value, $Res Function(_DuplicateGroup) _then) = __$DuplicateGroupCopyWithImpl;
@override @useResult
$Res call({
 String hash, List<DuplicateImage> images
});




}
/// @nodoc
class __$DuplicateGroupCopyWithImpl<$Res>
    implements _$DuplicateGroupCopyWith<$Res> {
  __$DuplicateGroupCopyWithImpl(this._self, this._then);

  final _DuplicateGroup _self;
  final $Res Function(_DuplicateGroup) _then;

/// Create a copy of DuplicateGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hash = null,Object? images = null,}) {
  return _then(_DuplicateGroup(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<DuplicateImage>,
  ));
}


}

// dart format on
