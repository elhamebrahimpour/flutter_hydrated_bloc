import 'package:flutter_hydrated_bloc/cache_data_test/data/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TestRepository {
  FormModelParams modelnew = FormModelParams();

  FormModelParams saveFormData(FormModelParams newFormModel) {
    modelnew = newFormModel;

    return modelnew;
  }

  Future<void> deleteFormData(key) async {
    await HydratedBloc.storage.delete(key);
  }
}
