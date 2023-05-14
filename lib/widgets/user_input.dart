import "package:flutter/material.dart";

import "../models/todolist_model.dart";
class UserInput extends StatefulWidget {
  final Function insertFunction;
  var textController = TextEditingController();
  UserInput({required this.insertFunction, super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: widget.textController,
              decoration: const InputDecoration(
                hintText: "add new todo",
                border: InputBorder.none,
              )
            ),
           )),
           const SizedBox(width: 10),
           GestureDetector(
            
            onTap: (){
              var myTodo = Todo(title: widget.textController.text, creationDate: DateTime.now(), isChecked: false, priority: 1);
              widget.insertFunction(myTodo);
            },
            child: Container(
              color: Colors.red,
              
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text("Add", style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
           )
        ],
      )
     
    );
    
  }
}