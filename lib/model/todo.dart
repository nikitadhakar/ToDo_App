import 'package:flutter/cupertino.dart';

class ToDo{
  String? id;
  String? todotext;
  bool isDone;

  ToDo({
    required this.id,
    required this.todotext,
    this.isDone = false,
});
  static List<ToDo>todolist(){
    return[
      ToDo(id: '01', todotext: "Morning Exercise", isDone: true),
      ToDo(id: '02', todotext: "Buy Groceries", isDone: true),
      ToDo(id: '03', todotext: "Team Meeting"),
      ToDo(id: '04', todotext: "Check Images"),
      ToDo(id: '05', todotext: "Create Flutter project"),
      ToDo(id: '06', todotext: "Download the Course"),
    ];
  }
}
