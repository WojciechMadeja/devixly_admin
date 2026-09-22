import 'package:flutter/widgets.dart';

/// Akcje wspólnego nagłówka stron (powrót, strona główna, wylogowanie).
/// Dostarcza je warstwa aplikacji (router i sesja), dzięki czemu widgety
/// z `core` nie zależą od konkretnych tras ani od logowania.
class AdminShell extends InheritedWidget {
  const AdminShell({
    super.key,
    required this.onBack,
    required this.onHome,
    required this.onLogout,
    required super.child,
  });

  final VoidCallback onBack;
  final VoidCallback onHome;
  final VoidCallback onLogout;

  static AdminShell of(BuildContext context) {
    final shell = context.dependOnInheritedWidgetOfExactType<AdminShell>();
    assert(shell != null, 'Brak AdminShell nad stroną panelu.');
    return shell!;
  }

  @override
  bool updateShouldNotify(AdminShell oldWidget) => false;
}
