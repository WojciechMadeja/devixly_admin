import 'package:devixly_admin/core/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators.isValidEmail', () {
    test('akceptuje poprawne adresy', () {
      expect(Validators.isValidEmail('admin@devixly.com'), isTrue);
      expect(Validators.isValidEmail(' anna.nowak@crowdempire.ae '), isTrue);
      expect(Validators.isValidEmail('a+b@sub.example.pl'), isTrue);
    });

    test('odrzuca niepoprawne adresy', () {
      for (final email in [
        '',
        'jan.kowalski@',
        '@devixly.com',
        'zofia@@example.com',
        'jan..kowalski@example.com',
        '.jan@example.com',
        'jan@example',
        'jan@example.c',
        'jan@-example.com',
        'jan@example..com',
        'jan kowalski@example.com',
      ]) {
        expect(Validators.isValidEmail(email), isFalse, reason: email);
      }
    });
  });
}
