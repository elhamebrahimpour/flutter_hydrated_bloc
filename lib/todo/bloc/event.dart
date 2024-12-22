import 'package:flutter_hydrated_bloc/todo/data/model/model.dart';

abstract class TodoEvent {}

class TodoFetch extends TodoEvent {}

class TodoAdd extends TodoEvent {
  final TodoModel task;
  TodoAdd(this.task);
}

class TodoRemove extends TodoEvent {
  final int id;

  TodoRemove(this.id);
}

class TodoUpdate extends TodoEvent {
  final int id;
  final bool status;
  TodoUpdate(this.id, this.status);
}
