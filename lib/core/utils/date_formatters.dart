import 'package:intl/intl.dart';

/// Formaty dat używane przez panel i backend.
abstract final class DateFormatters {
  static const _months = [
    'stycznia',
    'lutego',
    'marca',
    'kwietnia',
    'maja',
    'czerwca',
    'lipca',
    'sierpnia',
    'września',
    'października',
    'listopada',
    'grudnia',
  ];

  /// Data aktualności w formacie API: `y-MM-d` (dzień bez zera wiodącego,
  /// np. `2026-09-5`) — dokładnie tak, jak wysyłała wersja FlutterFlow.
  static String toApiDate(DateTime date) => DateFormat('y-MM-d').format(date);

  /// Data wybrana w formularzu, np. „5 września 2026”.
  static String toPickerLabel(DateTime date) =>
      DateFormat('d MMMM y', 'pl').format(date);

  /// Data z API (`RRRR-MM-DD`) jako „5 września 2026”. Wartość w innym
  /// formacie zwraca bez zmian.
  static String fromApiDate(String date) {
    final parts = date.split('-');
    if (parts.length != 3) return date;
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);
    if (month == null || day == null || month < 1 || month > 12) return date;
    return '$day ${_months[month - 1]} ${parts[0]}';
  }

  /// Znacznik czasu Xano (milisekundy od epoki, UTC) jako czas lokalny.
  static DateTime fromEpochMillis(int millis) =>
      DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
}
