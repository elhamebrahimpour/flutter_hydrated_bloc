import 'package:flutter/material.dart';

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
      body: const SafeArea(
        child: Center(
          child: Text(
            'data',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
