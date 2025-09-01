import 'package:flutter/material.dart';

enum ImageType {
  photo('Photo', Icons.camera_alt),
  drawing('Drawing', Icons.brush),
  unknown('Unknown', Icons.image);

  const ImageType(this.label, this.icon);

  final String label;
  final IconData icon;
}

class ImageClassification {
  const ImageClassification({required this.type, required this.confidence});

  final ImageType type;
  final double confidence;

  String get confidenceLabel {
    if (confidence > 0.8) return 'High';
    if (confidence > 0.6) return 'Medium';
    return 'Low';
  }
}
