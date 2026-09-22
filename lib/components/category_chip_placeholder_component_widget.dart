import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_chip_placeholder_component_model.dart';
export 'category_chip_placeholder_component_model.dart';

class CategoryChipPlaceholderComponentWidget extends StatefulWidget {
  const CategoryChipPlaceholderComponentWidget({super.key});

  @override
  State<CategoryChipPlaceholderComponentWidget> createState() =>
      _CategoryChipPlaceholderComponentWidgetState();
}

class _CategoryChipPlaceholderComponentWidgetState
    extends State<CategoryChipPlaceholderComponentWidget>
    with TickerProviderStateMixin {
  late CategoryChipPlaceholderComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CategoryChipPlaceholderComponentModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 200.0,
        height: 35.0,
        constraints: BoxConstraints(
          maxWidth: 800.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 120.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
