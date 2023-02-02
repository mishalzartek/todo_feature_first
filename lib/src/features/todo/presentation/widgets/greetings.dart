import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/features/todo/controller/todo.dart';

class Greetings extends StatelessWidget {
  const Greetings({
    Key? key,
    required this.greetingText,
  }) : super(key: key);

  final String greetingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 100, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greetingText,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Consumer<TodoList>(
              builder: (context, value, child) {
                return Text(
                  value.todos.isEmpty
                      ? 'No Todos'
                      : value.completedTodo.length == value.todos.length
                          ? 'All Task Completed'
                          : '${value.completedTodo.length} of ${value.todos.length} Task Completed',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
