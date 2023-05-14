import 'package:flutter/foundation.dart';

class Todo extends ChangeNotifier{
  int? id;
  String title;
  DateTime creationDate;
  bool isChecked;
  int priority ;
  Todo(
    {
      this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked,
      required this.priority
    }
  );
  Map<String,dynamic> toMap(){
    notifyListeners();
    return{
      "id" : id,
      "title" : title,
      "creationDate" : creationDate.toString(),
      "isChecked" : isChecked? 1 : 0,
      "priority" : priority
    };
  }
  @override
  String toString(){
    return "Todo(id: $id, title : $title, creationDate: $creationDate, isChecked : $isChecked, priority: $priority)"; 
  }
}