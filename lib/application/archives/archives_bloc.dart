import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:oxidized/oxidized.dart';
import 'package:sora/domain/core/core_failure.dart';
import 'package:sora/domain/core/download_info.dart';
import 'package:sora/domain/core/url.dart';
import 'package:sora/domain/gallery_dl/i_gallery_dl_repository.dart';
import 'package:sora/utils/pagination.dart';

part 'archives_bloc.freezed.dart';
part 'archives_event.dart';
part 'archives_state.dart';

@injectable
class ArchivesBloc extends Bloc<ArchivesEvent, ArchivesState> {
  ArchivesBloc(this._galleryDLRepository) : super(ArchivesState.initial()) {
    on<Init>((event, emit) async {
      (await _galleryDLRepository.countArchivesItems()).match((count) {
        emit(state.copyWith(itemsCount: count));

        add(const ArchivesEvent.itemsCounted());
      }, (failure) {});
    });
    on<ItemsCounted>((event, emit) async {
      final offset =
          state.paginationIdx == 0
              ? null
              : state.paginationIdx * Pagination.archiveItemPerPage;

      (await _galleryDLRepository.fetchArchives(
        Pagination.archiveItemPerPage,
        offset: offset,
      )).match((downloadInfos) {
        emit(state.copyWith(downloadInfos: downloadInfos));
      }, (failure) {});
    });
    on<OpenInNewPressed>((event, emit) async {
      (await _galleryDLRepository.launchContentURL(
        event.downloadInfo,
      )).match((_) {}, (failure) {});
    });
    on<PagePressed>((event, emit) {
      final newIdx = event.idx;

      if (newIdx == state.paginationIdx) {
        return;
      }

      emit(state.copyWith(paginationIdx: newIdx));

      add(const ArchivesEvent.itemsCounted());
    });
    on<CopyURLToClipboardPressed>((event, emit) async {
      (await _galleryDLRepository.copyURLToClipboard(
        event.url,
      )).match((_) {}, (failure) {});
    });
  }

  final IGalleryDLRepository _galleryDLRepository;
}
