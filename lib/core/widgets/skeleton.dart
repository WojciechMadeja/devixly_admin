import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_colors.dart';

/// Pulsujące wypełnienie w miejscu ładowanych danych: płynne pojawianie się
/// (0 → 1) powtarzane w pętli — tak jak szkielety w wersji FlutterFlow.
class SkeletonFade extends StatelessWidget {
  const SkeletonFade({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.repeat = true,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;

  /// `false` odtwarza pojawienie się tylko raz (tak działa część szkieletów
  /// w wersji FlutterFlow).
  final bool repeat;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: delay,
          duration: duration,
          begin: 0,
          end: 1,
        ),
      ],
      onPlay: repeat ? (controller) => controller.repeat() : null,
      child: child,
    );
  }
}

/// Szary prostokąt szkieletu.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.repeat = true,
  });

  final double width;
  final double height;
  final Duration duration;
  final Duration delay;
  final bool repeat;

  @override
  Widget build(BuildContext context) {
    return SkeletonFade(
      duration: duration,
      delay: delay,
      repeat: repeat,
      child: Container(width: width, height: height, color: AppColors.tertiary),
    );
  }
}
