import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_bloc.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/bloc/test_event.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'data',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 64,
              ),
              ElevatedButton(
                onPressed: () {
                  _deleteData();

                  Navigator.pushNamed(context, '/screen2');
                },
                child: const Text('next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteData() {
    BlocProvider.of<TestBloc>(context).add(DeletedEvent());
  }
}
