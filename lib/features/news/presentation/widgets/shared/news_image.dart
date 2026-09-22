import 'package:flutter/material.dart';

import '../../../../../core/services/media_picker.dart';
import '../../../domain/entities/news_ratio.dart';

/// Obrazek aktualności w wymiarach zależnych od proporcji: 304×171 (poziomy),
/// 171×304 (pionowy) albo 304×304 (kwadrat).
class NewsImage extends StatelessWidget {
  const NewsImage.network(
    String this.url, {
    super.key,
    required this.ratio,
    this.borderRadius = 8,
  }) : file = null;

  const NewsImage.memory(
    PickedFile this.file, {
    super.key,
    required this.ratio,
    this.borderRadius = 8,
  }) : url = null;

  final String? url;
  final PickedFile? file;
  final NewsRatio ratio;
  final double borderRadius;

  static Size sizeOf(NewsRatio ratio) => switch (ratio) {
        NewsRatio.horizontal => const Size(304, 171),
        NewsRatio.vertical => const Size(171, 304),
        NewsRatio.square => const Size(304, 304),
      };

  @override
  Widget build(BuildContext context) {
    final size = sizeOf(ratio);
    final file = this.file;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: file != null
          ? Image.memory(
              file.bytes,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            )
          : Image.network(
              url!,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
    );
  }
}
