import "package:awesome_notifications/awesome_notifications.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/screens/signin.dart";
import "./models/db_model.dart";
import "./models/todolist_model.dart";
import "./screens/homepage.dart";
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); 
  AwesomeNotifications().initialize(null, [NotificationChannel(channelKey: "basic_channel", channelName: "channelName", channelDescription: "channelDescription")],debug: true);
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);
  
  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      home: SignInScreen(),
    ); 
  }
}