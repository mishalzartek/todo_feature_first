import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/features/todo/controller/todo.dart';
import 'package:todo/src/features/todo/model/todo.dart';
import 'package:todo/src/features/todo/presentation/widgets/check_box.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.day,
    required this.todo,
  });

  final String day;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 0.0),
                blurRadius: 18.0,
                spreadRadius: -15,
              ), //BoxShadow
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Row(
          children: [
            Expanded(
              child: Consumer<TodoList>(
                builder: (context, value, child) => ListTile(
                  leading: CustomCheckBox(
                    todo: todo,
                    onChanged: (newValue) {
                      value.updateTodo(todo);
                    },
                  ),
                  title:  Text.rich(
                  TextSpan(text: todo.title),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Helvatica_lite',
                    decoration: todo.isDone!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: todo.isDone!
                        ?  const Color.fromARGB(255, 128, 129, 141)
                        :  Colors.black,
                  ),
                ),
                  subtitle: Text('${todo.day} | ${todo.time}',
                  style: TextStyle(
                     color: todo.isDone!
                        ?  const Color.fromARGB(255, 150, 151, 163)
                        :  Colors.black,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
