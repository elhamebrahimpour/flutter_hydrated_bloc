import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hydrated_bloc/test_filed/bloc/bloc1.dart';
import 'package:flutter_hydrated_bloc/test_filed/bloc/event1.dart';
import 'package:flutter_hydrated_bloc/test_filed/bloc/state1.dart';
import 'package:flutter_hydrated_bloc/test_filed/data/model/model.dart';

class ValuesMaintainScreen extends StatefulWidget {
  const ValuesMaintainScreen({super.key});

  @override
  State<ValuesMaintainScreen> createState() => _ValuesMaintainScreenState();
}

class _ValuesMaintainScreenState extends State<ValuesMaintainScreen> {
  late TextEditingController controller;

  // @override
  // void initState() {
  //   super.initState();

  //   // Initialize the controller and load the initial value from the Bloc state.
  //   final currentState = BlocProvider.of<Bloc1>(context).state;
  //   controller = TextEditingController(
  //     text: currentState is StateLoaded ? currentState.model.title : '',
  //   );
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize the controller and load the initial value from the Bloc state.
    final currentState = BlocProvider.of<Bloc1>(context).state;
    controller = TextEditingController(
      text: currentState is StateLoaded ? currentState.model.title : '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return BlocBuilder<Bloc1, State1>(
      builder: (context, state) {
        return Column(
          children: [
            Text(controller.text),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                onTapOutside: (value) {
                  _persistTextToBloc();
                },
                onEditingComplete: () {
                  _persistTextToBloc();

                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _persistTextToBloc();

                Navigator.pushNamed(context, '/screen');
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
    BlocProvider.of<Bloc1>(context).add(
      AddEvent(
        Model(
          id: DateTime.now().millisecondsSinceEpoch + Random().nextInt(9999999),
          title: controller.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
