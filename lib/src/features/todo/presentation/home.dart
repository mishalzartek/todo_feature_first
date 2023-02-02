import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/common.dart';
import 'package:todo/core/palette.dart';
import 'package:todo/src/features/todo/controller/todo.dart';
import 'package:todo/src/features/todo/presentation/widgets/add_todo_popup.dart';
import 'package:todo/src/features/todo/presentation/widgets/greetings.dart';
import 'package:todo/src/features/todo/presentation/widgets/todo_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context, listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Greetings(greetingText: 'Monday :)'),
          Consumer<TodoList>(
            builder: (context, value, child) => ListView.builder(
              shrinkWrap: true,
              itemCount: todoList.todos.length,
              itemBuilder: (context, index) {
                final todo = todoList.todos[index];
                return Dismissible(
                  key: const Key(''),
                  onDismissed: (direction) {
                    todoList.removeTodo(todo);
                    snackBar('Removed');
                  },
                  child: GestureDetector(
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>  AddTodo(edit: true, id: todo.id,),
                      );
                    },
                    child: TodoTile(
                      day: 'Monday',
                      todo: todo,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.buttonColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTodo(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
