import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

snackBar(String message, {ToastGravity? gravity}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colors.black,
    gravity: gravity,
  );
}
