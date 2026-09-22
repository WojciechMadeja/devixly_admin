import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/services/media_picker.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/news_ratio.dart';
import 'news_image.dart';

/// Pole obrazka w formularzu: „Dodaj zdjęcie” albo podgląd obrazka
/// w wybranych proporcjach. Kliknięcie otwiera galerię.
class NewsImageArea extends StatelessWidget {
  const NewsImageArea({
    super.key,
    required this.ratio,
    required this.onTap,
    required this.emptyBackground,
    this.pickedImage,
    this.currentImageUrl = '',
  });

  final NewsRatio ratio;
  final VoidCallback onTap;

  /// Tło pola, gdy nie ma obrazka.
  final Color emptyBackground;

  /// Nowo wybrany obrazek (ma pierwszeństwo przed [currentImageUrl]).
  final PickedFile? pickedImage;

  /// Obrazek edytowanej aktualności.
  final String currentImageUrl;

  static final _hintStyle = AppTextStyles.bodySmall.copyWith(
    color: AppColors.secondaryText,
  );

  @override
  Widget build(BuildContext context) {
    final picked = pickedImage;
    final image = picked != null
        ? NewsImage.memory(picked, ratio: ratio, borderRadius: 16)
        : currentImageUrl.isNotEmpty
        ? NewsImage.network(currentImageUrl, ratio: ratio, borderRadius: 16)
        : null;
    return TapArea(
      onTap: onTap,
      child: Container(
        width: 304,
        constraints: const BoxConstraints(minHeight: 171),
        decoration: BoxDecoration(
          color: image == null ? emptyBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  const Icon(
                    Icons.camera_alt,
                    color: AppColors.tertiary,
                    size: 55,
                  ),
                  Text(context.l10n.newsAddPhoto, style: _hintStyle),
                ],
              ),
            ),
            if (image != null) Align(child: image),
          ],
        ),
      ),
    );
  }
}
