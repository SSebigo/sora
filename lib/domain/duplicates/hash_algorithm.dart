enum HashAlgorithm {
  average(
    'Average Hash (aHash)',
    'Fast and simple. Resizes to 8x8, compares brightness. '
        'Good for exact and near-exact duplicates. May miss rotated or heavily edited images.',
  ),

  difference(
    'Difference Hash (dHash)',
    'Tracks gradient changes between pixels. More robust than aHash. '
        'Better at finding duplicates with slight color/brightness changes. Moderate speed.',
  ),

  perceptual(
    'Perceptual Hash (pHash)',
    'Uses frequency domain analysis (DCT). Most accurate for finding similar images. '
        'Handles scaling, compression, and minor edits well. Slower but more thorough.',
  );

  const HashAlgorithm(this.displayName, this.description);

  final String displayName;
  final String description;
}
