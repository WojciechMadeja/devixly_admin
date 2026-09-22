import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/view/splash_view.dart';
import '../../features/auth/presentation/view_model/session_cubit.dart';
import '../../features/auth/presentation/view_model/session_state.dart';

/// Pokazuje ekran powitalny przez pierwszą sekundę po starcie (jak dotąd)
/// i dopóki wczytywana jest sesja.
class SplashGate extends StatefulWidget {
  const SplashGate({super.key, required this.child});

  final Widget child;

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> {
  static const _minimumDuration = Duration(seconds: 1);

  late final Timer _timer;
  bool _minimumElapsed = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(_minimumDuration, () {
      if (mounted) setState(() => _minimumElapsed = true);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restoring = context.select<SessionCubit, bool>(
      (cubit) => cubit.state is SessionRestoring,
    );
    return !_minimumElapsed || restoring ? const SplashView() : widget.child;
  }
}
