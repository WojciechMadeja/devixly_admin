import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/categories/domain/entities/category.dart';
import 'package:devixly_admin/features/categories/domain/repositories/categories_repository.dart';
import 'package:devixly_admin/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:devixly_admin/features/categories/presentation/view_model/categories_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepository extends Mock implements CategoriesRepository {}

void main() {
  const events = Category(id: 3, name: 'Wydarzenia');
  const investments = Category(id: 2, name: 'Inwestycje', newsCount: 5);
  const owner = Category(id: 1, name: 'Crowd Empire', newsCount: 3);

  late _MockRepository repository;

  setUpAll(() => registerFallbackValue(investments));
  setUp(() => repository = _MockRepository());

  CategoriesCubit loadedCubit() => CategoriesCubit(repository)
    ..emit(
      const CategoriesState.loaded(categories: [owner, investments, events]),
    );

  blocTest<CategoriesCubit, CategoriesState>(
    'load emituje kategorie posortowane po nazwie',
    build: () => CategoriesCubit(repository),
    setUp: () => when(repository.getCategories)
        .thenAnswer((_) async => const Right([events, investments, owner])),
    act: (cubit) => cubit.load(),
    expect: () => [
      const CategoriesState.loading(),
      const CategoriesState.loaded(categories: [owner, investments, events]),
    ],
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'load emituje błąd, gdy nie da się pobrać kategorii',
    build: () => CategoriesCubit(repository),
    setUp: () => when(repository.getCategories)
        .thenAnswer((_) async => const Left(NetworkFailure())),
    act: (cubit) => cubit.load(),
    expect: () => [
      const CategoriesState.loading(),
      const CategoriesState.error(NetworkFailure()),
    ],
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'zaznacza i odznacza kartę po id',
    build: loadedCubit,
    act: (cubit) => cubit
      ..select(2)
      ..clearSelection(),
    expect: () => [
      const CategoriesState.loaded(
        categories: [owner, investments, events],
        selectedId: 2,
      ),
      const CategoriesState.loaded(categories: [owner, investments, events]),
    ],
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'zmiana nazwy podmienia kategorię i zachowuje sortowanie',
    build: loadedCubit,
    setUp: () => when(() => repository.renameCategory(any(), 'Zakupy'))
        .thenAnswer((_) async => Right(investments.copyWith(name: 'Zakupy'))),
    act: (cubit) async =>
        expect(await cubit.rename(investments, 'Zakupy'), isTrue),
    expect: () => [
      CategoriesState.loaded(
        categories: [owner, events, investments.copyWith(name: 'Zakupy')],
      ),
    ],
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'nieudane usunięcie zwraca false i nie zmienia listy',
    build: loadedCubit,
    setUp: () => when(() => repository.deleteCategory(2))
        .thenAnswer((_) async => const Left(ServerFailure(statusCode: 500))),
    act: (cubit) async => expect(await cubit.delete(investments), isFalse),
    expect: () => <CategoriesState>[],
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'usunięcie usuwa kategorię z listy i zaznaczenie',
    build: loadedCubit,
    setUp: () => when(() => repository.deleteCategory(2))
        .thenAnswer((_) async => const Right(unit)),
    act: (cubit) async {
      cubit.select(2);
      await cubit.delete(investments);
    },
    skip: 1,
    expect: () => [
      const CategoriesState.loaded(categories: [owner, events]),
    ],
  );
}
