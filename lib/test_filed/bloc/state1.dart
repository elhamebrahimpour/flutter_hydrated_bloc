import 'package:equatable/equatable.dart';
import 'package:flutter_hydrated_bloc/test_filed/data/model/model.dart';

abstract class State1 extends Equatable {}

class InitialState extends State1 {
  @override
  List<Object?> get props => [];
}

class StateLoaded extends State1 {
  final Model model;

  StateLoaded(this.model);

  @override
  List<Object?> get props => [model];
}
