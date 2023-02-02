import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/src/features/todo/model/todo.dart';

class TodoList with ChangeNotifier {
  List<Todo> todos = [];
  List<Todo> completedTodo = [];

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  // void toggleTodo(Todo todo) {
  //   final index = todos.indexOf(todo);
  //   todos[index].isDone = !todos[index].isDone!;
  //   notifyListeners();
  // }

  updateTodo(Todo todo) {
    if (todo.isDone == null || todo.isDone == false) {
      todo.isDone = true;
      completedTodo.add(todo);
      notifyListeners();
    } else {
      todo.isDone = false;
      completedTodo.remove(todo);
      notifyListeners();
    }
  }

  // updateTodoList(Todo todo,String id){
  //    final index = todos.indexOf(todo);
  // }
}
