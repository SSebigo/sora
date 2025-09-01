enum ClassificationAlgorithm {
  basic(
    'Basic Statistical',
    'Fast analysis using edge density and color variance. '
        'Good for quick scans but may have lower accuracy.',
  ),

  advanced(
    'Advanced Statistical',
    'Comprehensive analysis including texture, patterns, and gradients. '
        'Better accuracy with moderate speed.',
  ),

  hybrid(
    'Hybrid Analysis',
    'Combines statistical features with pattern recognition. '
        'Best balance of speed and accuracy.',
  );

  const ClassificationAlgorithm(this.displayName, this.description);

  final String displayName;
  final String description;
}
