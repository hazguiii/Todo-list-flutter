import "package:flutter/material.dart";
import "package:flutter_application_1/models/todolist_model.dart";
import "package:flutter_application_1/screens/homepage.dart";
import "package:flutter_application_1/widgets/todo_card.dart";

import "../models/db_model.dart";
class TodoEdit extends StatefulWidget {
  final Todo todo;
  const TodoEdit({required this.todo,super.key});

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final _formKey = GlobalKey<FormState>();
  var db = DatabaseConnect();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  
  void editItem(Todo todo) async{
    await db.editTodo(todo);
    setState(() {
      
    });
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      
      final priority = _priorityController.text;
      widget.todo.title = title;
      widget.todo.priority = int.parse(priority);
      editItem(widget.todo);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.todo.title;
    _priorityController.text = widget.todo.priority.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit todo task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'New task title',
                ),
              ),
              TextFormField(
                controller: _priorityController,
                decoration: InputDecoration(
                  labelText: 'New priority',
                ),
              ),
              SizedBox(height: 16.0),
              
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}