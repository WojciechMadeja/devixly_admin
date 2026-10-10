import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../../units/domain/entities/project_unit.dart';
import '../../domain/entities/project_details.dart';

part 'project_details_state.freezed.dart';

/// Stan podglądu projektu: dane projektu z planami płatności i jego
/// jednostki (pobierane osobno, bo bywa ich dużo).
@freezed
abstract class ProjectDetailsState with _$ProjectDetailsState {
  const factory ProjectDetailsState({
    @Default(Loadable<ProjectDetails>.loading())
    Loadable<ProjectDetails> details,
    @Default(Loadable<List<ProjectUnit>>.loading())
    Loadable<List<ProjectUnit>> units,
  }) = _ProjectDetailsState;
}
