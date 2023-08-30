import 'package:flutter/material.dart';
import 'package:todo_application/Screens/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
//init Hive
  await Hive.initFlutter();

//open a box

  // ignore: unused_local_variable
  var myBox = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'To Do App', home: Home());
  }
}
