import 'package:flutter_hydrated_bloc/cache_data_test/data/model/model.dart';

abstract class TestEvent {}

class FetchedEvent extends TestEvent {}

class UpdatedEvent extends TestEvent {
  final FormModelParams formModel;

  UpdatedEvent(this.formModel);
}

class DeletedEvent extends TestEvent {}
