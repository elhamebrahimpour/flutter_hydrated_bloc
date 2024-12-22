import 'package:flutter_hydrated_bloc/test_filed/bloc/event1.dart';
import 'package:flutter_hydrated_bloc/test_filed/bloc/state1.dart';
import 'package:flutter_hydrated_bloc/test_filed/data/model/model.dart';
import 'package:flutter_hydrated_bloc/test_filed/data/repository/repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class Bloc1 extends HydratedBloc<Event1, State1> {
  final Repo repo = Repo();
  Bloc1() : super(InitialState()) {
    on<FetchEvent>((event, emit) async {
      emit(
        StateLoaded(repo.modelnew ?? Model()),
      );
    });

    on<AddEvent>((event, emit) async {
      emit(
        StateLoaded(
          repo.addModel(event.model),
        ),
      );
    });
  }

// fromJson ensures that the state of your Bloc is restored when the app restarts, even after being terminated.

  @override
  State1? fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      return StateLoaded(
        Model.fromJson(json['data']),
      );
    }
    return InitialState();
  }

// toJson saves the Bloc's current state to disk, making it available for restoration later.

  @override
  Map<String, dynamic>? toJson(State1 state) {
    if (state is StateLoaded) {
      return {'data': state.model.toJson()};
    }

    return null;
  }
}
