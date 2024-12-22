// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hydrated_bloc/todo/bloc/event.dart';
import 'package:flutter_hydrated_bloc/todo/bloc/todo_bloc.dart';
import 'package:flutter_hydrated_bloc/todo/data/model/model.dart';

class TodoAddScreen extends StatefulWidget {
  final TodoModel? task;

  const TodoAddScreen({super.key, this.task});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  TextEditingController? titleText;
  TextEditingController? description;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleText = TextEditingController(text: widget.task?.title ?? '');
    description = TextEditingController(text: widget.task?.description ?? '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: titleText,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Title required";
                }
                if (value.length < 3) {
                  return "Should have minimum 3 characters";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Title",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: description,
              maxLength: 100,
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return "description required";
                }
                if (value.length < 10) {
                  return "Required description minimum length is 10 characters";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Description",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.black)),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<TodoBloc>(context)
                          .add(TodoAdd(TodoModel.fromJson({
                        'id': DateTime.now().millisecondsSinceEpoch +
                            Random().nextInt(9999999),
                        'title': titleText?.text,
                        'description': description?.text,
                        'is_completed': false,
                        'created_at': DateTime.now().toUtc().toIso8601String(),
                        'updated_at': DateTime.now().toUtc().toIso8601String()
                      })));
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.green,
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
