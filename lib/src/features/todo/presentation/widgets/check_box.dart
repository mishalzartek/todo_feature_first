import 'package:flutter/material.dart';
import 'package:todo/core/palette.dart';
import 'package:todo/src/features/todo/model/todo.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.todo,
    this.onChanged,
  }) : super(key: key);

  final Todo todo;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      splashRadius: 15,
      checkColor: Palette.buttonColor,
      fillColor: MaterialStateProperty.all<Color>(Palette.buttonColor),
      value: todo.isDone ?? false,
      onChanged: onChanged,
    );
  }
}
