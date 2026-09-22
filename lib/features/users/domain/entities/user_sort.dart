import '../entities/managed_user.dart';

/// Kolumna, po której sortowana jest lista użytkowników.
enum UserSortKey { name, company, admin, blocked }

/// Sortowanie listy użytkowników — reguły przeniesione z wersji FlutterFlow:
/// wybrana kolumna rosnąco lub malejąco, a w obrębie grup zawsze nazwisko
/// rosnąco.
List<ManagedUser> sortUsers(
  List<ManagedUser> users, {
  required UserSortKey key,
  required bool ascending,
}) {
  int direction<T extends Comparable<Object>>(T a, T b) =>
      ascending ? a.compareTo(b) : b.compareTo(a);
  int byLastName(ManagedUser a, ManagedUser b) =>
      a.lastName.compareTo(b.lastName);

  final sorted = [...users];
  switch (key) {
    case UserSortKey.name:
      sorted.sort((a, b) => direction(a.lastName, b.lastName));
    case UserSortKey.company:
      sorted.sort((a, b) {
        final byCompany = direction(a.company.name, b.company.name);
        return byCompany != 0 ? byCompany : byLastName(a, b);
      });
    case UserSortKey.admin:
      sorted.sort((a, b) {
        final byAdmin = direction(
          a.isAdministrator ? 0 : 1,
          b.isAdministrator ? 0 : 1,
        );
        return byAdmin != 0 ? byAdmin : byLastName(a, b);
      });
    case UserSortKey.blocked:
      sorted.sort((a, b) {
        final byBlocked = direction(a.isBlocked ? 0 : 1, b.isBlocked ? 0 : 1);
        return byBlocked != 0 ? byBlocked : byLastName(a, b);
      });
  }
  return sorted;
}
