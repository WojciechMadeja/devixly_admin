import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/user_drafts.dart';

abstract interface class UsersRemoteDataSource {
  Future<List<AppUser>> getUsers();

  Future<void> addUser(NewUser user);

  Future<AppUser> updateUser(int id, UserUpdate update);

  Future<void> setBlocked(int id, bool blocked);

  Future<void> deleteUser(int id);

  /// Zwraca adresy, na które backendowi nie udało się wysłać hasła.
  Future<List<String>> importUsers({
    required List<CsvUser> users,
    required int companyId,
  });
}

/// Konta użytkowników w backendzie (`AppUserEndpoint`). Wszystko tu wymaga
/// uprawnień administratora — backend sprawdza je po sesji.
class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  UsersRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<List<AppUser>> getUsers() => backendCall(_client.appUser.list);

  @override
  Future<void> addUser(NewUser user) => backendCall(
    () => _client.appUser.createUser(
      NewUserInput(
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        companyId: user.companyId,
        password: user.password,
      ),
    ),
  );

  /// Odpowiedź zapisu nie zawiera firmy, więc użytkownik jest potem
  /// czytany ponownie (z firmą, którą pokazuje lista).
  @override
  Future<AppUser> updateUser(int id, UserUpdate update) =>
      backendCall(() async {
        final updated = await _client.appUser.update(
          id,
          AppUserInput(
            email: update.email,
            companyId: update.companyId,
            lastName: update.lastName,
            firstName: update.firstName,
            phoneNumber: update.phoneNumber,
          ),
        );
        return await _client.appUser.getById(id) ?? updated;
      });

  @override
  Future<void> setBlocked(int id, bool blocked) =>
      backendCall(() => _client.appUser.setBlocked(id, blocked));

  @override
  Future<void> deleteUser(int id) =>
      backendCall(() => _client.appUser.delete(id));

  /// Konta z importu CSV nie mają haseł: backend generuje je i wysyła
  /// użytkownikom e-mailem. Tworzy wszystkie konta albo żadne, a w wyniku
  /// podaje adresy, na które wysyłka się nie powiodła.
  @override
  Future<List<String>> importUsers({
    required List<CsvUser> users,
    required int companyId,
  }) => backendCall(() async {
    final result = await _client.appUser.createUsers([
      for (final user in users)
        NewUserInput(
          email: user.email,
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
          companyId: companyId,
        ),
    ]);
    return result.passwordEmailFailed;
  });
}
