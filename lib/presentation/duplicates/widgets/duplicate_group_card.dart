import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/domain/duplicates/duplicate_image.dart';
import 'package:sora/domain/duplicates/image_type.dart';
import 'package:sora/utils/palette.dart';

class DuplicateGroupCard extends StatelessWidget {
  const DuplicateGroupCard({required this.group, super.key});

  final DuplicateGroup group;

  @override
  Widget build(BuildContext context) {
    final selectedCount = group.images.where((img) => img.isSelected).length;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${group.images.length} duplicates',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              if (selectedCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    '$selectedCount selected',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              const Spacer(),
              _buildQuickActionButton(
                context,
                'Select All',
                Icons.select_all,
                () => context.read<DuplicatesBloc>().add(
                  DuplicatesEvent.selectAllInGroupPressed(group.hash),
                ),
              ),
              const SizedBox(width: 5),
              _buildQuickActionButton(
                context,
                'Keep Oldest',
                Icons.history,
                () => context.read<DuplicatesBloc>().add(
                  DuplicatesEvent.keepOldestInGroupPressed(group.hash),
                ),
              ),
              const SizedBox(width: 5),
              _buildQuickActionButton(
                context,
                'Keep Newest',
                Icons.update,
                () => context.read<DuplicatesBloc>().add(
                  DuplicatesEvent.keepNewestInGroupPressed(group.hash),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: group.images.length,
              itemBuilder: (context, index) {
                final image = group.images[index];
                return _buildImageCard(context, image);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context,
    String tooltip,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(3),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.grey),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Icon(icon, size: 16),
        ),
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, DuplicateImage image) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                GestureDetector(
                  onTap:
                      () => context.read<DuplicatesBloc>().add(
                        DuplicatesEvent.imageToggled(group.hash, image.path),
                      ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: image.isSelected ? Colors.red : Palette.grey,
                        width: image.isSelected ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.file(
                        File(image.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return ColoredBox(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                        size: 16,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(
                        image.imageType,
                      ).withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          image.imageType.icon,
                          size: 12,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          image.imageType.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (image.typeConfidence < 0.7)
                          const Text(
                            ' ?',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            p.basename(image.path),
            style: const TextStyle(fontSize: 11),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            '${(image.size / 1024).toStringAsFixed(0)} KB',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
          ),
          Text(
            _formatDate(image.lastModified),
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }

  Color _getTypeColor(ImageType type) {
    return switch (type) {
      ImageType.photo => Colors.blue,
      ImageType.drawing => Colors.purple,
      ImageType.unknown => Colors.grey,
    };
  }
}
