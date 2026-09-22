import 'dart:async';

import 'package:flutter/foundation.dart';

/// Zamienia strumień (np. stanów sesji) na `Listenable` dla
/// `GoRouter.refreshListenable`.
class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<Object?> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
