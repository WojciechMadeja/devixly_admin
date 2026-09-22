import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'skeleton.dart';

/// Karta wiersza listy (kategorie, firmy): wysokość 60, szerokość 320–600,
/// zaokrąglenie 8, szare tło po zaznaczeniu.
class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.child,
    this.selected = false,
    this.color,
  });

  final Widget child;
  final bool selected;

  /// Własny kolor tła; domyślnie biały (szary, gdy [selected]).
  final Color? color;

  static const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 600),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color:
            color ??
            (selected ? AppColors.selectedCard : AppColors.secondaryBackground),
        elevation: 4,
        shape: _shape,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: child,
        ),
      ),
    );
  }
}

/// Szkielet karty listy wyświetlany podczas ładowania.
class ListCardSkeleton extends StatelessWidget {
  const ListCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SkeletonBox(width: 150, height: 16),
          SkeletonBox(
            width: 90,
            height: 16,
            delay: Duration(milliseconds: 50),
            duration: Duration(milliseconds: 400),
          ),
        ],
      ),
    );
  }
}

/// Trzy szkielety kart o malejącej widoczności (1, 0,5, 0,1).
class ListCardSkeletonGroup extends StatelessWidget {
  const ListCardSkeletonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 5,
      children: [
        ListCardSkeleton(),
        Opacity(opacity: 0.5, child: ListCardSkeleton()),
        Opacity(opacity: 0.1, child: ListCardSkeleton()),
      ],
    );
  }
}
