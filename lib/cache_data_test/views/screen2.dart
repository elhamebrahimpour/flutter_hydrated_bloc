import 'package:flutter/material.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/widgets/custom_button.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
                'deleted state',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 64,
              ),
              CustomButton(
                title: 'back first page',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
