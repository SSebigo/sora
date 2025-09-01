import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/scan_mode.dart';
import 'package:sora/presentation/core/default_button.dart';
import 'package:sora/presentation/duplicates/widgets/classification_algorithm_selector.dart';
import 'package:sora/presentation/duplicates/widgets/hash_algorithm_selector.dart';
import 'package:sora/presentation/duplicates/widgets/scan_mode_selector.dart';
import 'package:sora/utils/palette.dart';

class DuplicatesHeader extends StatelessWidget {
  const DuplicatesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DuplicatesBloc, DuplicatesState>(
      builder: (context, state) {
        final selectedCount = state.duplicateGroups.fold<int>(
          0,
          (sum, group) =>
              sum + group.images.where((img) => img.isSelected).length,
        );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _HeaderTitle(
                  duplicateGroupsCount: state.duplicateGroups.length,
                  isScanning: state.isScanning,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ScanModeSelector(
                  scanMode: state.scanMode,
                  isDisabled: state.isScanning || state.isDeleting,
                ),
              ),
              _ControlsRow(state: state, selectedCount: selectedCount),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle({
    required this.duplicateGroupsCount,
    required this.isScanning,
  });

  final int duplicateGroupsCount;
  final bool isScanning;

  @override
  Widget build(BuildContext context) {
    if (duplicateGroupsCount > 0 && !isScanning) {
      return _DuplicateCountBadge(count: duplicateGroupsCount);
    }
    return Container();
  }
}

class _DuplicateCountBadge extends StatelessWidget {
  const _DuplicateCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Palette.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        '$count duplicate groups found',
        style: const TextStyle(color: Palette.white),
      ),
    );
  }
}

class _ControlsRow extends StatelessWidget {
  const _ControlsRow({required this.state, required this.selectedCount});

  final DuplicatesState state;
  final int selectedCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FoldersDisplay(selectedFolders: state.selectedFolders),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10),
            if (state.scanMode == ScanMode.duplicates) ...[
              HashAlgorithmSelector(
                selectedAlgorithm: state.selectedAlgorithm,
                isDisabled: state.isScanning || state.isDeleting,
              ),
              const SizedBox(width: 10),
            ],
            if (state.scanMode == ScanMode.classification) ...[
              ClassificationAlgorithmSelector(
                selectedAlgorithm: state.selectedClassificationAlgorithm,
                isDisabled: state.isScanning || state.isDeleting,
              ),
              const SizedBox(width: 10),
            ],
            const Spacer(),
            _AddFolderButton(isDisabled: state.isScanning || state.isDeleting),
            const SizedBox(width: 10),
            _ScanButton(
              isDisabled:
                  state.isScanning ||
                  state.isDeleting ||
                  state.selectedFolders.isEmpty,
            ),
            if (selectedCount > 0) ...[
              const SizedBox(width: 10),
              _DeleteSelectedButton(
                selectedCount: selectedCount,
                isDisabled: state.isDeleting,
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _FoldersDisplay extends StatelessWidget {
  const _FoldersDisplay({required this.selectedFolders});

  final List<String> selectedFolders;

  @override
  Widget build(BuildContext context) {
    if (selectedFolders.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Palette.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          'No folders selected',
          style: TextStyle(fontSize: 14),
        ),
      );
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: selectedFolders.length,
        itemBuilder: (context, index) {
          final folder = selectedFolders[index];
          return ListTile(
            dense: true,
            title: Text(
              p.basename(folder),
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              folder,
              style: const TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close, size: 16),
              onPressed:
                  () => context.read<DuplicatesBloc>().add(
                    DuplicatesEvent.removeFolderPressed(folder),
                  ),
            ),
          );
        },
      ),
    );
  }
}

class _AddFolderButton extends StatelessWidget {
  const _AddFolderButton({required this.isDisabled});

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final hasSelectedFolders = context.select<DuplicatesBloc, bool>(
      (bloc) => bloc.state.selectedFolders.isNotEmpty,
    );

    return DefaultButton(
      title: hasSelectedFolders ? 'Add Folder' : 'Select Folder',
      isLoading: false,
      onPressed:
          () => context.read<DuplicatesBloc>().add(
            hasSelectedFolders
                ? const DuplicatesEvent.addFolderPressed()
                : const DuplicatesEvent.selectFolderPressed(),
          ),
      disabled: isDisabled,
    );
  }
}

class _ScanButton extends StatelessWidget {
  const _ScanButton({required this.isDisabled});

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: 'Scan',
      isLoading: false,
      onPressed:
          () => context.read<DuplicatesBloc>().add(
            const DuplicatesEvent.scanPressed(),
          ),
      disabled: isDisabled,
    );
  }
}

class _DeleteSelectedButton extends StatelessWidget {
  const _DeleteSelectedButton({
    required this.selectedCount,
    required this.isDisabled,
  });

  final int selectedCount;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: 'Delete Selected ($selectedCount)',
      isLoading: false,
      color: Colors.red,
      onPressed: () => _showDeleteConfirmation(context, selectedCount),
      disabled: isDisabled,
    );
  }

  void _showDeleteConfirmation(BuildContext context, int count) {
    showDialog<void>(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text('Confirm Deletion'),
            content: Text(
              'Are you sure you want to delete $count selected images?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<DuplicatesBloc>().add(
                    const DuplicatesEvent.deleteSelectedPressed(),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }
}
