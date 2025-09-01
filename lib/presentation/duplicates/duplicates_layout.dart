import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/scan_mode.dart';
import 'package:sora/presentation/duplicates/widgets/classification_results.dart';
import 'package:sora/presentation/duplicates/widgets/duplicate_group_card.dart';
import 'package:sora/presentation/duplicates/widgets/duplicates_header.dart';
import 'package:sora/presentation/duplicates/widgets/scan_progress_indicator.dart';

class DuplicatesLayout extends StatelessWidget {
  const DuplicatesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DuplicatesBloc, DuplicatesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 7.5, top: 7.5, bottom: 7.5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DuplicatesHeader(),
                const SizedBox(height: 20),
                if (state.isScanning)
                  ScanProgressIndicator(
                    progress: state.scanProgress,
                    currentFile: state.currentFile,
                  ),
                if (state.isScanning && state.duplicateGroups.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    'Found ${state.duplicateGroups.length} duplicate groups so far...',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
                if (state.isScanning) const SizedBox(height: 10),
                const Expanded(child: _DuplicatesContent()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DuplicatesContent extends StatelessWidget {
  const _DuplicatesContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DuplicatesBloc, DuplicatesState>(
      builder: (context, state) {
        if (state.isDeleting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Deleting selected images...'),
              ],
            ),
          );
        }

        if (state.scanMode == ScanMode.duplicates) {
          if (state.duplicateGroups.isEmpty && !state.isScanning) {
            return const _EmptyStateMessage();
          }
          return ListView.builder(
            itemCount: state.duplicateGroups.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DuplicateGroupCard(
                    group: state.duplicateGroups[index],
                  ),
                ),
          );
        } else {
          // Classification mode
          return ClassificationResults(result: state.classificationResult);
        }
      },
    );
  }
}

class _EmptyStateMessage extends StatelessWidget {
  const _EmptyStateMessage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'No duplicates found',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Select a folder and scan to find duplicate images',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
