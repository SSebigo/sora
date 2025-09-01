import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/presentation/core/default_button.dart';
import 'package:sora/utils/palette.dart';

class ScanProgressIndicator extends StatelessWidget {
  const ScanProgressIndicator({
    required this.progress,
    required this.currentFile,
    super.key,
  });

  final double progress;
  final String currentFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Scanning for duplicates...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              DefaultButton(
                title: 'Stop',
                isLoading: false,
                color: Colors.red,
                onPressed:
                    () => context.read<DuplicatesBloc>().add(
                      const DuplicatesEvent.stopScanPressed(),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _ProgressBar(progress: progress),
          const SizedBox(height: 10),
          _ProgressPercentage(progress: progress),
          const SizedBox(height: 5),
          _CurrentFileLabel(currentFile: currentFile),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Palette.grey,
      valueColor: const AlwaysStoppedAnimation<Color>(Palette.black),
    );
  }
}

class _ProgressPercentage extends StatelessWidget {
  const _ProgressPercentage({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(progress * 100).toStringAsFixed(0)}%',
      style: const TextStyle(fontSize: 16),
    );
  }
}

class _CurrentFileLabel extends StatelessWidget {
  const _CurrentFileLabel({required this.currentFile});

  final String currentFile;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentFile.isNotEmpty ? 'Processing: ${p.basename(currentFile)}' : '',
      style: const TextStyle(fontSize: 12, color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );
  }
}
