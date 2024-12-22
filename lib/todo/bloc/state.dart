import 'package:flutter_hydrated_bloc/todo/data/model/model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoStateLoaded extends TodoState {
  final List<TodoModel> task;

  TodoStateLoaded(this.task);
}
