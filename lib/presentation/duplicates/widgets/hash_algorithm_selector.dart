import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/hash_algorithm.dart';
import 'package:sora/utils/palette.dart';

class HashAlgorithmSelector extends StatelessWidget {
  const HashAlgorithmSelector({
    required this.selectedAlgorithm,
    required this.isDisabled,
    super.key,
  });

  final HashAlgorithm selectedAlgorithm;
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
          DropdownButton<HashAlgorithm>(
            value: selectedAlgorithm,
            underline: const SizedBox(),
            onChanged:
                isDisabled
                    ? null
                    : (algorithm) {
                      if (algorithm != null) {
                        context.read<DuplicatesBloc>().add(
                          DuplicatesEvent.algorithmChanged(algorithm),
                        );
                      }
                    },
            items:
                HashAlgorithm.values.map((algorithm) {
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

  final HashAlgorithm algorithm;

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
          '• aHash: Fastest, basic duplicates\n'
          '• dHash: Balanced speed & accuracy\n'
          '• pHash: Most accurate, slower',
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
