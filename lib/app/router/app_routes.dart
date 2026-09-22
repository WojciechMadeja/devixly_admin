/// Ścieżki URL panelu — identyczne jak w wersji FlutterFlow, żeby zakładki
/// i linki użytkowników dalej działały. Ekran „Dodaj jednostkę”
/// (`AddUnitView`) celowo nie ma trasy.
abstract final class AppRoutes {
  static const root = '/';
  static const login = '/loginPage';
  static const home = '/homePage';
  static const newsList = '/newsListPage';
  static const addNews = '/addNewsPage';
  static const editNews = '/editNewsPage';
  static const categories = '/addCategoryPage';
  static const companies = '/addCompanyPage';
  static const usersList = '/usersListPage';
  static const addUser = '/addUserPage';
  static const importUsers = '/addListOfUsersPage';
  static const addAdmin = '/addAdminPage';
  static const settings = '/settingsPage';
  static const editProfile = '/editPersonDataPage';
  static const updatePassword = '/updatePasswordPage';
}
