import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

int? responsiveSize(
  double deviceWidth,
  int pixel,
) {
  double baseDeviceSize = 393.0;

  return (deviceWidth * (pixel / baseDeviceSize)).toInt();
}

int responsiveSizePerPrecent(
  double deviceWidth,
  int precent,
) {
  return (deviceWidth * (precent / 100)).toInt();
}

DateTime convertJSONToTime(int jsonInt) {
  return DateTime.fromMillisecondsSinceEpoch(jsonInt, isUtc: true).toLocal();
}

String? imageToBase64(FFUploadedFile? uploadedFile) {
  if (uploadedFile == null || uploadedFile.bytes == null) {
    return null;
  }

  String base64String = base64Encode(uploadedFile.bytes!);

  return base64String;
}

FFUploadedFile? base64ToImage(String? base64Image) {
  if (base64Image == null) {
    return null;
  }

  final bytes = base64.decode(base64Image);
  final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

  return FFUploadedFile(bytes: bytes, name: fileName);
}

Ratio returnRatio(String? ratioFromString) {
  switch (ratioFromString) {
    case 'horizontal':
      return Ratio.horizontal;
    case 'vertical':
      return Ratio.vertical;
    case 'square':
      return Ratio.square;
  }
  return Ratio.horizontal;
}

bool? isCsvLoaded(FFUploadedFile? file) {
  if (file == null) return false;

  final bytes = file.bytes;
  if (bytes == null || bytes.isEmpty) return false;

  // Próbka do 64 KB
  final end = math.min(bytes.length, 64 * 1024);
  String sample;
  try {
    sample = utf8.decode(bytes.sublist(0, end), allowMalformed: false);
  } catch (_) {
    sample = utf8.decode(bytes.sublist(0, end), allowMalformed: true);
  }

  // Usuń BOM jeśli jest
  if (sample.startsWith('\uFEFF')) {
    sample = sample.substring(1);
  }

  // Odrzuć treści "binarne" (za dużo znaków sterujących)
  final ctrl = RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F]');
  final ctrlCount = ctrl.allMatches(sample).length;
  if (ctrlCount > sample.length / 50) return false; // >2% znaków sterujących

  // Wiersze
  final lines = sample
      .split(RegExp(r'\r?\n'))
      .map((l) => l.trimRight())
      .where((l) => l.isNotEmpty)
      .toList();
  if (lines.length < 2) return false;

  // Pomocnicza: policz znaki
  int countChar(String s, String ch) => ch.isEmpty ? 0 : s.split(ch).length - 1;

  // Wybór separatora
  final candidates = [',', ';', '\t'];
  String sep = ',';
  int bestScore = -1;
  for (final c in candidates) {
    final score =
        lines.take(50).fold<int>(0, (sum, l) => sum + countChar(l, c));
    if (score > bestScore) {
      bestScore = score;
      sep = c;
    }
  }
  if (bestScore <= 0) return false; // brak realnego separatora

  // Spójność liczby kolumn
  final counts = lines.take(50).map((l) => l.split(sep).length).toList();

  int mode(List<int> vals) {
    final map = <int, int>{};
    for (final v in vals) {
      map[v] = (map[v] ?? 0) + 1;
    }
    int bestK = vals.first;
    int bestV = -1;
    map.forEach((k, v) {
      if (v > bestV) {
        bestV = v;
        bestK = k;
      }
    });
    return bestK;
  }

  final colCount = mode(counts);
  if (colCount <= 1) return false;

  final consistent = counts.where((c) => c == colCount).length / counts.length;
  if (consistent < 0.8) return false;

  // Jeśli dotarliśmy tutaj, plik wygląda jak CSV
  return true;
}

dynamic buildUsersPayload(
  List<DisplayUserStruct> users,
  int companyId,
  String? adminEmail,
) {
  final list = users
      .map((u) => {
            'email': u.email,
            'firstName': u.firstName,
            'lastName': u.lastName,
            'company': companyId,
            'phoneNumber': u.phoneNumber,
          })
      .toList();
  return {'users': list, 'admin_email': adminEmail};
}

List<int> returnIdCategoriesList(
  List<String> categoryNameList,
  List<CategoryStruct> categoryList,
) {
  final Map<String, List<int>> byName = {};
  for (final c in categoryList) {
    (byName[c.name] ??= <int>[]).add(c.id);
  }

  final List<int> idsList = [];
  for (final name in categoryNameList) {
    final ids = byName[name];
    if (ids != null) idsList.addAll(ids);
  }

  return idsList;
}

List<String> getCategoryNamesByIds(
  List<int> idList,
  List<CategoryStruct> categoryList,
) {
  // Mapa id -> nazwa (zakładamy unikalne ID w categoryList)
  final Map<int, String> byId = {
    for (final c in categoryList) c.id: c.name,
  };

  // Zwracamy nazwy w kolejności podanej w idList (pomijamy brakujące ID)
  final List<String> names = [];
  for (final id in idList) {
    final name = byId[id];
    if (name != null) names.add(name);
  }
  return names;
}

List<DisplayUserStruct> sortMyData(
  List<DisplayUserStruct> listToSort,
  bool isAsc,
  SortKey sortKey,
) {
  int dirCompare<T extends Comparable>(T a, T b, bool asc) =>
      asc ? a.compareTo(b) : b.compareTo(a);

  int adminRank(DisplayUserStruct u) => (u.isAdministrator == true) ? 0 : 1;
  int blockRank(DisplayUserStruct u) => (u.isBlocked == true) ? 0 : 1;

  switch (sortKey) {
    case SortKey.name:
      // Prosto po nazwisku, z kierunkiem wg isAsc
      listToSort.sort((a, b) => dirCompare(a.lastName, b.lastName, isAsc));
      break;

    case SortKey.company:
      // Najpierw firma wg isAsc, a w obrębie firmy nazwisko ZAWSZE rosnąco
      listToSort.sort((a, b) {
        final byCompany = dirCompare(a.company.name, b.company.name, isAsc);
        if (byCompany != 0) return byCompany;
        return a.lastName.compareTo(b.lastName); // stały porządek wewnątrz
      });
      break;

    case SortKey.admin:
      // Najpierw admin/non-admin wg isAsc, w obrębie grup nazwisko rosnąco
      listToSort.sort((a, b) {
        final byAdmin = dirCompare(adminRank(a), adminRank(b), isAsc);
        if (byAdmin != 0) return byAdmin;
        return a.lastName.compareTo(b.lastName); // nie odwracamy
      });
      break;

    case SortKey.block:
      // Najpierw zablokowani/nie wg isAsc, w obrębie grup nazwisko rosnąco
      listToSort.sort((a, b) {
        final byBlock = dirCompare(blockRank(a), blockRank(b), isAsc);
        if (byBlock != 0) return byBlock;
        return a.lastName.compareTo(b.lastName); // nie odwracamy
      });
      break;

    default:
      break;
  }

  // Brak globalnego reverse — porządek wewnętrzny (lastName) pozostaje stały.
  return listToSort;
}

bool isValidEmail(String email) {
  final e = email.trim();

  // Długości wg praktycznych limitów (całość ≤ 320, lokalna ≤ 64, domena ≤ 255)
  if (e.isEmpty || e.length > 320) return false;
  if (!e.contains('@')) return false;

  final parts = e.split('@');
  if (parts.length != 2) return false;

  final local = parts[0];
  final domain = parts[1];

  if (local.isEmpty || domain.isEmpty) return false;
  if (local.length > 64) return false;
  if (domain.length > 255) return false;

  // Niedozwolone wzorce
  if (local.startsWith('.') || local.endsWith('.')) return false;
  if (local.contains('..')) return false;
  if (domain.contains('..')) return false;

  // Dozwolone znaki w części lokalnej (RFC "praktyczne"): litery, cyfry i typowe symbole
  final localRegex = RegExp(r"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~.-]+$");
  if (!localRegex.hasMatch(local)) return false;

  // Dozwolone znaki w domenie (IDN pomijamy — użyj punycode, jeśli potrzebujesz)
  final domainRegex = RegExp(r'^[A-Za-z0-9.-]+$');
  if (!domainRegex.hasMatch(domain)) return false;

  // Domena musi mieć co najmniej dwa labele (np. example + com)
  final labels = domain.split('.');
  if (labels.length < 2) return false;

  // Każdy label: nie pusty, ≤ 63, bez myślnika na początku/końcu
  for (final label in labels) {
    if (label.isEmpty || label.length > 63) return false;
    if (label.startsWith('-') || label.endsWith('-')) return false;
  }

  // Ostatni label (TLD): same litery i sensowna długość
  final tld = labels.last;
  final tldRegex = RegExp(r'^[A-Za-z]{2,24}$');
  if (!tldRegex.hasMatch(tld)) return false;

  return true;
}

String? convertDateFromString(String date) {
  // Oczekiwany format: YYYY-MM-DD
  final parts = date.split('-');
  if (parts.length != 3) return date;

  final year = parts[0];
  final month = int.tryParse(parts[1]);
  final day = int.tryParse(parts[2]);

  if (month == null || day == null) return date;

  const months = [
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

  if (month < 1 || month > 12) return date;

  return '$day ${months[month - 1]} $year';
}
