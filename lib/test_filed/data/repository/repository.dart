import 'package:flutter_hydrated_bloc/test_filed/data/model/model.dart';

class Repo {
  Model? modelnew;

  Model addModel(Model model) {
    modelnew = model;

    return modelnew ?? Model();
  }
}
