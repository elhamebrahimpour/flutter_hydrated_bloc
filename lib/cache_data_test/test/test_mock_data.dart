import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_bloc.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/data/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/test_event.dart';
import '../bloc/test_state.dart';
import '../data/repository/repository.dart';

class FakeFormModelParams extends Fake implements FormModelParams {}

class MockStorage extends Mock implements HydratedStorage {}

class MockTestRepository extends Mock implements TestRepository {}

void main() {
  late MockStorage storage;
  late MockTestRepository repository;
  late TestBloc testBloc;

  setUpAll(() {
    registerFallbackValue(
        FakeFormModelParams()); // Register a fallback value for FormModelParams
  });

  setUp(() {
    storage = MockStorage();
    repository = MockTestRepository();

    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => repository.saveFormData(any())).thenReturn(
      FormModelParams(id: 12345, title: 'new', description: 'hi'),
    );
    when(() => repository.deleteFormData(any())).thenAnswer((_) async {});

    HydratedBloc.storage = storage;
    testBloc = TestBloc(repository: repository);
  });

  group('TestBloc', () {
    blocTest(
      'emits FetchingState when updated is added',
      build: () => testBloc,
      act: (bloc) => bloc.add(
        UpdatedEvent(
          FormModelParams(
            id: 12345,
            title: 'new',
            description: 'hi',
          ),
        ),
      ),
      expect: () => [isA<FetchingState>()],
      verify: (bloc) {
        print(bloc.state); // You can print the state here
      },
    );

    blocTest<TestBloc, TestState>(
      'emits [InitialState] when DeletedEvent is added',
      build: () => testBloc,
      act: (bloc) => bloc.add(DeletedEvent()),
      expect: () => [isA<InitialState>()],
      verify: (bloc) {
        print(bloc.state); // You can print the state here
      },
    );
  });
}
