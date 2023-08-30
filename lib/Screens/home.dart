import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_application/data/database.dart';
import 'package:todo_application/utils/actionDialog.dart';
import 'package:todo_application/utils/todo_tiles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //reference the Hive Box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  void intiState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //Text Controller
  final _controller = TextEditingController();

  // check box status change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.Todolist[index][1] = !db.Todolist[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.Todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          save: saveNewTask,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //Delete Task

  void deleteTask(int index) {
    setState(() {
      db.Todolist.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//    App bar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 5, 5),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                child: Image.asset(
                    'assets/images/png-transparent-to-do-list-text-lettering-thumbnail.png'),
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                child: Image.asset('assets/images/angry.jpg'),
              ),
            )
          ],
        ),
      ),

//    Floating Button

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 65, 216, 70),
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

//    Body Part:

      body: Container(
        color: const Color.fromARGB(255, 10, 10, 10),
        child: Column(
          children: [
            searchbar(),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 60,
                width: 350,
                margin: const EdgeInsets.only(left: 10),
                // color: Colors.red,
                child: const Text(
                  "All ToDos",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: db.Todolist.length,
                itemBuilder: (BuildContext context, int index) {
                  return todoTile(
                    taskname: db.Todolist[index][0],
                    taskCompleted: db.Todolist[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchbar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        cursorHeight: 28,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 28,
              color: Colors.white,
            ),
            border: InputBorder.none,
            hintText: 'search',
            hintStyle: TextStyle(color: Color.fromARGB(255, 225, 223, 223))),
      ),
    );
  }
}
