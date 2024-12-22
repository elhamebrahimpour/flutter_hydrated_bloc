import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hydrated_bloc/todo/bloc/state.dart';
import 'package:flutter_hydrated_bloc/todo/bloc/todo_bloc.dart';
import 'package:flutter_hydrated_bloc/todo/data/model/model.dart';
import 'package:flutter_hydrated_bloc/todo/views/add_todo_screen.dart';
import 'package:flutter_hydrated_bloc/todo/widgets/empty_list.dart';
import 'package:flutter_hydrated_bloc/todo/widgets/task_view_builder.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoModel? tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Screen Example"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    content: TodoAddScreen(),
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoStateLoaded) {
          if (state.task.isEmpty) {
            return const EmptyListWidget();
          } else {
            tasks = state.task.first;

            return Column(
              children: [
                Expanded(
                  child: TaskViewBuilder(tasks: state.task),
                ),
              ],
            );
          }
        }

        return const EmptyListWidget();
      },
    );
  }
}
