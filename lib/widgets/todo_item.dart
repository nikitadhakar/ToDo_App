import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoo;
  final OnToDoChanged;
  final OnDeleteItem;
   ToDoItem({Key? key, required this.todoo, required this.OnDeleteItem, required this.OnToDoChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
    child:
    ListTile(
    onTap: (){
      OnToDoChanged(todoo);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
        ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
         tileColor: Colors.white,
         leading: Icon(
             todoo.isDone? Icons.check_box :  Icons.check_box_outline_blank,
             color: tdBlue),
          title: Text(todoo.todotext!,style: TextStyle(
         fontSize: 16,
         color: tdBlack,
          decoration: todoo.isDone? TextDecoration.lineThrough : null,
      ),
          ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: tdRed,
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          color: Colors.white,
          iconSize: 10,
          icon: Icon(Icons.delete),
          
          onPressed: (){
            OnDeleteItem(todoo.id);
          },
        ),
      ),
    ),
    );
  }
}
