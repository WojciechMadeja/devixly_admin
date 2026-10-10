/// Ścieżki URL panelu. Adresy przeniesione z wersji FlutterFlow zostają
/// bez zmian, żeby zakładki i linki użytkowników dalej działały; nowe
/// ekrany dopisujemy na końcu.
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
  static const addProject = '/addProjectPage';
  static const projectsList = '/projectsListPage';
  static const projectDetails = '/projectPage';
  static const addUnit = '/addUnityPage';
  static const settings = '/settingsPage';
  static const editProfile = '/editPersonDataPage';
  static const updatePassword = '/updatePasswordPage';
}
