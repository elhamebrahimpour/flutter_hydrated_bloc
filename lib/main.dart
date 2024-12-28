import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/widgets/loading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  configureEasyLoading();

  runApp(const MyApp());
}
