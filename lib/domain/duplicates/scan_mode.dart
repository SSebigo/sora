import 'package:flutter/material.dart';

enum ScanMode {
  duplicates(
    'Find Duplicates',
    'Search for duplicate images using hash algorithms',
    Icons.content_copy,
  ),
  classification(
    'Classify Images',
    'Identify photos vs drawings/artwork',
    Icons.category,
  );

  const ScanMode(this.label, this.description, this.icon);

  final String label;
  final String description;
  final IconData icon;
}
