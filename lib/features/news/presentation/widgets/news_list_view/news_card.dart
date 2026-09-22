import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/date_formatters.dart';
import '../../../../../core/utils/text_utils.dart';
import '../../../../../core/widgets/font_awesome_icon.dart';
import '../../../../../core/widgets/tap_area.dart';
import '../../../domain/entities/news.dart';
import '../shared/news_card_frame.dart';

/// Karta aktualności na liście: miniatura, data, tytuł, autor oraz ikony
/// edycji i usunięcia.
class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    required this.onEdit,
    required this.onDelete,
  });

  final News news;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  static const _dateStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryText,
    letterSpacing: 0,
  );
  static final _titleStyle = AppTextStyles.bodySemiBold.copyWith(
    fontWeight: FontWeight.bold,
  );
  static final _authorStyle = AppTextStyles.caption.copyWith(
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return NewsCardFrame(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          SizedBox(
            width: 107,
            height: 60,
            child: news.imageUrl.isEmpty
                ? null
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      news.imageUrl,
                      width: 107,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(DateFormatters.fromApiDate(news.date), style: _dateStyle),
                Text(
                  truncateWithEllipsis(news.title, 75),
                  maxLines: 3,
                  style: _titleStyle,
                ),
                Text(news.author, style: _authorStyle),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TapArea(
          onTap: onEdit,
          child: const FontAwesomeIcon(
            AppIcons.edit,
            color: AppColors.accent1,
            size: 28,
          ),
        ),
        TapArea(
          onTap: onDelete,
          child: const Icon(Icons.delete, color: AppColors.accent3, size: 30),
        ),
      ],
    );
  }
}
