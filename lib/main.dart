import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hydrated_bloc/test_filed/bloc/bloc1.dart';
import 'package:flutter_hydrated_bloc/test_filed/screen.dart';
import 'package:flutter_hydrated_bloc/test_filed/values_maintain_screen.dart';
import 'package:flutter_hydrated_bloc/todo/bloc/todo_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) => Bloc1(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const ValuesMaintainScreen(),
          '/screen': (context) => const Screen(),
        },
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              backgroundColor: Colors.transparent,
              elevation: 0),
          scaffoldBackgroundColor: Colors.black,
        ),
        // home: const TodoScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
