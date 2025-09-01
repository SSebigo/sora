import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/classified_image.dart';
import 'package:sora/domain/duplicates/image_type.dart';
import 'package:sora/utils/palette.dart';

class ClassificationResults extends StatelessWidget {
  const ClassificationResults({required this.result, super.key});

  final ClassificationResult result;

  @override
  Widget build(BuildContext context) {
    if (result.totalImages == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 100, color: Colors.grey.shade400),
            const SizedBox(height: 20),
            Text(
              'Scan a folder to classify images as photos or drawings',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Palette.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: Palette.black,
                borderRadius: BorderRadius.circular(5),
              ),
              labelColor: Palette.white,
              unselectedLabelColor: Palette.black,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt, size: 16),
                      const SizedBox(width: 4),
                      Text('Photos (${result.photos.length})'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.brush, size: 16),
                      const SizedBox(width: 4),
                      Text('Drawings (${result.drawings.length})'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.help_outline, size: 16),
                      const SizedBox(width: 4),
                      Text('Unknown (${result.unknown.length})'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              children: [
                _buildImageGrid(context, result.photos, ImageType.photo),
                _buildImageGrid(context, result.drawings, ImageType.drawing),
                _buildImageGrid(context, result.unknown, ImageType.unknown),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid(
    BuildContext context,
    List<ClassifiedImage> images,
    ImageType type,
  ) {
    if (images.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(type.icon, size: 60, color: Colors.grey.shade400),
            const SizedBox(height: 10),
            Text(
              'No ${type.label.toLowerCase()}s found',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return _buildImageCard(context, image);
      },
    );
  }

  Widget _buildImageCard(BuildContext context, ClassifiedImage image) {
    return GestureDetector(
      onTap:
          () => context.read<DuplicatesBloc>().add(
            DuplicatesEvent.classifiedImageToggled(image.path),
          ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: image.isSelected ? Colors.red : Palette.grey,
            width: image.isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                    child: Image.file(
                      File(image.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return ColoredBox(
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  if (image.isSelected)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'Confidence: ${(image.typeConfidence * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.basename(image.path),
                    style: const TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '${(image.size / 1024).toStringAsFixed(0)} KB',
                    style: TextStyle(fontSize: 9, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
