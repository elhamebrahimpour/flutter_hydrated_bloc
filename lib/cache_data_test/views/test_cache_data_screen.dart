import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_bloc.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_event.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_state.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/data/model/model.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/widgets/loading.dart';

class TestCacheDataScreen extends StatefulWidget {
  const TestCacheDataScreen({super.key});

  @override
  State<TestCacheDataScreen> createState() => _TestCacheDataScreenState();
}

class _TestCacheDataScreenState extends State<TestCacheDataScreen> {
  // late TextEditingController controller;

  final FormModelParams _params = FormModelParams();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Initialize the controller and load the initial value from the Bloc state.
  //   final currentState = BlocProvider.of<TestBloc>(context).state;
  //   controller = TextEditingController(
  //     text: currentState is FetchingState ? currentState.formModel.title : '',
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        automaticallyImplyLeading: false,
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                initialValue: state is FetchingState
                    ? state.formModel.title
                    : _params.title,
                onEditingComplete: () {
                  _persistTextToBloc();

                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  _params.title = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                initialValue: state is FetchingState
                    ? state.formModel.description
                    : _params.description,
                onEditingComplete: () {
                  _persistTextToBloc();

                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  _params.description = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _persistTextToBloc();
              },
              child: const Text('next'),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        );
      },
    );
  }

  void _persistTextToBloc() {
    BlocProvider.of<TestBloc>(context).add(
      UpdatedEvent(
        FormModelParams(
          id: Random().nextInt(9999999),
          title: _params.title,
          description: _params.description,
        ),
      ),
    );

    loading().then((_) {
      Navigator.pushNamed(context, '/screen');
    });
  }
}
