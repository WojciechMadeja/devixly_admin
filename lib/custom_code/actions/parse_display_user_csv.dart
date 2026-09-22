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

import 'package:csv/csv.dart';
import 'dart:convert';

Future<List<DisplayUserStruct>?> parseDisplayUserCsv(
    FFUploadedFile? file) async {
  /// MODIFY CODE ONLY BELOW THIS LINE
  if (file?.bytes == null || file!.bytes!.isEmpty) return <DisplayUserStruct>[];

  // Decode (normalize CRLF -> LF, strip BOM)
  var text =
      utf8.decode(file.bytes!, allowMalformed: true).replaceAll('\r\n', '\n');
  if (text.startsWith('\uFEFF')) text = text.substring(1);

  // Detect delimiter from header line
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

  // Parse CSV
  final rows = const CsvToListConverter(
    shouldParseNumbers: false,
    eol: '\n',
  ).convert(text, fieldDelimiter: delimiter);

  if (rows.isEmpty) return <DisplayUserStruct>[];

  // ---- Headers: exact names (English), order can be any ----
  final headers = rows.first.map((e) => e.toString().trim()).toList();
  const required = ['firstName', 'lastName', 'email', 'phoneNumber'];
  final ok = required.every(headers.contains);
  if (!ok) {
    throw FormatException(
      'CSV must contain headers exactly: ${required.join(', ')}',
    );
  }

  int idx(String h) => headers.indexOf(h);
  final iFirstName = idx('firstName');
  final iLastName = idx('lastName');
  final iEmail = idx('email');
  final iPhone = idx('phoneNumber');

  String? cell(List row, int i) =>
      (i >= 0 && i < row.length) ? row[i]?.toString().trim() : null;

  final out = <DisplayUserStruct>[];
  for (var r = 1; r < rows.length; r++) {
    final row = rows[r];
    if (row.isEmpty ||
        row.every((e) => e == null || e.toString().trim().isEmpty)) continue;

    out.add(createDisplayUserStruct(
      firstName: cell(row, iFirstName) ?? '',
      lastName: cell(row, iLastName) ?? '',
      email: cell(row, iEmail) ?? '',
      phoneNumber: cell(row, iPhone) ?? '',
    ));
  }

  return out;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
