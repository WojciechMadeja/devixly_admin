import 'package:devixly_admin/core/utils/date_formatters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() => initializeDateFormatting('pl'));

  test('toApiDate nie dopełnia dnia zerem (jak wersja FlutterFlow)', () {
    expect(DateFormatters.toApiDate(DateTime(2026, 9, 5)), '2026-09-5');
    expect(DateFormatters.toApiDate(DateTime(2026, 12, 24)), '2026-12-24');
  });

  test('fromApiDate zamienia datę z API na polski zapis', () {
    expect(DateFormatters.fromApiDate('2026-09-5'), '5 września 2026');
    expect(DateFormatters.fromApiDate('2026-01-15'), '15 stycznia 2026');
  });

  test('fromApiDate zostawia nierozpoznany zapis bez zmian', () {
    expect(DateFormatters.fromApiDate(''), '');
    expect(DateFormatters.fromApiDate('2026/09/05'), '2026/09/05');
    expect(DateFormatters.fromApiDate('2026-13-05'), '2026-13-05');
  });

  test('toPickerLabel używa polskich nazw miesięcy', () {
    expect(
        DateFormatters.toPickerLabel(DateTime(2026, 9, 5)), '5 września 2026');
  });

  test('fromEpochMillis traktuje wartość jako UTC', () {
    final date = DateFormatters.fromEpochMillis(0);
    expect(date.toUtc(), DateTime.utc(1970));
  });
}
