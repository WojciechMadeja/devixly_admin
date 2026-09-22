// Struktury FlutterFlow odpowiadające plikom test/fixtures/api/*.json —
// dane wejściowe do wzorców wyglądu starych komponentów.
import 'package:devixly_admin/backend/schema/structs/index.dart';

final legacyNews = NewsStruct(
  id: 11,
  createdAt: 1757500000000,
  title: 'Nowa inwestycja w Dubaju',
  content: 'Rozpoczynamy sprzedaż apartamentów w nowym projekcie. '
      'Szczegóły oferty znajdziesz w panelu.',
  image: 'https://example.com/news-11.png',
  author: 'Jan Kowalski',
  ratio: 'horizontal',
  categories: [2, 4],
  date: '2026-09-5',
);

final legacyVerticalNews = NewsStruct(
  id: 12,
  createdAt: 1757600000000,
  title: 'Spotkanie z inwestorami',
  content: 'Zapraszamy na spotkanie z inwestorami w biurze Crowd Empire.',
  image: 'https://example.com/news-12.png',
  author: 'Anna Nowak',
  ratio: 'vertical',
  categories: [3],
  date: '2026-09-12',
);

final legacyCategories = [
  CategoryStruct(id: 1, name: 'Crowd Empire', numberOfNews: 3),
  CategoryStruct(id: 2, name: 'Inwestycje', numberOfNews: 5),
  CategoryStruct(id: 3, name: 'Wydarzenia', numberOfNews: 0),
  CategoryStruct(id: 4, name: 'Rynek nieruchomości', numberOfNews: 2),
];

final legacyCompanies = [
  CompanyStruct(
    id: 1,
    name: 'Crowd Empire',
    email: 'biuro@crowdempire.ae',
    address: 'ul. Złota 44',
    postCode: '00-120',
    city: 'Warszawa',
    phoneNumber: '+48 22 100 20 30',
    companyRepresentative: 'Anna Nowak',
    numberOfMembers: 12,
    isBlocked: false,
    admin: 1,
  ),
  CompanyStruct(
    id: 2,
    name: 'Devixly Sp. z o.o.',
    email: 'kontakt@devixly.com',
    address: 'ul. Długa 5',
    postCode: '30-001',
    city: 'Kraków',
    phoneNumber: '+48 12 300 40 50',
    companyRepresentative: 'Piotr Wiśniewski',
    numberOfMembers: 4,
    isBlocked: false,
    admin: 1,
  ),
  CompanyStruct(
    id: 3,
    name: 'Łódzkie Nieruchomości',
    email: 'biuro@lodzkie.pl',
    address: 'ul. Piotrkowska 100',
    postCode: '90-001',
    city: 'Łódź',
    phoneNumber: '+48 42 600 70 80',
    companyRepresentative: 'Ewa Zielińska',
    numberOfMembers: 0,
    isBlocked: true,
    admin: 1,
  ),
];

final legacyUser = DisplayUserStruct(
  id: 3,
  firstName: 'Piotr',
  lastName: 'Wiśniewski',
  email: 'piotr@devixly.com',
  isAdministrator: false,
  phoneNumber: '+48 600 300 400',
  isBlocked: false,
  company: CompanyStruct(id: 2, name: 'Devixly Sp. z o.o.', isBlocked: false),
);

final legacyAdmin = DisplayUserStruct(
  id: 2,
  firstName: 'Anna',
  lastName: 'Nowak',
  email: 'anna.nowak@crowdempire.ae',
  isAdministrator: true,
  phoneNumber: '+48 600 200 300',
  isBlocked: false,
  company: CompanyStruct(id: 1, name: 'Crowd Empire', isBlocked: false),
);

final legacyBlockedUser = DisplayUserStruct(
  id: 4,
  firstName: 'Ewa',
  lastName: 'Zielińska',
  email: 'ewa@lodzkie.pl',
  isAdministrator: false,
  phoneNumber: '+48 600 400 500',
  isBlocked: true,
  company: CompanyStruct(id: 3, name: 'Łódzkie Nieruchomości', isBlocked: true),
);

/// Wiersze z importu CSV (bez firmy i id — tak jak zwraca parser CSV).
final legacyCsvUsers = [
  DisplayUserStruct(
    firstName: 'Marek',
    lastName: 'Lewandowski',
    email: 'marek.lewandowski@example.com',
    phoneNumber: '+48 501 111 222',
  ),
  DisplayUserStruct(
    firstName: 'Zofia',
    lastName: 'Kamińska',
    email: 'zofia.kaminska@example.com',
    phoneNumber: '+48 502 333 444',
  ),
  DisplayUserStruct(
    firstName: 'Łukasz',
    lastName: 'Wójcik',
    email: 'lukasz.wojcik@example.com',
    phoneNumber: '+48 503 555 666',
  ),
];
