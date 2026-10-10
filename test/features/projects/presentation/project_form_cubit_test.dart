import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/core/state/submission_status.dart';
import 'package:devixly_admin/features/lookups/domain/entities/dictionary_item.dart';
import 'package:devixly_admin/features/lookups/domain/repositories/lookups_repository.dart';
import 'package:devixly_admin/features/projects/domain/entities/project_draft.dart';
import 'package:devixly_admin/features/projects/domain/repositories/projects_repository.dart';
import 'package:devixly_admin/features/projects/presentation/view_model/project_form_cubit.dart';
import 'package:devixly_admin/features/projects/presentation/view_model/project_form_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockProjects extends Mock implements ProjectsRepository {}

class _MockLookups extends Mock implements LookupsRepository {}

void main() {
  const district = DictionaryItem(id: 2, name: 'Dubai Marina');
  const draft = ProjectDraft(
    externalId: 9001,
    name: 'Nowa inwestycja',
    noc: 2.5,
    saleTypesDeveloper: true,
    saleTypesResale: false,
    districtId: 2,
  );

  late _MockProjects projects;
  late _MockLookups lookups;

  setUpAll(() => registerFallbackValue(draft));
  setUp(() {
    projects = _MockProjects();
    lookups = _MockLookups();
    when(lookups.getDistricts).thenAnswer((_) async => const Right([district]));
    when(lookups.getDevelopers).thenAnswer((_) async => const Right([]));
  });

  ProjectFormCubit build() => ProjectFormCubit(projects, lookups);

  Future<void> submit(
    ProjectFormCubit cubit, {
    String name = 'Nowa inwestycja',
    String externalId = '9001',
    String noc = '2,5',
  }) => cubit.submit(
    name: name,
    externalId: externalId,
    noc: noc,
    status: '',
    descriptionPl: '',
    descriptionEn: '',
    priceFrom: '',
    priceTo: '',
    areaFrom: '',
    areaTo: '',
  );

  blocTest<ProjectFormCubit, ProjectFormState>(
    'zapis wysyła wymagane pola i wybraną dzielnicę',
    build: build,
    setUp: () => when(
      () => projects.addProject(any()),
    ).thenAnswer((_) async => const Right(unit)),
    act: (cubit) async {
      cubit.selectDistrict(district);
      await submit(cubit);
    },
    verify: (_) => verify(() => projects.addProject(draft)).called(1),
  );

  blocTest<ProjectFormCubit, ProjectFormState>(
    'brak nazwy, numeru albo NOC przerywa zapis',
    build: build,
    act: (cubit) async {
      await submit(cubit, name: '  ');
      await submit(cubit, externalId: 'abc');
      await submit(cubit, noc: '');
    },
    verify: (cubit) {
      verifyNever(() => projects.addProject(any()));
      expect(cubit.state.submission, const SubmissionStatus.idle());
    },
  );

  blocTest<ProjectFormCubit, ProjectFormState>(
    'komunikat backendu trafia do stanu',
    build: build,
    setUp: () => when(() => projects.addProject(any())).thenAnswer(
      (_) async => const Left(
        ServerFailure(statusCode: 409, message: 'Numer projektu jest zajęty'),
      ),
    ),
    act: submit,
    skip: 1,
    expect: () => const [
      ProjectFormState(
        submission: SubmissionStatus.failure(
          ServerFailure(statusCode: 409, message: 'Numer projektu jest zajęty'),
        ),
      ),
      ProjectFormState(),
    ],
  );

  blocTest<ProjectFormCubit, ProjectFormState>(
    'słowniki trafiają do stanu',
    build: build,
    act: (cubit) => cubit.loadLookups(),
    verify: (cubit) => expect(cubit.state.districts, isNotNull),
  );
}
