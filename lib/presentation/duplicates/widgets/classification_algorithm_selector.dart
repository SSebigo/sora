import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/classification_algorithm.dart';
import 'package:sora/utils/palette.dart';

class ClassificationAlgorithmSelector extends StatelessWidget {
  const ClassificationAlgorithmSelector({
    required this.selectedAlgorithm,
    required this.isDisabled,
    super.key,
  });

  final ClassificationAlgorithm selectedAlgorithm;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Text('Algorithm: ', style: TextStyle(fontSize: 14)),
          DropdownButton<ClassificationAlgorithm>(
            value: selectedAlgorithm,
            underline: const SizedBox(),
            onChanged:
                isDisabled
                    ? null
                    : (algorithm) {
                      if (algorithm != null) {
                        context.read<DuplicatesBloc>().add(
                          DuplicatesEvent.classificationAlgorithmChanged(
                            algorithm,
                          ),
                        );
                      }
                    },
            items:
                ClassificationAlgorithm.values.map((algorithm) {
                  return DropdownMenuItem(
                    value: algorithm,
                    child: _AlgorithmMenuItem(algorithm: algorithm),
                  );
                }).toList(),
          ),
          const SizedBox(width: 4),
          const _AlgorithmInfoTooltip(),
        ],
      ),
    );
  }
}

class _AlgorithmMenuItem extends StatelessWidget {
  const _AlgorithmMenuItem({required this.algorithm});

  final ClassificationAlgorithm algorithm;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: algorithm.description,
      preferBelow: false,
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(8),
      waitDuration: const Duration(milliseconds: 500),
      child: Text(algorithm.displayName, style: const TextStyle(fontSize: 14)),
    );
  }
}

class _AlgorithmInfoTooltip extends StatelessWidget {
  const _AlgorithmInfoTooltip();

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message:
          'Algorithm comparison:\n'
          '• Basic: Fast, edge & color based\n'
          '• Advanced: Multiple statistical features\n'
          '• Hybrid: Statistical + pattern recognition',
      preferBelow: false,
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(Icons.info_outline, size: 16, color: Colors.grey.shade600),
    );
  }
}
