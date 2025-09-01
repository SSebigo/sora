import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/scan_mode.dart';
import 'package:sora/utils/palette.dart';

class ScanModeSelector extends StatelessWidget {
  const ScanModeSelector({
    required this.scanMode,
    required this.isDisabled,
    super.key,
  });

  final ScanMode scanMode;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Text(
            'Mode:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children:
                  ScanMode.values.map((mode) {
                    final isSelected = scanMode == mode;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: mode == ScanMode.values.first ? 0 : 5,
                        ),
                        child: _ScanModeButton(
                          mode: mode,
                          isSelected: isSelected,
                          isDisabled: isDisabled,
                          onPressed:
                              () => context.read<DuplicatesBloc>().add(
                                DuplicatesEvent.scanModeChanged(mode),
                              ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanModeButton extends StatelessWidget {
  const _ScanModeButton({
    required this.mode,
    required this.isSelected,
    required this.isDisabled,
    required this.onPressed,
  });

  final ScanMode mode;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: mode.description,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Palette.black : Colors.transparent,
            border: Border.all(
              color: isSelected ? Palette.black : Palette.grey,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                mode.icon,
                size: 16,
                color: isSelected ? Palette.white : Palette.black,
              ),
              const SizedBox(width: 6),
              Text(
                mode.label,
                style: TextStyle(
                  fontSize: 13,
                  color: isSelected ? Palette.white : Palette.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
