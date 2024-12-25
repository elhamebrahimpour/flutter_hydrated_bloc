import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/data/repository/repository.dart';

import 'cache_data_test/bloc/test_bloc.dart';
import 'cache_data_test/screen.dart';
import 'cache_data_test/screen2.dart';
import 'cache_data_test/test_cache_data_screen.dart';
import 'todo/bloc/todo_bloc.dart';

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
          create: (context) => TestBloc(
            repository: TestRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const TestCacheDataScreen(),
          '/screen': (context) => const Screen(),
          '/screen2': (context) => const Screen2(),
        },
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              backgroundColor: Colors.transparent,
              elevation: 0),
          scaffoldBackgroundColor: Colors.black,
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}
