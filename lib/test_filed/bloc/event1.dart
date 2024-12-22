import 'package:flutter_hydrated_bloc/test_filed/data/model/model.dart';

abstract class Event1 {}

class FetchEvent extends Event1 {}

class AddEvent extends Event1 {
  final Model model;

  AddEvent(this.model);
}
