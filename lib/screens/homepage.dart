import "package:awesome_notifications/awesome_notifications.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/models/db_model.dart";
import "package:flutter_application_1/widgets/todo_card.dart";
import "package:flutter_application_1/widgets/todo_list.dart";
import "package:sqflite/sqflite.dart";
import "../models/todolist_model.dart";
import "../widgets/user_input.dart";
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  @override
  void initState(){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }
  var db = DatabaseConnect();
  void addItem(Todo todo) async{
    await db.insertTodo(todo);
    setState(() {
      
    });
  }
  void deleteItem(Todo todo) async{
    await db.deleteTodo(todo);
    var title = todo.title;
    AwesomeNotifications().createNotification(content: NotificationContent(id: 10, channelKey: "basic_channel", title: "Task deleted.", body: "Your task with the name '$title' has been deleted."));
    
    setState(() {
      
    });
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 170, 224),
        appBar: AppBar(
          title: const Text("Simple todo app"),
        ),
        body: Column(
          children: [
            Todolist(insertFunction: addItem, deleteFunction: deleteItem),
            UserInput(insertFunction: addItem),
          ],
        )
      
    );
  }
}