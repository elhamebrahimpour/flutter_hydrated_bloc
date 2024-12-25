import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_event.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_state.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/data/model/model.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/data/repository/repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TestBloc extends HydratedBloc<TestEvent, TestState> {
  final TestRepository _repository;

  TestBloc({required TestRepository repository})
      : _repository = repository,
        super(InitialState()) {
    on<FetchedEvent>((event, emit) async {
      emit(
        FetchingState(_repository.modelnew),
      );
    });

    on<UpdatedEvent>((event, emit) async {
      var model = _repository.saveFormData(event.formModel);
      var newState = FetchingState(model);

      emit(newState);

      // // Force state serialization
      // await HydratedBloc.storage.write(id, toJson(newState));
    });

    on<DeletedEvent>((event, emit) async {
      // print('Before deletion:');
      // print('In-memory state: $state');
      // print('Storage content: ${HydratedBloc.storage.read(id)}');

      // Emit InitialState
      emit(InitialState());

      // Clear the storage entry for this bloc
      // await _repository.deleteFormData(id);

      // print('After deletion:');
      // print('In-memory state: $state');
      // print('Storage content: ${HydratedBloc.storage.read(id)}');
    });
  }

  @override
  String get id => 'test_bloc_key';

// fromJson ensures that the state of your Bloc is restored when the app restarts, even after being terminated.

  @override
  TestState? fromJson(Map<String, dynamic> json) {
    // print('Deserializing state: $json');
    // print('State emitted: $state');
    // print('Storage content: ${HydratedBloc.storage.read(id)}');

    if (json['data'] != null) {
      return FetchingState(
        FormModelParams.fromJson(json['data']),
      );
    }

    return InitialState();
  }

// toJson saves the Bloc's current state to disk, making it available for restoration later.

  @override
  Map<String, dynamic>? toJson(TestState state) {
    if (state is FetchingState) {
      return {'data': state.formModel.toJson()};
    }

    return {};
  }
}
