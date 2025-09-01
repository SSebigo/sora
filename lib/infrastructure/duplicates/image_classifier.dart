import 'dart:math' as math;

import 'package:image/image.dart' as img;
import 'package:sora/domain/duplicates/classification_algorithm.dart';
import 'package:sora/domain/duplicates/image_type.dart';

class ImageClassifier {
  static ImageClassification classify(
    img.Image image, {
    ClassificationAlgorithm algorithm = ClassificationAlgorithm.basic,
  }) {
    return switch (algorithm) {
      ClassificationAlgorithm.basic => _classifyBasic(image),
      ClassificationAlgorithm.advanced => _classifyAdvanced(image),
      ClassificationAlgorithm.hybrid => _classifyHybrid(image),
    };
  }

  static ImageClassification _classifyBasic(img.Image image) {
    final features = _extractFeatures(image);

    // Simple thresholding approach using edge density and color variance
    var photoScore = 0.0;
    var drawingScore = 0.0;

    // Edge density analysis
    if (features.edgeDensity < 0.15) {
      photoScore += 0.5;
    } else if (features.edgeDensity > 0.25) {
      drawingScore += 0.5;
    }

    // Color variance analysis
    if (features.colorVariance > 50) {
      photoScore += 0.5;
    } else if (features.colorVariance < 30) {
      drawingScore += 0.5;
    }

    final totalScore = photoScore + drawingScore;
    if (totalScore == 0) {
      return const ImageClassification(type: ImageType.unknown, confidence: 0);
    }

    final photoConfidence = photoScore / totalScore;

    if (photoConfidence > 0.6) {
      return ImageClassification(
        type: ImageType.photo,
        confidence: photoConfidence,
      );
    } else if (photoConfidence < 0.4) {
      return ImageClassification(
        type: ImageType.drawing,
        confidence: 1.0 - photoConfidence,
      );
    } else {
      return const ImageClassification(
        type: ImageType.unknown,
        confidence: 0.5,
      );
    }
  }

  static ImageClassification _classifyAdvanced(img.Image image) {
    final features = _extractFeatures(image);

    // Weighted scoring based on multiple features
    var photoScore = 0.0;
    var drawingScore = 0.0;

    // Edge density analysis
    if (features.edgeDensity < 0.15) {
      photoScore += 0.3;
    } else if (features.edgeDensity > 0.25) {
      drawingScore += 0.3;
    }

    // Color variance analysis
    if (features.colorVariance > 50) {
      photoScore += 0.25;
    } else if (features.colorVariance < 30) {
      drawingScore += 0.25;
    }

    // Saturation uniformity
    if (features.saturationUniformity < 0.3) {
      photoScore += 0.2;
    } else if (features.saturationUniformity > 0.5) {
      drawingScore += 0.2;
    }

    // Gradient smoothness
    if (features.gradientSmoothness > 0.7) {
      photoScore += 0.15;
    } else if (features.gradientSmoothness < 0.4) {
      drawingScore += 0.15;
    }

    // High frequency content
    if (features.highFrequencyContent > 0.4) {
      photoScore += 0.1;
    } else {
      drawingScore += 0.1;
    }

    final totalScore = photoScore + drawingScore;
    if (totalScore == 0) {
      return const ImageClassification(type: ImageType.unknown, confidence: 0);
    }

    final photoConfidence = photoScore / totalScore;

    if (photoConfidence > 0.6) {
      return ImageClassification(
        type: ImageType.photo,
        confidence: photoConfidence,
      );
    } else if (photoConfidence < 0.4) {
      return ImageClassification(
        type: ImageType.drawing,
        confidence: 1.0 - photoConfidence,
      );
    } else {
      return const ImageClassification(
        type: ImageType.unknown,
        confidence: 0.5,
      );
    }
  }

  static ImageClassification _classifyHybrid(img.Image image) {
    final features = _extractFeatures(image);
    final extendedFeatures = _extractExtendedFeatures(image);

    // Combine statistical features with pattern recognition
    var photoScore = 0.0;
    var drawingScore = 0.0;

    // Basic features
    if (features.edgeDensity < 0.15) {
      photoScore += 0.2;
    } else if (features.edgeDensity > 0.25) {
      drawingScore += 0.2;
    }

    if (features.colorVariance > 50) {
      photoScore += 0.15;
    } else if (features.colorVariance < 30) {
      drawingScore += 0.15;
    }

    if (features.saturationUniformity < 0.3) {
      photoScore += 0.15;
    } else if (features.saturationUniformity > 0.5) {
      drawingScore += 0.15;
    }

    if (features.gradientSmoothness > 0.7) {
      photoScore += 0.1;
    } else if (features.gradientSmoothness < 0.4) {
      drawingScore += 0.1;
    }

    // Extended features
    if (extendedFeatures.textureComplexity > 0.6) {
      photoScore += 0.15;
    } else if (extendedFeatures.textureComplexity < 0.3) {
      drawingScore += 0.15;
    }

    if (extendedFeatures.lineCoherence > 0.7) {
      drawingScore += 0.15;
    } else if (extendedFeatures.lineCoherence < 0.3) {
      photoScore += 0.15;
    }

    if (extendedFeatures.colorPaletteDiversity > 100) {
      photoScore += 0.1;
    } else if (extendedFeatures.colorPaletteDiversity < 50) {
      drawingScore += 0.1;
    }

    final totalScore = photoScore + drawingScore;
    if (totalScore == 0) {
      return const ImageClassification(type: ImageType.unknown, confidence: 0);
    }

    final photoConfidence = photoScore / totalScore;

    if (photoConfidence > 0.55) {
      return ImageClassification(
        type: ImageType.photo,
        confidence: photoConfidence,
      );
    } else if (photoConfidence < 0.45) {
      return ImageClassification(
        type: ImageType.drawing,
        confidence: 1.0 - photoConfidence,
      );
    } else {
      return const ImageClassification(
        type: ImageType.unknown,
        confidence: 0.5,
      );
    }
  }

  static _ImageFeatures _extractFeatures(img.Image image) {
    final resized = img.copyResize(image, width: 256, height: 256);

    // Edge detection using Sobel operator
    final edges = _detectEdges(resized);
    final edgeDensity = _calculateEdgeDensity(edges.cast<List<double>>());

    // Color analysis
    final colorVariance = _calculateColorVariance(resized);
    final saturationUniformity = _calculateSaturationUniformity(resized);

    // Gradient analysis
    final gradientSmoothness = _calculateGradientSmoothness(resized);

    // Frequency analysis
    final highFrequencyContent = _calculateHighFrequencyContent(resized);

    return _ImageFeatures(
      edgeDensity: edgeDensity,
      colorVariance: colorVariance,
      saturationUniformity: saturationUniformity,
      gradientSmoothness: gradientSmoothness,
      highFrequencyContent: highFrequencyContent,
    );
  }

  static List<List<int>> _detectEdges(img.Image image) {
    final width = image.width;
    final height = image.height;
    final edges = List.generate(height, (_) => List.filled(width, 0));

    // Sobel operators
    const sobelX = [
      [-1, 0, 1],
      [-2, 0, 2],
      [-1, 0, 1],
    ];

    const sobelY = [
      [-1, -2, -1],
      [0, 0, 0],
      [1, 2, 1],
    ];

    for (var y = 1; y < height - 1; y++) {
      for (var x = 1; x < width - 1; x++) {
        double gx = 0;
        double gy = 0;

        for (var ky = -1; ky <= 1; ky++) {
          for (var kx = -1; kx <= 1; kx++) {
            final pixel = image.getPixel(x + kx, y + ky);
            final gray = (pixel.r + pixel.g + pixel.b) / 3;

            gx += gray * sobelX[ky + 1][kx + 1];
            gy += gray * sobelY[ky + 1][kx + 1];
          }
        }

        edges[y][x] = math.sqrt(gx * gx + gy * gy) as int;
      }
    }

    return edges;
  }

  static double _calculateEdgeDensity(List<List<double>> edges) {
    var edgePixels = 0;
    var totalPixels = 0;
    const threshold = 50.0;

    for (final row in edges) {
      for (final value in row) {
        if (value > threshold) {
          edgePixels++;
        }
        totalPixels++;
      }
    }

    return edgePixels / totalPixels;
  }

  static double _calculateColorVariance(img.Image image) {
    final colors = <int>[];

    for (var y = 0; y < image.height; y += 4) {
      for (var x = 0; x < image.width; x += 4) {
        final pixel = image.getPixel(x, y);
        colors
          ..add(pixel.r.toInt())
          ..add(pixel.g.toInt())
          ..add(pixel.b.toInt());
      }
    }

    if (colors.isEmpty) return 0;

    final mean = colors.reduce((a, b) => a + b) / colors.length;
    final variance =
        colors.map((c) => math.pow(c - mean, 2)).reduce((a, b) => a + b) /
        colors.length;

    return math.sqrt(variance);
  }

  static double _calculateSaturationUniformity(img.Image image) {
    final saturations = <double>[];

    for (var y = 0; y < image.height; y += 4) {
      for (var x = 0; x < image.width; x += 4) {
        final pixel = image.getPixel(x, y);
        final r = pixel.r / 255;
        final g = pixel.g / 255;
        final b = pixel.b / 255;

        final max = [r, g, b].reduce(math.max);
        final min = [r, g, b].reduce(math.min);

        final saturation = max == 0 ? 0.0 : (max - min) / max;
        saturations.add(saturation);
      }
    }

    if (saturations.isEmpty) return 0;

    final mean = saturations.reduce((a, b) => a + b) / saturations.length;
    final variance =
        saturations.map((s) => math.pow(s - mean, 2)).reduce((a, b) => a + b) /
        saturations.length;

    return 1.0 - math.sqrt(variance); // Return uniformity (inverse of variance)
  }

  static double _calculateGradientSmoothness(img.Image image) {
    double smoothPixels = 0;
    var totalComparisons = 0;
    const threshold = 30.0;

    for (var y = 0; y < image.height - 1; y += 2) {
      for (var x = 0; x < image.width - 1; x += 2) {
        final current = image.getPixel(x, y);
        final right = image.getPixel(x + 1, y);
        final bottom = image.getPixel(x, y + 1);

        final diffRight = math.sqrt(
          math.pow(current.r - right.r, 2) +
              math.pow(current.g - right.g, 2) +
              math.pow(current.b - right.b, 2),
        );

        final diffBottom = math.sqrt(
          math.pow(current.r - bottom.r, 2) +
              math.pow(current.g - bottom.g, 2) +
              math.pow(current.b - bottom.b, 2),
        );

        if (diffRight < threshold) smoothPixels++;
        if (diffBottom < threshold) smoothPixels++;
        totalComparisons += 2;
      }
    }

    return smoothPixels / totalComparisons;
  }

  static double _calculateHighFrequencyContent(img.Image image) {
    // Simplified frequency analysis using local variance
    double totalVariance = 0;
    var blockCount = 0;
    const blockSize = 8;

    for (var y = 0; y < image.height - blockSize; y += blockSize) {
      for (var x = 0; x < image.width - blockSize; x += blockSize) {
        final values = <double>[];

        for (var by = 0; by < blockSize; by++) {
          for (var bx = 0; bx < blockSize; bx++) {
            final pixel = image.getPixel(x + bx, y + by);
            values.add((pixel.r + pixel.g + pixel.b) / 3);
          }
        }

        if (values.isNotEmpty) {
          final mean = values.reduce((a, b) => a + b) / values.length;
          final variance =
              values.map((v) => math.pow(v - mean, 2)).reduce((a, b) => a + b) /
              values.length;
          totalVariance += variance;
          blockCount++;
        }
      }
    }

    return blockCount > 0 ? totalVariance / (blockCount * 255 * 255) : 0;
  }

  static _ExtendedImageFeatures _extractExtendedFeatures(img.Image image) {
    final resized = img.copyResize(image, width: 256, height: 256);

    // Texture complexity using co-occurrence matrix
    final textureComplexity = _calculateTextureComplexity(resized);

    // Line coherence detection
    final lineCoherence = _calculateLineCoherence(resized);

    // Color palette diversity
    final colorPaletteDiversity = _calculateColorPaletteDiversity(resized);

    return _ExtendedImageFeatures(
      textureComplexity: textureComplexity,
      lineCoherence: lineCoherence,
      colorPaletteDiversity: colorPaletteDiversity,
    );
  }

  static double _calculateTextureComplexity(img.Image image) {
    // Simplified texture analysis using local binary patterns
    var complexity = 0.0;
    var sampleCount = 0;

    for (var y = 1; y < image.height - 1; y += 4) {
      for (var x = 1; x < image.width - 1; x += 4) {
        final center = image.getPixel(x, y);
        final centerGray = (center.r + center.g + center.b) / 3;

        var pattern = 0;
        final neighbors = [
          image.getPixel(x - 1, y - 1),
          image.getPixel(x, y - 1),
          image.getPixel(x + 1, y - 1),
          image.getPixel(x + 1, y),
          image.getPixel(x + 1, y + 1),
          image.getPixel(x, y + 1),
          image.getPixel(x - 1, y + 1),
          image.getPixel(x - 1, y),
        ];

        for (var i = 0; i < neighbors.length; i++) {
          final neighborGray =
              (neighbors[i].r + neighbors[i].g + neighbors[i].b) / 3;
          if (neighborGray > centerGray) {
            pattern |= 1 << i;
          }
        }

        // Count transitions in pattern (measure of texture complexity)
        var transitions = 0;
        for (var i = 0; i < 8; i++) {
          final bit1 = (pattern >> i) & 1;
          final bit2 = (pattern >> ((i + 1) % 8)) & 1;
          if (bit1 != bit2) transitions++;
        }

        complexity += transitions / 8.0;
        sampleCount++;
      }
    }

    return sampleCount > 0 ? complexity / sampleCount : 0;
  }

  static double _calculateLineCoherence(img.Image image) {
    // Detect coherent lines using Hough transform approximation
    final edges = _detectEdges(image);
    var lineCount = 0;

    // Simplified line detection - check for continuous edges
    for (var y = 0; y < edges.length; y++) {
      var consecutiveEdges = 0;
      for (var x = 0; x < edges[y].length; x++) {
        if (edges[y][x] > 50) {
          consecutiveEdges++;
          if (consecutiveEdges > 10) {
            lineCount++;
            break;
          }
        } else {
          consecutiveEdges = 0;
        }
      }
    }

    // Check vertical lines
    for (var x = 0; x < (edges.isNotEmpty ? edges[0].length : 0); x++) {
      var consecutiveEdges = 0;
      for (var y = 0; y < edges.length; y++) {
        if (edges[y][x] > 50) {
          consecutiveEdges++;
          if (consecutiveEdges > 10) {
            lineCount++;
            break;
          }
        } else {
          consecutiveEdges = 0;
        }
      }
    }

    final maxPossibleLines = image.width / 10 + image.height / 10;
    return lineCount / maxPossibleLines;
  }

  static double _calculateColorPaletteDiversity(img.Image image) {
    // Quantize colors and count unique colors
    final colors = <int>{};

    for (var y = 0; y < image.height; y += 2) {
      for (var x = 0; x < image.width; x += 2) {
        final pixel = image.getPixel(x, y);
        // Quantize to reduce color space
        final r = (pixel.r ~/ 16) * 16;
        final g = (pixel.g ~/ 16) * 16;
        final b = (pixel.b ~/ 16) * 16;
        colors.add((r << 16) | (g << 8) | b);
      }
    }

    return colors.length.toDouble();
  }
}

class _ImageFeatures {
  const _ImageFeatures({
    required this.edgeDensity,
    required this.colorVariance,
    required this.saturationUniformity,
    required this.gradientSmoothness,
    required this.highFrequencyContent,
  });

  final double edgeDensity;
  final double colorVariance;
  final double saturationUniformity;
  final double gradientSmoothness;
  final double highFrequencyContent;
}

class _ExtendedImageFeatures {
  const _ExtendedImageFeatures({
    required this.textureComplexity,
    required this.lineCoherence,
    required this.colorPaletteDiversity,
  });

  final double textureComplexity;
  final double lineCoherence;
  final double colorPaletteDiversity;
}
