import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/date_formatters.dart';
import '../../../../../core/widgets/dialogs/dialog_close_button.dart';
import '../../../../../core/widgets/gold_divider.dart';
import '../../../domain/entities/news.dart';
import '../shared/news_image.dart';

/// Podgląd aktualności: obrazek, tytuł, data, autor, kategorie i treść.
class NewsPreviewDialog extends StatelessWidget {
  const NewsPreviewDialog({
    super.key,
    required this.news,
    required this.categoryNames,
  });

  final News news;
  final List<String> categoryNames;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  );
  static final _authorStyle = AppTextStyles.caption.copyWith(
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 320,
          minHeight: 320,
          maxWidth: 600,
          maxHeight: 700,
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColors.secondaryBackground,
          elevation: 4,
          shape: _shape,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    spacing: 20,
                    children: [
                      const GoldDivider(),
                      NewsImage.network(news.imageUrl, ratio: news.ratio),
                      Column(
                        spacing: 5,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  news.title,
                                  style: AppTextStyles.bodyLargeSemiBold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormatters.fromApiDate(news.date),
                                style: AppTextStyles.caption,
                              ),
                            ],
                          ),
                          Row(children: [
                            Text(news.author, style: _authorStyle)
                          ]),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  context.l10n
                                      .newsCategories(categoryNames.join(', ')),
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const GoldDivider(),
                      Text(news.content, style: AppTextStyles.input),
                      const GoldDivider(),
                    ],
                  ),
                ),
              ),
              DialogCloseButton(onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
