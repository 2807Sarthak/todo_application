import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class todoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  todoTile(
      {super.key,
      required this.taskname,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Slidable(
        endActionPane:ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(20),

            )
          ],
        ) ,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              //Checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.grey,),
      
              //Task Name
              Text(taskname,style: TextStyle(decoration: taskCompleted?TextDecoration.lineThrough: TextDecoration.none,fontSize: 15,fontWeight: FontWeight.w500),),
            ],
            
          ),
        ),
      ),
    );
  }
}
