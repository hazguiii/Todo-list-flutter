import "package:flutter/material.dart";
import "package:flutter_application_1/models/db_model.dart";
import "package:flutter_application_1/widgets/todo_card.dart";
class Todolist extends StatefulWidget {
  const Todolist({required this.insertFunction, required this.deleteFunction,super.key});
  final Function insertFunction;
  final Function deleteFunction;
  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  var db = DatabaseConnect();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(future: db.getTodo(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        var data = snapshot.data;
        var datalength = data!.length;
        return datalength == 0?
        const Center(child: Text("no data found"),): ListView.builder(itemCount: datalength,itemBuilder: (context,i) => Todocard(id: data[i].id, title: data[i].title, creationDate: data[i].creationDate, isChecked: data[i].isChecked,priority: data[i].priority, deleteFunction: widget.deleteFunction, insertFunction: widget.insertFunction),);
      }, ),
    );
  }
}