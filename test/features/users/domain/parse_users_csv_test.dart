import 'dart:convert';
import 'dart:typed_data';

import 'package:devixly_admin/features/users/domain/entities/user_drafts.dart';
import 'package:devixly_admin/features/users/domain/usecases/parse_users_csv.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fixtures.dart';

void main() {
  const parse = ParseUsersCsv();
  Uint8List bytes(String text) => Uint8List.fromList(utf8.encode(text));

  test('wczytuje użytkowników z pliku fixture', () {
    final result = parse(readFixtureBytes('csv/users.csv'));

    expect(result, isA<CsvParsed>());
    final users = (result as CsvParsed).users;
    expect(users, hasLength(3));
    expect(
      users.first,
      const CsvUser(
        firstName: 'Marek',
        lastName: 'Lewandowski',
        email: 'marek.lewandowski@example.com',
        phoneNumber: '+48 501 111 222',
      ),
    );
    expect(users.last.lastName, 'Wójcik');
  });

  test('rozpoznaje średnik jako separator i pomija puste wiersze', () {
    final result = parse(
      bytes(
        'firstName;lastName;email;phoneNumber\n'
        'Jan;Kowalski;jan@example.com;123\n'
        ';;;\n'
        'Ewa;Nowak;ewa@example.com;456\n',
      ),
    );

    expect((result as CsvParsed).users.map((u) => u.firstName), ['Jan', 'Ewa']);
  });

  test('zgłasza niepoprawne adresy e-mail z numerem linii', () {
    final result = parse(
      bytes(
        'firstName,lastName,email,phoneNumber\n'
        'Jan,Kowalski,jan.kowalski@,123\n'
        'Ewa,Nowak,ewa@example.com,456\n'
        'Zofia,Kamińska,zofia@@example.com,789\n',
      ),
    );

    expect(
      (result as CsvInvalidEmails).errors,
      ['linia 2: "jan.kowalski@"', 'linia 4: "zofia@@example.com"'],
    );
  });

  test('zgłasza brak wymaganych kolumn', () {
    final result = parse(
      bytes('imie,nazwisko,mail\nJan,Kowalski,jan@example.com\n'),
    );

    expect(result, isA<CsvMissingHeaders>());
    expect(
      (result as CsvMissingHeaders).required,
      ['firstName', 'lastName', 'email', 'phoneNumber'],
    );
  });

  test('odrzuca plik, który nie jest CSV', () {
    expect(parse(bytes('to jest zwykły tekst')), isA<CsvNotRecognized>());
    expect(
      parse(Uint8List.fromList([0, 1, 2, 3, 0, 1, 2, 3])),
      isA<CsvNotRecognized>(),
    );
  });
}
