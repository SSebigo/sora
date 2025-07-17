import 'package:flutter/material.dart';
import 'package:sora/utils/palette.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.disabled = false,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;

  final VoidCallback? onPressed;

  final bool disabled;

  final Color? backgroundColor;

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      icon: Icon(
        icon,
        color: disabled ? Palette.grey : iconColor ?? Palette.black,
      ),
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Palette.grey),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? Palette.white,
        ),
      ),
    );
  }
}
