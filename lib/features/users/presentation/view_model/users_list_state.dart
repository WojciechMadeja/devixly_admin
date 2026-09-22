import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../../companies/domain/entities/company.dart';
import '../../domain/entities/managed_user.dart';
import '../../domain/entities/user_sort.dart';

part 'users_list_state.freezed.dart';

@freezed
sealed class UsersListState with _$UsersListState {
  const factory UsersListState.loading() = UsersListLoading;

  /// Użytkownicy bez zalogowanego admina oraz firmy do wyboru w edycji.
  /// [sortKey] jest `null`, dopóki nikt nie kliknie nagłówka kolumny.
  const factory UsersListState.loaded({
    required List<ManagedUser> users,
    required List<Company> companies,
    UserSortKey? sortKey,
    @Default(true) bool ascending,
  }) = UsersListLoaded;

  const factory UsersListState.error(Failure failure) = UsersListError;
}
