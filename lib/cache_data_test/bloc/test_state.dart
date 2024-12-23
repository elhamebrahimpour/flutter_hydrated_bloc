import 'package:equatable/equatable.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/data/model/model.dart';

abstract class TestState extends Equatable {}

class InitialState extends TestState {
  @override
  List<Object?> get props => [];
}

class FetchingState extends TestState {
  final FormModelParams formModel;

  FetchingState(this.formModel);

  @override
  List<Object?> get props => [formModel];
}
