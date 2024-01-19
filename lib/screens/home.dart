



import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
    Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todolist();
  List<ToDo> foundToDo = [];
   final todoController = TextEditingController();

   @override
  void initState() {
     foundToDo = todosList;
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar:_buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
               searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom: 20),

                        child: Text('To Do List',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                      for ( ToDo todo in foundToDo.reversed
                      )
                      ToDoItem(
                        todoo: todo,
                      OnToDoChanged: _handleToDoChange,
                        OnDeleteItem: _deleteToDoItem,
                      ),
                    ],
                  ),
                )
              ],
            ),
              ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 5),
                      margin: EdgeInsets.only(
                        bottom: 20,
                      right: 20,
                      left: 20,
                        ),
                      decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const
                      [BoxShadow(
                        color: Colors.grey,
                      offset: Offset(0.0,0.0),
                      blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          hintText:'Add new to do item',
                          border: InputBorder.none,
                        ),
                      ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('+',style: TextStyle(
                      fontSize: 40,
                    ),
                    ),
                    onPressed: (){
                     addToDoItem(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.deepPurple,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),

                ),
              ],
            ),
          )
        ],
      ),

    );
  }

  void _handleToDoChange(ToDo todo ){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });

  }

  void addToDoItem(String todo){
    setState(() {
      todosList.add(ToDo(id:DateTime.now().microsecondsSinceEpoch.toString(), todotext: todo));
    });
   todoController.clear();

  }


  void runFilter(String enteredKeyword){
     List<ToDo> results = [];
     if (enteredKeyword.isEmpty){
       results = todosList;
     }
     else{
       results = todosList.where((item) => item.todotext!
           .toLowerCase()
           .contains(enteredKeyword
           .toLowerCase()))
           .toList();
     }
      setState(() {
        foundToDo = results;
      });
  }

  Widget searchBox() {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      onChanged: (value) => runFilter(value),
    decoration: InputDecoration(
    contentPadding: EdgeInsets.all(0),
    prefixIcon: Icon(Icons.search,
    color: tdBlack,
    size: 20),
    prefixIconConstraints: BoxConstraints(
    maxHeight: 20,
    minWidth: 25),
    border: InputBorder.none,
    hintText: 'search',
    hintStyle: TextStyle(color: tdGrey),
    ),
    ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu,color: tdBlack,size: 30,
            ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/img.png'),
            ),
          )
        ],
      ),
    );
  }
}
