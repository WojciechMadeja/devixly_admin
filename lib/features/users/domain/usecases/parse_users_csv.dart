import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:csv/csv.dart';

import '../entities/user_drafts.dart';

/// Wynik wczytania pliku CSV z użytkownikami.
sealed class CsvParseResult {
  const CsvParseResult();
}

/// Plik nie wygląda na CSV (binarny, jedna linia, brak separatora).
final class CsvNotRecognized extends CsvParseResult {
  const CsvNotRecognized();
}

/// Brakuje wymaganych kolumn nagłówka.
final class CsvMissingHeaders extends CsvParseResult {
  const CsvMissingHeaders(this.required);

  final List<String> required;
}

/// W pliku są niepoprawne adresy e-mail (opisane numerem linii).
final class CsvInvalidEmails extends CsvParseResult {
  const CsvInvalidEmails(this.errors);

  final List<String> errors;
}

final class CsvParsed extends CsvParseResult {
  const CsvParsed(this.users);

  final List<CsvUser> users;
}

/// Wczytuje listę użytkowników z pliku CSV. Logika (rozpoznanie pliku,
/// wykrywanie separatora, wymagane nagłówki, walidacja e-maili) jest
/// przeniesiona 1:1 z akcji FlutterFlow.
class ParseUsersCsv {
  const ParseUsersCsv();

  static const requiredHeaders = [
    'firstName',
    'lastName',
    'email',
    'phoneNumber',
  ];

  CsvParseResult call(Uint8List bytes) {
    if (bytes.isEmpty || !_looksLikeCsv(bytes)) return const CsvNotRecognized();

    final text = _decode(bytes);
    final rows = _rows(text);
    if (rows.isEmpty) return const CsvParsed([]);

    final headers = rows.first.map((e) => e.toString().trim()).toList();
    final emailIndex = headers.indexOf('email');
    if (emailIndex >= 0) {
      final invalid = _invalidEmails(rows, emailIndex);
      if (invalid.isNotEmpty) return CsvInvalidEmails(invalid);
    }
    if (!requiredHeaders.every(headers.contains)) {
      return const CsvMissingHeaders(requiredHeaders);
    }

    final firstName = headers.indexOf('firstName');
    final lastName = headers.indexOf('lastName');
    final phoneNumber = headers.indexOf('phoneNumber');
    return CsvParsed([
      for (final row in rows.skip(1))
        if (!_isEmptyRow(row))
          CsvUser(
            firstName: _cell(row, firstName),
            lastName: _cell(row, lastName),
            email: _cell(row, emailIndex),
            phoneNumber: _cell(row, phoneNumber),
          ),
    ]);
  }

  static String _decode(Uint8List bytes) {
    final text =
        utf8.decode(bytes, allowMalformed: true).replaceAll('\r\n', '\n');
    return text.startsWith('﻿') ? text.substring(1) : text;
  }

  static List<List<dynamic>> _rows(String text) => const CsvToListConverter(
        shouldParseNumbers: false,
        eol: '\n',
      ).convert(text, fieldDelimiter: _detectDelimiter(text.split('\n').first));

  /// Separator = znak najczęściej występujący w wierszu nagłówka.
  static String _detectDelimiter(String headerLine) {
    var best = ',';
    var bestScore = -1;
    for (final candidate in [',', ';', '\t', '|']) {
      final score = headerLine.split(candidate).length - 1;
      if (score > bestScore) {
        best = candidate;
        bestScore = score;
      }
    }
    return bestScore > 0 ? best : ',';
  }

  static String _cell(List<dynamic> row, int index) =>
      index >= 0 && index < row.length ? '${row[index]}'.trim() : '';

  static bool _isEmptyRow(List<dynamic> row) =>
      row.isEmpty || row.every((cell) => '${cell ?? ''}'.trim().isEmpty);

  static List<String> _invalidEmails(List<List<dynamic>> rows, int index) => [
        for (var r = 1; r < rows.length; r++)
          if (!_isEmptyRow(rows[r]) && !_isValidCsvEmail(_cell(rows[r], index)))
            'linia ${r + 1}: "${_cell(rows[r], index)}"',
      ];

  static final _emailPattern = RegExp(
    r"^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r'(?:[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?\.)+'
    r'[A-Za-z]{2,}$',
  );

  static bool _isValidCsvEmail(String email) {
    final value = email.trim();
    if (value.isEmpty || value.length > 254 || value.contains('..')) {
      return false;
    }
    return _emailPattern.hasMatch(value);
  }

  static final _controlCharacters = RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F]');

  /// Heurystyka „czy to w ogóle CSV”: próbka 64 KB, mało znaków sterujących,
  /// co najmniej dwie linie i spójna liczba kolumn.
  static bool _looksLikeCsv(Uint8List bytes) {
    final end = math.min(bytes.length, 64 * 1024);
    var sample = utf8.decode(bytes.sublist(0, end), allowMalformed: true);
    if (sample.startsWith('﻿')) sample = sample.substring(1);
    if (_controlCharacters.allMatches(sample).length > sample.length / 50) {
      return false;
    }

    final lines = sample
        .split(RegExp(r'\r?\n'))
        .map((line) => line.trimRight())
        .where((line) => line.isNotEmpty)
        .take(50)
        .toList();
    if (lines.length < 2) return false;

    var separator = ',';
    var bestScore = -1;
    for (final candidate in [',', ';', '\t']) {
      final score = lines.fold<int>(
        0,
        (sum, line) => sum + line.split(candidate).length - 1,
      );
      if (score > bestScore) {
        bestScore = score;
        separator = candidate;
      }
    }
    if (bestScore <= 0) return false;

    final counts = lines.map((line) => line.split(separator).length).toList();
    final columns = _mostCommon(counts);
    if (columns <= 1) return false;
    return counts.where((c) => c == columns).length / counts.length >= 0.8;
  }

  static int _mostCommon(List<int> values) {
    final occurrences = <int, int>{};
    for (final value in values) {
      occurrences[value] = (occurrences[value] ?? 0) + 1;
    }
    var best = values.first;
    var bestCount = -1;
    occurrences.forEach((value, count) {
      if (count > bestCount) {
        bestCount = count;
        best = value;
      }
    });
    return best;
  }
}
