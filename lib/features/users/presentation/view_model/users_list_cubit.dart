import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/current_admin.dart';
import '../../../companies/domain/repositories/companies_repository.dart';
import '../../domain/entities/managed_user.dart';
import '../../domain/entities/user_drafts.dart';
import '../../domain/entities/user_sort.dart';
import '../../domain/repositories/users_repository.dart';
import 'users_list_state.dart';

/// Lista użytkowników: sortowanie po kolumnach, edycja, blokowanie
/// i usuwanie. Operacje zwracają, czy się udały (dialogi zamykają się tylko
/// przy sukcesie).
class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit(this._users, this._companies, this._admin)
      : super(const UsersListState.loading());

  final UsersRepository _users;
  final CompaniesRepository _companies;
  final CurrentAdmin _admin;

  Future<void> load() async {
    emit(const UsersListState.loading());
    final (usersResult, companiesResult) =
        await (_users.getUsers(), _companies.getCompanies()).wait;
    if (isClosed) return;
    emit(
      usersResult.match(
        UsersListState.error,
        (users) => companiesResult.match(
          UsersListState.error,
          (companies) => UsersListState.loaded(
            // Zalogowanego administratora nie pokazujemy na liście.
            users: [
              for (final user in users)
                if (user.email != _admin.email) user,
            ],
            companies: companies,
          ),
        ),
      ),
    );
  }

  void sort(UserSortKey key, {required bool ascending}) => _updateLoaded(
        (state) => state.copyWith(
          users: sortUsers(state.users, key: key, ascending: ascending),
          sortKey: key,
          ascending: ascending,
        ),
      );

  Future<bool> update(ManagedUser user, UserUpdate update) async {
    final result = await _users.updateUser(user, update);
    return result.match((_) => false, (updated) {
      _replace(updated);
      return true;
    });
  }

  Future<bool> setBlocked(ManagedUser user, bool blocked) async {
    final result = await _users.setBlocked(user, blocked);
    return result.match((_) => false, (updated) {
      _replace(updated);
      return true;
    });
  }

  Future<bool> delete(ManagedUser user) async {
    final result = await _users.deleteUser(user.id);
    return result.match((_) => false, (_) {
      _updateLoaded(
        (state) => state.copyWith(
          users: [
            for (final u in state.users)
              if (u.id != user.id) u,
          ],
        ),
      );
      return true;
    });
  }

  void _replace(ManagedUser updated) => _updateLoaded(
        (state) => state.copyWith(
          users: [
            for (final user in state.users)
              user.id == updated.id ? updated : user,
          ],
        ),
      );

  void _updateLoaded(UsersListLoaded Function(UsersListLoaded) update) {
    final current = state;
    if (current is UsersListLoaded && !isClosed) emit(update(current));
  }
}
