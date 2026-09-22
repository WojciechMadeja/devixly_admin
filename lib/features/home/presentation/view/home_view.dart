import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/admin_page_scaffold.dart';
import '../widgets/home_view/home_tile_grid.dart';

/// Ekran główny: kafelki prowadzące do funkcji panelu.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const pageTitle = 'HomePage';

  @override
  Widget build(BuildContext context) {
    final isWide = Responsive.isWide(context);
    return AdminPageScaffold(
      title: pageTitle,
      showBackButton: false,
      logoNavigatesHome: false,
      headerGap: 30,
      body: isWide
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                Responsive.percentOfWidth(context, 15),
                50,
                Responsive.percentOfWidth(context, 15),
                0,
              ),
              child: const Align(
                alignment: Alignment.topCenter,
                child: HomeTileGrid(compact: false),
              ),
            )
          : const SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(child: HomeTileGrid(compact: true)),
            ),
    );
  }
}
