import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/common.dart';
import 'package:todo/core/palette.dart';
import 'package:todo/src/features/todo/controller/todo.dart';
import 'package:todo/src/features/todo/model/todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({
    super.key,
    this.edit = false,
    this.id,
  });

  final bool edit;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context, listen: false);
    final TextEditingController todoController = TextEditingController();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text(
        edit ? 'Edit Task' : 'Add Task',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Palette.taskTextFieldColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: todoController,
                cursorColor: Palette.buttonColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Row(
                    children: const [
                      SizedBox(width: 10),
                      Text(
                        'ToDo',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            )),
        GestureDetector(
          onTap: () {
            if (edit) {
              // todoList.updateTodoList(
              //   Todo(
              //     id: DateTime.now().millisecondsSinceEpoch.toString(),
              //     title: todoController.text,
              //     day: 'day',
              //     time: 'time',
              //   ),
              //   id!,
              // );
            } else {
              todoList.addTodo(
                Todo(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: todoController.text,
                  day: 'day',
                  time: 'time',
                ),
              );
            }

            Navigator.pop(context);
            edit ? snackBar('Updated') : snackBar('Added');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Palette.buttonColor),
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
