import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:oxidized/oxidized.dart';
import 'package:sora/domain/core/core_failure.dart';
import 'package:sora/domain/duplicates/classification_algorithm.dart';
import 'package:sora/domain/duplicates/classified_image.dart';
import 'package:sora/domain/duplicates/duplicate_image.dart';
import 'package:sora/domain/duplicates/duplicates_failure.dart';
import 'package:sora/domain/duplicates/hash_algorithm.dart';
import 'package:sora/domain/duplicates/i_duplicates_repository.dart';
import 'package:sora/domain/duplicates/scan_mode.dart';

part 'duplicates_bloc.freezed.dart';
part 'duplicates_event.dart';
part 'duplicates_state.dart';

@injectable
class DuplicatesBloc extends Bloc<DuplicatesEvent, DuplicatesState> {
  DuplicatesBloc(this._duplicatesRepository)
    : super(DuplicatesState.initial()) {
    on<Init>((event, emit) {
      emit(DuplicatesState.initial());
    });

    on<SelectFolderPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      (await _duplicatesRepository.selectFolders()).match(
        (folderPaths) {
          // Replace existing folders
          emit(state.copyWith(selectedFolders: folderPaths, isLoading: false));
        },
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              failureOrOption: Option.some(
                Err(CoreFailure.duplicates(failure)),
              ),
            ),
          );
        },
      );
    });

    on<AddFolderPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      (await _duplicatesRepository.selectFolders()).match(
        (folderPaths) {
          // Add to existing folders
          final newFolders =
              {...state.selectedFolders, ...folderPaths}.toList();
          emit(state.copyWith(selectedFolders: newFolders, isLoading: false));
        },
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              failureOrOption: Option.some(
                Err(CoreFailure.duplicates(failure)),
              ),
            ),
          );
        },
      );
    });

    on<RemoveFolderPressed>((event, emit) {
      final updatedFolders =
          state.selectedFolders
              .where((folder) => folder != event.folderPath)
              .toList();
      emit(state.copyWith(selectedFolders: updatedFolders));
    });

    on<ScanPressed>((event, emit) async {
      if (state.selectedFolders.isEmpty) {
        return;
      }

      emit(
        state.copyWith(
          isScanning: true,
          scanProgress: 0,
          currentFile: '',
          duplicateGroups: [],
          classificationResult: const ClassificationResult(
            photos: [],
            drawings: [],
            unknown: [],
          ),
          failureOrOption: const None(),
        ),
      );

      if (state.scanMode == ScanMode.duplicates) {
        // Cancel any existing subscription
        await _scanSubscription?.cancel();
        _scanSubscription = null;

        // Start the stream and let it run independently
        _scanSubscription = _duplicatesRepository
            .findDuplicatesStream(
              state.selectedFolders,
              algorithm: state.selectedAlgorithm,
              onProgress: (progress, currentFile) {
                add(DuplicatesEvent.progressUpdated(progress, currentFile));
              },
            )
            .listen(
              (result) {
                result.match(
                  (group) => add(DuplicatesEvent.duplicateGroupFound(group)),
                  (failure) => add(DuplicatesEvent.scanError(failure)),
                );
              },
              onDone: () => add(const DuplicatesEvent.scanCompleted()),
              onError:
                  (_) => add(
                    const DuplicatesEvent.scanError(
                      DuplicatesFailure.processingError(),
                    ),
                  ),
              cancelOnError: false,
            );
      } else {
        // Classification mode
        (await _duplicatesRepository.classifyImages(
          state.selectedFolders,
          algorithm: state.selectedClassificationAlgorithm,
          onProgress: (progress, currentFile) {
            add(DuplicatesEvent.progressUpdated(progress, currentFile));
          },
        )).match(
          (result) {
            emit(
              state.copyWith(
                isScanning: false,
                classificationResult: result,
                scanProgress: 1,
              ),
            );
          },
          (failure) {
            emit(
              state.copyWith(
                isScanning: false,
                failureOrOption: Option.some(
                  Err(CoreFailure.duplicates(failure)),
                ),
              ),
            );
          },
        );
      }
    });

    on<ProgressUpdated>((event, emit) {
      if (state.isScanning) {
        emit(
          state.copyWith(
            scanProgress: event.progress,
            currentFile: event.currentFile,
          ),
        );
      }
    });

    on<ImageToggled>((event, emit) {
      final updatedGroups =
          state.duplicateGroups.map((group) {
            if (group.hash == event.groupHash) {
              return group.copyWith(
                images:
                    group.images.map((image) {
                      if (image.path == event.imagePath) {
                        return image.copyWith(isSelected: !image.isSelected);
                      }
                      return image;
                    }).toList(),
              );
            }
            return group;
          }).toList();

      emit(state.copyWith(duplicateGroups: updatedGroups));
    });

    on<SelectAllInGroupPressed>((event, emit) {
      final updatedGroups =
          state.duplicateGroups.map((group) {
            if (group.hash == event.groupHash) {
              final hasUnselected = group.images.any((img) => !img.isSelected);
              return group.copyWith(
                images:
                    group.images.map((image) {
                      return image.copyWith(isSelected: hasUnselected);
                    }).toList(),
              );
            }
            return group;
          }).toList();

      emit(state.copyWith(duplicateGroups: updatedGroups));
    });

    on<KeepOldestInGroupPressed>((event, emit) {
      final updatedGroups =
          state.duplicateGroups.map((group) {
            if (group.hash == event.groupHash) {
              final sortedImages = List<DuplicateImage>.from(group.images)
                ..sort((a, b) => a.lastModified.compareTo(b.lastModified));

              return group.copyWith(
                images:
                    sortedImages.asMap().entries.map((entry) {
                      return entry.value.copyWith(isSelected: entry.key > 0);
                    }).toList(),
              );
            }
            return group;
          }).toList();

      emit(state.copyWith(duplicateGroups: updatedGroups));
    });

    on<KeepNewestInGroupPressed>((event, emit) {
      final updatedGroups =
          state.duplicateGroups.map((group) {
            if (group.hash == event.groupHash) {
              final sortedImages = List<DuplicateImage>.from(group.images)
                ..sort((a, b) => b.lastModified.compareTo(a.lastModified));

              return group.copyWith(
                images:
                    sortedImages.asMap().entries.map((entry) {
                      return entry.value.copyWith(isSelected: entry.key > 0);
                    }).toList(),
              );
            }
            return group;
          }).toList();

      emit(state.copyWith(duplicateGroups: updatedGroups));
    });

    on<DeleteSelectedPressed>((event, emit) async {
      final selectedPaths = <String>[];

      for (final group in state.duplicateGroups) {
        for (final image in group.images) {
          if (image.isSelected) {
            selectedPaths.add(image.path);
          }
        }
      }

      if (selectedPaths.isEmpty) {
        return;
      }

      emit(state.copyWith(isDeleting: true));

      (await _duplicatesRepository.deleteImages(selectedPaths)).match(
        (_) {
          final updatedGroups = <DuplicateGroup>[];

          for (final group in state.duplicateGroups) {
            final remainingImages =
                group.images.where((img) => !img.isSelected).toList();

            if (remainingImages.length > 1) {
              updatedGroups.add(group.copyWith(images: remainingImages));
            }
          }

          emit(
            state.copyWith(isDeleting: false, duplicateGroups: updatedGroups),
          );
        },
        (failure) {
          emit(
            state.copyWith(
              isDeleting: false,
              failureOrOption: Option.some(
                Err(CoreFailure.duplicates(failure)),
              ),
            ),
          );
        },
      );
    });

    on<AlgorithmChanged>((event, emit) {
      emit(
        state.copyWith(selectedAlgorithm: event.algorithm, duplicateGroups: []),
      );
    });

    on<StopScanPressed>((event, emit) async {
      _duplicatesRepository.cancelScanning();
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      emit(state.copyWith(isScanning: false, scanProgress: 0, currentFile: ''));
    });

    on<DuplicateGroupFound>((event, emit) {
      if (!state.isScanning) return;

      // Update the duplicate groups map
      final duplicateGroupsMap = <String, DuplicateGroup>{};
      for (final group in state.duplicateGroups) {
        duplicateGroupsMap[group.hash] = group;
      }

      // Update or add the new group
      duplicateGroupsMap[event.group.hash] = event.group;

      final sortedGroups =
          duplicateGroupsMap.values.toList()
            ..sort((a, b) => b.images.length.compareTo(a.images.length));

      emit(state.copyWith(duplicateGroups: sortedGroups));
    });

    on<ScanCompleted>((event, emit) {
      emit(state.copyWith(isScanning: false, scanProgress: 1));
    });

    on<ScanError>((event, emit) {
      emit(
        state.copyWith(
          isScanning: false,
          failureOrOption: Option.some(
            Err(CoreFailure.duplicates(event.failure)),
          ),
        ),
      );
    });

    on<ScanModeChanged>((event, emit) {
      emit(
        state.copyWith(
          scanMode: event.mode,
          duplicateGroups: [],
          classificationResult: const ClassificationResult(
            photos: [],
            drawings: [],
            unknown: [],
          ),
        ),
      );
    });

    on<ClassifiedImageToggled>((event, emit) {
      final result = state.classificationResult;

      ClassifiedImage? toggleImage(List<ClassifiedImage> images) {
        final index = images.indexWhere((img) => img.path == event.imagePath);
        if (index != -1) {
          return images[index].copyWith(isSelected: !images[index].isSelected);
        }
        return null;
      }

      final photos = result.photos.toList();
      final drawings = result.drawings.toList();
      final unknown = result.unknown.toList();

      final photoToggled = toggleImage(photos);
      if (photoToggled != null) {
        photos[photos.indexWhere((img) => img.path == event.imagePath)] =
            photoToggled;
      }

      final drawingToggled = toggleImage(drawings);
      if (drawingToggled != null) {
        drawings[drawings.indexWhere((img) => img.path == event.imagePath)] =
            drawingToggled;
      }

      final unknownToggled = toggleImage(unknown);
      if (unknownToggled != null) {
        unknown[unknown.indexWhere((img) => img.path == event.imagePath)] =
            unknownToggled;
      }

      emit(
        state.copyWith(
          classificationResult: ClassificationResult(
            photos: photos,
            drawings: drawings,
            unknown: unknown,
          ),
        ),
      );
    });

    on<ClassificationAlgorithmChanged>((event, emit) {
      emit(
        state.copyWith(
          selectedClassificationAlgorithm: event.algorithm,
          classificationResult: const ClassificationResult(
            photos: [],
            drawings: [],
            unknown: [],
          ),
        ),
      );
    });
  }
  final IDuplicatesRepository _duplicatesRepository;
  StreamSubscription<Result<DuplicateGroup, DuplicatesFailure>>?
  _scanSubscription;

  @override
  Future<void> close() async {
    await _scanSubscription?.cancel();
    _scanSubscription = null;
    return super.close();
  }
}
