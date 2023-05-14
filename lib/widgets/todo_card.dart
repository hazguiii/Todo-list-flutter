import "package:flutter/material.dart";
import "package:flutter_application_1/screens/todo_edit.dart";

import "../models/todolist_model.dart";
class Todocard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  int priority;
  final Function insertFunction;
  final Function deleteFunction;
  Todocard({required this.id, required this.title, required this.creationDate, required this.isChecked,required this.priority, required this.deleteFunction, required this.insertFunction, Key? key}):super(key:key);

  @override
  State<Todocard> createState() => _TodocardState();
}
class _TodocardState extends State<Todocard> {
  
  
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(id: widget.id, title: widget.title, creationDate: widget.creationDate, isChecked: widget.isChecked, priority: widget.priority);
    return Card(
      child: Row(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Checkbox(value: false, onChanged:(bool? value) {
            setState(() {
              widget.isChecked = value!;
            });
            anotherTodo.isChecked = value!;
            widget.insertFunction(anotherTodo);
          }),
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
            
            SizedBox(height: 5),
            Text("Creation time: "+widget.creationDate.day.toString()+"/"+widget.creationDate.month.toString()+"/"+widget.creationDate.year.toString()+" "+widget.creationDate.hour.toString()+":"+widget.creationDate.minute.toString(), style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8F8F8F)
            ),),
            Text("Priority: " +widget.priority.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8F8F8F)

            )),
        ],)),
        IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TodoEdit(todo: anotherTodo )));}, icon: const Icon(Icons.edit)),
        IconButton(onPressed: (){widget.deleteFunction(anotherTodo);}, icon: const Icon(Icons.close))
      ]),
    );
  }
}