import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'dialogs/dialog_close_button.dart';
import 'dialogs/show_app_dialog.dart';
import 'tap_area.dart';

/// Miniatury obrazków; kliknięcie otwiera obrazek w dużym podglądzie.
class ImageGallery extends StatelessWidget {
  const ImageGallery({
    super.key,
    required this.urls,
    this.thumbnailSize = const Size(160, 120),
    this.emptyLabel,
  });

  final List<String> urls;
  final Size thumbnailSize;

  /// Tekst pokazywany, gdy nie ma czego pokazać.
  final String? emptyLabel;

  @override
  Widget build(BuildContext context) {
    final emptyLabel = this.emptyLabel;
    if (urls.isEmpty) {
      return emptyLabel == null
          ? const SizedBox.shrink()
          : Text(
              emptyLabel,
              style: AppTextStyles.bodySemiBold.copyWith(
                color: AppColors.secondaryText,
              ),
            );
    }
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final url in urls)
          TapArea(
            key: ValueKey(url),
            onTap: () => showAppDialog<void>(
              context,
              builder: (_) => ImagePreviewDialog(url: url),
            ),
            child: _Thumbnail(url: url, size: thumbnailSize),
          ),
      ],
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.url, required this.size});

  final String url;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: size.width,
        height: size.height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _Placeholder(size: size),
      ),
    );
  }
}

/// Obrazek, którego nie udało się wczytać.
class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: AppColors.primaryBackground,
      child: const Icon(
        Icons.broken_image_outlined,
        color: AppColors.secondaryText,
        size: 32,
      ),
    );
  }
}

/// Obrazek w pełnym rozmiarze, na tyle duży, na ile pozwala okno.
class ImagePreviewDialog extends StatelessWidget {
  const ImagePreviewDialog({super.key, required this.url});

  final String url;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  @override
  Widget build(BuildContext context) {
    final window = MediaQuery.sizeOf(context);
    return Container(
      constraints: BoxConstraints(
        maxWidth: window.width * 0.8,
        maxHeight: window.height * 0.8,
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppColors.secondaryBackground,
        elevation: 4,
        shape: _shape,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                url,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const _Placeholder(size: Size(320, 240)),
              ),
            ),
            DialogCloseButton(onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
