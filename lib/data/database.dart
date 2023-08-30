import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List Todolist = [];
  //reference our Hive Box
  final _myBox = Hive.box('myBox');

  // Initial Database
  void createInitialData() {
    Todolist = [
      ["This is a Dummy Task", false],
    ];
  }

  // Loading Existing Database
  void loadData() {
    Todolist = _myBox.get("TODOLIST");
  }

  // Update Database
  void updateDatabase() {
    _myBox.put("TODOLIST", Todolist);
  }
}
