// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duplicates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DuplicatesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicatesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent()';
}


}

/// @nodoc
class $DuplicatesEventCopyWith<$Res>  {
$DuplicatesEventCopyWith(DuplicatesEvent _, $Res Function(DuplicatesEvent) __);
}


/// @nodoc


class Init implements DuplicatesEvent {
  const Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.init()';
}


}




/// @nodoc


class SelectFolderPressed implements DuplicatesEvent {
  const SelectFolderPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectFolderPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.selectFolderPressed()';
}


}




/// @nodoc


class AddFolderPressed implements DuplicatesEvent {
  const AddFolderPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFolderPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.addFolderPressed()';
}


}




/// @nodoc


class RemoveFolderPressed implements DuplicatesEvent {
  const RemoveFolderPressed(this.folderPath);
  

 final  String folderPath;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFolderPressedCopyWith<RemoveFolderPressed> get copyWith => _$RemoveFolderPressedCopyWithImpl<RemoveFolderPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFolderPressed&&(identical(other.folderPath, folderPath) || other.folderPath == folderPath));
}


@override
int get hashCode => Object.hash(runtimeType,folderPath);

@override
String toString() {
  return 'DuplicatesEvent.removeFolderPressed(folderPath: $folderPath)';
}


}

/// @nodoc
abstract mixin class $RemoveFolderPressedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $RemoveFolderPressedCopyWith(RemoveFolderPressed value, $Res Function(RemoveFolderPressed) _then) = _$RemoveFolderPressedCopyWithImpl;
@useResult
$Res call({
 String folderPath
});




}
/// @nodoc
class _$RemoveFolderPressedCopyWithImpl<$Res>
    implements $RemoveFolderPressedCopyWith<$Res> {
  _$RemoveFolderPressedCopyWithImpl(this._self, this._then);

  final RemoveFolderPressed _self;
  final $Res Function(RemoveFolderPressed) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? folderPath = null,}) {
  return _then(RemoveFolderPressed(
null == folderPath ? _self.folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ScanPressed implements DuplicatesEvent {
  const ScanPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.scanPressed()';
}


}




/// @nodoc


class StopScanPressed implements DuplicatesEvent {
  const StopScanPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopScanPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.stopScanPressed()';
}


}




/// @nodoc


class ProgressUpdated implements DuplicatesEvent {
  const ProgressUpdated(this.progress, this.currentFile);
  

 final  double progress;
 final  String currentFile;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressUpdatedCopyWith<ProgressUpdated> get copyWith => _$ProgressUpdatedCopyWithImpl<ProgressUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressUpdated&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.currentFile, currentFile) || other.currentFile == currentFile));
}


@override
int get hashCode => Object.hash(runtimeType,progress,currentFile);

@override
String toString() {
  return 'DuplicatesEvent.progressUpdated(progress: $progress, currentFile: $currentFile)';
}


}

/// @nodoc
abstract mixin class $ProgressUpdatedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $ProgressUpdatedCopyWith(ProgressUpdated value, $Res Function(ProgressUpdated) _then) = _$ProgressUpdatedCopyWithImpl;
@useResult
$Res call({
 double progress, String currentFile
});




}
/// @nodoc
class _$ProgressUpdatedCopyWithImpl<$Res>
    implements $ProgressUpdatedCopyWith<$Res> {
  _$ProgressUpdatedCopyWithImpl(this._self, this._then);

  final ProgressUpdated _self;
  final $Res Function(ProgressUpdated) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? currentFile = null,}) {
  return _then(ProgressUpdated(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,null == currentFile ? _self.currentFile : currentFile // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DuplicateGroupFound implements DuplicatesEvent {
  const DuplicateGroupFound(this.group);
  

 final  DuplicateGroup group;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuplicateGroupFoundCopyWith<DuplicateGroupFound> get copyWith => _$DuplicateGroupFoundCopyWithImpl<DuplicateGroupFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicateGroupFound&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,group);

@override
String toString() {
  return 'DuplicatesEvent.duplicateGroupFound(group: $group)';
}


}

/// @nodoc
abstract mixin class $DuplicateGroupFoundCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $DuplicateGroupFoundCopyWith(DuplicateGroupFound value, $Res Function(DuplicateGroupFound) _then) = _$DuplicateGroupFoundCopyWithImpl;
@useResult
$Res call({
 DuplicateGroup group
});


$DuplicateGroupCopyWith<$Res> get group;

}
/// @nodoc
class _$DuplicateGroupFoundCopyWithImpl<$Res>
    implements $DuplicateGroupFoundCopyWith<$Res> {
  _$DuplicateGroupFoundCopyWithImpl(this._self, this._then);

  final DuplicateGroupFound _self;
  final $Res Function(DuplicateGroupFound) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? group = null,}) {
  return _then(DuplicateGroupFound(
null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as DuplicateGroup,
  ));
}

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuplicateGroupCopyWith<$Res> get group {
  
  return $DuplicateGroupCopyWith<$Res>(_self.group, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}

/// @nodoc


class ScanCompleted implements DuplicatesEvent {
  const ScanCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.scanCompleted()';
}


}




/// @nodoc


class ScanError implements DuplicatesEvent {
  const ScanError(this.failure);
  

 final  DuplicatesFailure failure;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanErrorCopyWith<ScanError> get copyWith => _$ScanErrorCopyWithImpl<ScanError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DuplicatesEvent.scanError(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ScanErrorCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $ScanErrorCopyWith(ScanError value, $Res Function(ScanError) _then) = _$ScanErrorCopyWithImpl;
@useResult
$Res call({
 DuplicatesFailure failure
});


$DuplicatesFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ScanErrorCopyWithImpl<$Res>
    implements $ScanErrorCopyWith<$Res> {
  _$ScanErrorCopyWithImpl(this._self, this._then);

  final ScanError _self;
  final $Res Function(ScanError) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ScanError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as DuplicatesFailure,
  ));
}

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuplicatesFailureCopyWith<$Res> get failure {
  
  return $DuplicatesFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc


class ImageToggled implements DuplicatesEvent {
  const ImageToggled(this.groupHash, this.imagePath);
  

 final  String groupHash;
 final  String imagePath;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageToggledCopyWith<ImageToggled> get copyWith => _$ImageToggledCopyWithImpl<ImageToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageToggled&&(identical(other.groupHash, groupHash) || other.groupHash == groupHash)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,groupHash,imagePath);

@override
String toString() {
  return 'DuplicatesEvent.imageToggled(groupHash: $groupHash, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ImageToggledCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $ImageToggledCopyWith(ImageToggled value, $Res Function(ImageToggled) _then) = _$ImageToggledCopyWithImpl;
@useResult
$Res call({
 String groupHash, String imagePath
});




}
/// @nodoc
class _$ImageToggledCopyWithImpl<$Res>
    implements $ImageToggledCopyWith<$Res> {
  _$ImageToggledCopyWithImpl(this._self, this._then);

  final ImageToggled _self;
  final $Res Function(ImageToggled) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupHash = null,Object? imagePath = null,}) {
  return _then(ImageToggled(
null == groupHash ? _self.groupHash : groupHash // ignore: cast_nullable_to_non_nullable
as String,null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectAllInGroupPressed implements DuplicatesEvent {
  const SelectAllInGroupPressed(this.groupHash);
  

 final  String groupHash;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectAllInGroupPressedCopyWith<SelectAllInGroupPressed> get copyWith => _$SelectAllInGroupPressedCopyWithImpl<SelectAllInGroupPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectAllInGroupPressed&&(identical(other.groupHash, groupHash) || other.groupHash == groupHash));
}


@override
int get hashCode => Object.hash(runtimeType,groupHash);

@override
String toString() {
  return 'DuplicatesEvent.selectAllInGroupPressed(groupHash: $groupHash)';
}


}

/// @nodoc
abstract mixin class $SelectAllInGroupPressedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $SelectAllInGroupPressedCopyWith(SelectAllInGroupPressed value, $Res Function(SelectAllInGroupPressed) _then) = _$SelectAllInGroupPressedCopyWithImpl;
@useResult
$Res call({
 String groupHash
});




}
/// @nodoc
class _$SelectAllInGroupPressedCopyWithImpl<$Res>
    implements $SelectAllInGroupPressedCopyWith<$Res> {
  _$SelectAllInGroupPressedCopyWithImpl(this._self, this._then);

  final SelectAllInGroupPressed _self;
  final $Res Function(SelectAllInGroupPressed) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupHash = null,}) {
  return _then(SelectAllInGroupPressed(
null == groupHash ? _self.groupHash : groupHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class KeepOldestInGroupPressed implements DuplicatesEvent {
  const KeepOldestInGroupPressed(this.groupHash);
  

 final  String groupHash;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeepOldestInGroupPressedCopyWith<KeepOldestInGroupPressed> get copyWith => _$KeepOldestInGroupPressedCopyWithImpl<KeepOldestInGroupPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeepOldestInGroupPressed&&(identical(other.groupHash, groupHash) || other.groupHash == groupHash));
}


@override
int get hashCode => Object.hash(runtimeType,groupHash);

@override
String toString() {
  return 'DuplicatesEvent.keepOldestInGroupPressed(groupHash: $groupHash)';
}


}

/// @nodoc
abstract mixin class $KeepOldestInGroupPressedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $KeepOldestInGroupPressedCopyWith(KeepOldestInGroupPressed value, $Res Function(KeepOldestInGroupPressed) _then) = _$KeepOldestInGroupPressedCopyWithImpl;
@useResult
$Res call({
 String groupHash
});




}
/// @nodoc
class _$KeepOldestInGroupPressedCopyWithImpl<$Res>
    implements $KeepOldestInGroupPressedCopyWith<$Res> {
  _$KeepOldestInGroupPressedCopyWithImpl(this._self, this._then);

  final KeepOldestInGroupPressed _self;
  final $Res Function(KeepOldestInGroupPressed) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupHash = null,}) {
  return _then(KeepOldestInGroupPressed(
null == groupHash ? _self.groupHash : groupHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class KeepNewestInGroupPressed implements DuplicatesEvent {
  const KeepNewestInGroupPressed(this.groupHash);
  

 final  String groupHash;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeepNewestInGroupPressedCopyWith<KeepNewestInGroupPressed> get copyWith => _$KeepNewestInGroupPressedCopyWithImpl<KeepNewestInGroupPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeepNewestInGroupPressed&&(identical(other.groupHash, groupHash) || other.groupHash == groupHash));
}


@override
int get hashCode => Object.hash(runtimeType,groupHash);

@override
String toString() {
  return 'DuplicatesEvent.keepNewestInGroupPressed(groupHash: $groupHash)';
}


}

/// @nodoc
abstract mixin class $KeepNewestInGroupPressedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $KeepNewestInGroupPressedCopyWith(KeepNewestInGroupPressed value, $Res Function(KeepNewestInGroupPressed) _then) = _$KeepNewestInGroupPressedCopyWithImpl;
@useResult
$Res call({
 String groupHash
});




}
/// @nodoc
class _$KeepNewestInGroupPressedCopyWithImpl<$Res>
    implements $KeepNewestInGroupPressedCopyWith<$Res> {
  _$KeepNewestInGroupPressedCopyWithImpl(this._self, this._then);

  final KeepNewestInGroupPressed _self;
  final $Res Function(KeepNewestInGroupPressed) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupHash = null,}) {
  return _then(KeepNewestInGroupPressed(
null == groupHash ? _self.groupHash : groupHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteSelectedPressed implements DuplicatesEvent {
  const DeleteSelectedPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteSelectedPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DuplicatesEvent.deleteSelectedPressed()';
}


}




/// @nodoc


class AlgorithmChanged implements DuplicatesEvent {
  const AlgorithmChanged(this.algorithm);
  

 final  HashAlgorithm algorithm;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlgorithmChangedCopyWith<AlgorithmChanged> get copyWith => _$AlgorithmChangedCopyWithImpl<AlgorithmChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlgorithmChanged&&(identical(other.algorithm, algorithm) || other.algorithm == algorithm));
}


@override
int get hashCode => Object.hash(runtimeType,algorithm);

@override
String toString() {
  return 'DuplicatesEvent.algorithmChanged(algorithm: $algorithm)';
}


}

/// @nodoc
abstract mixin class $AlgorithmChangedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $AlgorithmChangedCopyWith(AlgorithmChanged value, $Res Function(AlgorithmChanged) _then) = _$AlgorithmChangedCopyWithImpl;
@useResult
$Res call({
 HashAlgorithm algorithm
});




}
/// @nodoc
class _$AlgorithmChangedCopyWithImpl<$Res>
    implements $AlgorithmChangedCopyWith<$Res> {
  _$AlgorithmChangedCopyWithImpl(this._self, this._then);

  final AlgorithmChanged _self;
  final $Res Function(AlgorithmChanged) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? algorithm = null,}) {
  return _then(AlgorithmChanged(
null == algorithm ? _self.algorithm : algorithm // ignore: cast_nullable_to_non_nullable
as HashAlgorithm,
  ));
}


}

/// @nodoc


class ScanModeChanged implements DuplicatesEvent {
  const ScanModeChanged(this.mode);
  

 final  ScanMode mode;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanModeChangedCopyWith<ScanModeChanged> get copyWith => _$ScanModeChangedCopyWithImpl<ScanModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'DuplicatesEvent.scanModeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $ScanModeChangedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $ScanModeChangedCopyWith(ScanModeChanged value, $Res Function(ScanModeChanged) _then) = _$ScanModeChangedCopyWithImpl;
@useResult
$Res call({
 ScanMode mode
});




}
/// @nodoc
class _$ScanModeChangedCopyWithImpl<$Res>
    implements $ScanModeChangedCopyWith<$Res> {
  _$ScanModeChangedCopyWithImpl(this._self, this._then);

  final ScanModeChanged _self;
  final $Res Function(ScanModeChanged) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(ScanModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ScanMode,
  ));
}


}

/// @nodoc


class ClassifiedImageToggled implements DuplicatesEvent {
  const ClassifiedImageToggled(this.imagePath);
  

 final  String imagePath;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassifiedImageToggledCopyWith<ClassifiedImageToggled> get copyWith => _$ClassifiedImageToggledCopyWithImpl<ClassifiedImageToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifiedImageToggled&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'DuplicatesEvent.classifiedImageToggled(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ClassifiedImageToggledCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $ClassifiedImageToggledCopyWith(ClassifiedImageToggled value, $Res Function(ClassifiedImageToggled) _then) = _$ClassifiedImageToggledCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$ClassifiedImageToggledCopyWithImpl<$Res>
    implements $ClassifiedImageToggledCopyWith<$Res> {
  _$ClassifiedImageToggledCopyWithImpl(this._self, this._then);

  final ClassifiedImageToggled _self;
  final $Res Function(ClassifiedImageToggled) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(ClassifiedImageToggled(
null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClassificationAlgorithmChanged implements DuplicatesEvent {
  const ClassificationAlgorithmChanged(this.algorithm);
  

 final  ClassificationAlgorithm algorithm;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassificationAlgorithmChangedCopyWith<ClassificationAlgorithmChanged> get copyWith => _$ClassificationAlgorithmChangedCopyWithImpl<ClassificationAlgorithmChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassificationAlgorithmChanged&&(identical(other.algorithm, algorithm) || other.algorithm == algorithm));
}


@override
int get hashCode => Object.hash(runtimeType,algorithm);

@override
String toString() {
  return 'DuplicatesEvent.classificationAlgorithmChanged(algorithm: $algorithm)';
}


}

/// @nodoc
abstract mixin class $ClassificationAlgorithmChangedCopyWith<$Res> implements $DuplicatesEventCopyWith<$Res> {
  factory $ClassificationAlgorithmChangedCopyWith(ClassificationAlgorithmChanged value, $Res Function(ClassificationAlgorithmChanged) _then) = _$ClassificationAlgorithmChangedCopyWithImpl;
@useResult
$Res call({
 ClassificationAlgorithm algorithm
});




}
/// @nodoc
class _$ClassificationAlgorithmChangedCopyWithImpl<$Res>
    implements $ClassificationAlgorithmChangedCopyWith<$Res> {
  _$ClassificationAlgorithmChangedCopyWithImpl(this._self, this._then);

  final ClassificationAlgorithmChanged _self;
  final $Res Function(ClassificationAlgorithmChanged) _then;

/// Create a copy of DuplicatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? algorithm = null,}) {
  return _then(ClassificationAlgorithmChanged(
null == algorithm ? _self.algorithm : algorithm // ignore: cast_nullable_to_non_nullable
as ClassificationAlgorithm,
  ));
}


}

/// @nodoc
mixin _$DuplicatesState {

 List<String> get selectedFolders; List<DuplicateGroup> get duplicateGroups; ClassificationResult get classificationResult; bool get isLoading; bool get isScanning; bool get isDeleting; double get scanProgress; String get currentFile; HashAlgorithm get selectedAlgorithm; ClassificationAlgorithm get selectedClassificationAlgorithm; ScanMode get scanMode; Option<Result<Unit, CoreFailure>> get failureOrOption;
/// Create a copy of DuplicatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuplicatesStateCopyWith<DuplicatesState> get copyWith => _$DuplicatesStateCopyWithImpl<DuplicatesState>(this as DuplicatesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicatesState&&const DeepCollectionEquality().equals(other.selectedFolders, selectedFolders)&&const DeepCollectionEquality().equals(other.duplicateGroups, duplicateGroups)&&(identical(other.classificationResult, classificationResult) || other.classificationResult == classificationResult)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.scanProgress, scanProgress) || other.scanProgress == scanProgress)&&(identical(other.currentFile, currentFile) || other.currentFile == currentFile)&&(identical(other.selectedAlgorithm, selectedAlgorithm) || other.selectedAlgorithm == selectedAlgorithm)&&(identical(other.selectedClassificationAlgorithm, selectedClassificationAlgorithm) || other.selectedClassificationAlgorithm == selectedClassificationAlgorithm)&&(identical(other.scanMode, scanMode) || other.scanMode == scanMode)&&(identical(other.failureOrOption, failureOrOption) || other.failureOrOption == failureOrOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedFolders),const DeepCollectionEquality().hash(duplicateGroups),classificationResult,isLoading,isScanning,isDeleting,scanProgress,currentFile,selectedAlgorithm,selectedClassificationAlgorithm,scanMode,failureOrOption);

@override
String toString() {
  return 'DuplicatesState(selectedFolders: $selectedFolders, duplicateGroups: $duplicateGroups, classificationResult: $classificationResult, isLoading: $isLoading, isScanning: $isScanning, isDeleting: $isDeleting, scanProgress: $scanProgress, currentFile: $currentFile, selectedAlgorithm: $selectedAlgorithm, selectedClassificationAlgorithm: $selectedClassificationAlgorithm, scanMode: $scanMode, failureOrOption: $failureOrOption)';
}


}

/// @nodoc
abstract mixin class $DuplicatesStateCopyWith<$Res>  {
  factory $DuplicatesStateCopyWith(DuplicatesState value, $Res Function(DuplicatesState) _then) = _$DuplicatesStateCopyWithImpl;
@useResult
$Res call({
 List<String> selectedFolders, List<DuplicateGroup> duplicateGroups, ClassificationResult classificationResult, bool isLoading, bool isScanning, bool isDeleting, double scanProgress, String currentFile, HashAlgorithm selectedAlgorithm, ClassificationAlgorithm selectedClassificationAlgorithm, ScanMode scanMode, Option<Result<Unit, CoreFailure>> failureOrOption
});


$ClassificationResultCopyWith<$Res> get classificationResult;

}
/// @nodoc
class _$DuplicatesStateCopyWithImpl<$Res>
    implements $DuplicatesStateCopyWith<$Res> {
  _$DuplicatesStateCopyWithImpl(this._self, this._then);

  final DuplicatesState _self;
  final $Res Function(DuplicatesState) _then;

/// Create a copy of DuplicatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFolders = null,Object? duplicateGroups = null,Object? classificationResult = null,Object? isLoading = null,Object? isScanning = null,Object? isDeleting = null,Object? scanProgress = null,Object? currentFile = null,Object? selectedAlgorithm = null,Object? selectedClassificationAlgorithm = null,Object? scanMode = null,Object? failureOrOption = null,}) {
  return _then(_self.copyWith(
selectedFolders: null == selectedFolders ? _self.selectedFolders : selectedFolders // ignore: cast_nullable_to_non_nullable
as List<String>,duplicateGroups: null == duplicateGroups ? _self.duplicateGroups : duplicateGroups // ignore: cast_nullable_to_non_nullable
as List<DuplicateGroup>,classificationResult: null == classificationResult ? _self.classificationResult : classificationResult // ignore: cast_nullable_to_non_nullable
as ClassificationResult,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,scanProgress: null == scanProgress ? _self.scanProgress : scanProgress // ignore: cast_nullable_to_non_nullable
as double,currentFile: null == currentFile ? _self.currentFile : currentFile // ignore: cast_nullable_to_non_nullable
as String,selectedAlgorithm: null == selectedAlgorithm ? _self.selectedAlgorithm : selectedAlgorithm // ignore: cast_nullable_to_non_nullable
as HashAlgorithm,selectedClassificationAlgorithm: null == selectedClassificationAlgorithm ? _self.selectedClassificationAlgorithm : selectedClassificationAlgorithm // ignore: cast_nullable_to_non_nullable
as ClassificationAlgorithm,scanMode: null == scanMode ? _self.scanMode : scanMode // ignore: cast_nullable_to_non_nullable
as ScanMode,failureOrOption: null == failureOrOption ? _self.failureOrOption : failureOrOption // ignore: cast_nullable_to_non_nullable
as Option<Result<Unit, CoreFailure>>,
  ));
}
/// Create a copy of DuplicatesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassificationResultCopyWith<$Res> get classificationResult {
  
  return $ClassificationResultCopyWith<$Res>(_self.classificationResult, (value) {
    return _then(_self.copyWith(classificationResult: value));
  });
}
}


/// @nodoc


class _DuplicatesState implements DuplicatesState {
  const _DuplicatesState({required final  List<String> selectedFolders, required final  List<DuplicateGroup> duplicateGroups, required this.classificationResult, required this.isLoading, required this.isScanning, required this.isDeleting, required this.scanProgress, required this.currentFile, required this.selectedAlgorithm, required this.selectedClassificationAlgorithm, required this.scanMode, required this.failureOrOption}): _selectedFolders = selectedFolders,_duplicateGroups = duplicateGroups;
  

 final  List<String> _selectedFolders;
@override List<String> get selectedFolders {
  if (_selectedFolders is EqualUnmodifiableListView) return _selectedFolders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedFolders);
}

 final  List<DuplicateGroup> _duplicateGroups;
@override List<DuplicateGroup> get duplicateGroups {
  if (_duplicateGroups is EqualUnmodifiableListView) return _duplicateGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_duplicateGroups);
}

@override final  ClassificationResult classificationResult;
@override final  bool isLoading;
@override final  bool isScanning;
@override final  bool isDeleting;
@override final  double scanProgress;
@override final  String currentFile;
@override final  HashAlgorithm selectedAlgorithm;
@override final  ClassificationAlgorithm selectedClassificationAlgorithm;
@override final  ScanMode scanMode;
@override final  Option<Result<Unit, CoreFailure>> failureOrOption;

/// Create a copy of DuplicatesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuplicatesStateCopyWith<_DuplicatesState> get copyWith => __$DuplicatesStateCopyWithImpl<_DuplicatesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuplicatesState&&const DeepCollectionEquality().equals(other._selectedFolders, _selectedFolders)&&const DeepCollectionEquality().equals(other._duplicateGroups, _duplicateGroups)&&(identical(other.classificationResult, classificationResult) || other.classificationResult == classificationResult)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.scanProgress, scanProgress) || other.scanProgress == scanProgress)&&(identical(other.currentFile, currentFile) || other.currentFile == currentFile)&&(identical(other.selectedAlgorithm, selectedAlgorithm) || other.selectedAlgorithm == selectedAlgorithm)&&(identical(other.selectedClassificationAlgorithm, selectedClassificationAlgorithm) || other.selectedClassificationAlgorithm == selectedClassificationAlgorithm)&&(identical(other.scanMode, scanMode) || other.scanMode == scanMode)&&(identical(other.failureOrOption, failureOrOption) || other.failureOrOption == failureOrOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedFolders),const DeepCollectionEquality().hash(_duplicateGroups),classificationResult,isLoading,isScanning,isDeleting,scanProgress,currentFile,selectedAlgorithm,selectedClassificationAlgorithm,scanMode,failureOrOption);

@override
String toString() {
  return 'DuplicatesState(selectedFolders: $selectedFolders, duplicateGroups: $duplicateGroups, classificationResult: $classificationResult, isLoading: $isLoading, isScanning: $isScanning, isDeleting: $isDeleting, scanProgress: $scanProgress, currentFile: $currentFile, selectedAlgorithm: $selectedAlgorithm, selectedClassificationAlgorithm: $selectedClassificationAlgorithm, scanMode: $scanMode, failureOrOption: $failureOrOption)';
}


}

/// @nodoc
abstract mixin class _$DuplicatesStateCopyWith<$Res> implements $DuplicatesStateCopyWith<$Res> {
  factory _$DuplicatesStateCopyWith(_DuplicatesState value, $Res Function(_DuplicatesState) _then) = __$DuplicatesStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> selectedFolders, List<DuplicateGroup> duplicateGroups, ClassificationResult classificationResult, bool isLoading, bool isScanning, bool isDeleting, double scanProgress, String currentFile, HashAlgorithm selectedAlgorithm, ClassificationAlgorithm selectedClassificationAlgorithm, ScanMode scanMode, Option<Result<Unit, CoreFailure>> failureOrOption
});


@override $ClassificationResultCopyWith<$Res> get classificationResult;

}
/// @nodoc
class __$DuplicatesStateCopyWithImpl<$Res>
    implements _$DuplicatesStateCopyWith<$Res> {
  __$DuplicatesStateCopyWithImpl(this._self, this._then);

  final _DuplicatesState _self;
  final $Res Function(_DuplicatesState) _then;

/// Create a copy of DuplicatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFolders = null,Object? duplicateGroups = null,Object? classificationResult = null,Object? isLoading = null,Object? isScanning = null,Object? isDeleting = null,Object? scanProgress = null,Object? currentFile = null,Object? selectedAlgorithm = null,Object? selectedClassificationAlgorithm = null,Object? scanMode = null,Object? failureOrOption = null,}) {
  return _then(_DuplicatesState(
selectedFolders: null == selectedFolders ? _self._selectedFolders : selectedFolders // ignore: cast_nullable_to_non_nullable
as List<String>,duplicateGroups: null == duplicateGroups ? _self._duplicateGroups : duplicateGroups // ignore: cast_nullable_to_non_nullable
as List<DuplicateGroup>,classificationResult: null == classificationResult ? _self.classificationResult : classificationResult // ignore: cast_nullable_to_non_nullable
as ClassificationResult,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,scanProgress: null == scanProgress ? _self.scanProgress : scanProgress // ignore: cast_nullable_to_non_nullable
as double,currentFile: null == currentFile ? _self.currentFile : currentFile // ignore: cast_nullable_to_non_nullable
as String,selectedAlgorithm: null == selectedAlgorithm ? _self.selectedAlgorithm : selectedAlgorithm // ignore: cast_nullable_to_non_nullable
as HashAlgorithm,selectedClassificationAlgorithm: null == selectedClassificationAlgorithm ? _self.selectedClassificationAlgorithm : selectedClassificationAlgorithm // ignore: cast_nullable_to_non_nullable
as ClassificationAlgorithm,scanMode: null == scanMode ? _self.scanMode : scanMode // ignore: cast_nullable_to_non_nullable
as ScanMode,failureOrOption: null == failureOrOption ? _self.failureOrOption : failureOrOption // ignore: cast_nullable_to_non_nullable
as Option<Result<Unit, CoreFailure>>,
  ));
}

/// Create a copy of DuplicatesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassificationResultCopyWith<$Res> get classificationResult {
  
  return $ClassificationResultCopyWith<$Res>(_self.classificationResult, (value) {
    return _then(_self.copyWith(classificationResult: value));
  });
}
}

// dart format on
