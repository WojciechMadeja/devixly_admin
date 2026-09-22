// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//
import 'dart:convert';
import 'package:csv/csv.dart';

Future<List<String>> findInvalidEmailsInCsv(FFUploadedFile? file) async {
  // Add your function code here!
  if (file?.bytes == null || file!.bytes!.isEmpty) return <String>[];

  // Dekodowanie + normalizacja
  var text =
      utf8.decode(file.bytes!, allowMalformed: true).replaceAll('\r\n', '\n');
  if (text.startsWith('\uFEFF')) text = text.substring(1);

  // Wykrycie delimitera z pierwszej linii
  String detectDelimiter(String headerLine) {
    final candidates = [',', ';', '\t', '|'];
    String best = ',';
    var bestScore = -1;
    for (final c in candidates) {
      final sc = headerLine.split(c).length - 1;
      if (sc > bestScore) {
        best = c;
        bestScore = sc;
      }
    }
    return bestScore > 0 ? best : ',';
  }

  final firstLine = text.split('\n').first;
  final delimiter = detectDelimiter(firstLine);

  // Parsowanie CSV
  final rows = const CsvToListConverter(
    shouldParseNumbers: false,
    eol: '\n',
  ).convert(text, fieldDelimiter: delimiter);

  if (rows.isEmpty) return <String>[];

  // Nagłówki — wymagana kolumna 'email'
  final headers = rows.first.map((e) => e.toString().trim()).toList();
  final iEmail = headers.indexOf('email');
  if (iEmail < 0) return <String>[]; // brak kolumny email => nic do raportu

  String? cell(List row, int i) =>
      (i >= 0 && i < row.length) ? row[i]?.toString().trim() : null;

  // Walidator e-mail (subset RFC 5322 + TLD ≥ 2)
  bool isValidEmail(String? email) {
    if (email == null) return false;
    final e = email.trim();
    if (e.isEmpty || e.length > 254) return false;
    if (e.contains('..')) return false; // brak podwójnych kropek
    final re = RegExp(
      r"^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"(?:[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?\.)+"
      r"[A-Za-z]{2,}$",
    );
    return re.hasMatch(e);
  }

  // Zbierz wszystkie niepoprawne emaile (z numerem linii, z duplikatami)
  final invalids = <String>[];

  for (var r = 1; r < rows.length; r++) {
    final row = rows[r];
    final isEmptyRow = row.isEmpty ||
        row.every((e) => e == null || e.toString().trim().isEmpty);
    if (isEmptyRow) continue;

    final email = cell(row, iEmail) ?? '';
    if (!isValidEmail(email)) {
      final lineNo = r + 1; // +1, bo 1. wiersz to nagłówek
      invalids.add('linia $lineNo: "${email}"');
    }
  }

  return invalids;
}
