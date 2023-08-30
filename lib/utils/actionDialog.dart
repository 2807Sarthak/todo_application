
import 'package:flutter/material.dart';
import 'package:todo_application/utils/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;

   DialogBox({super.key, required this.controller, required this.save,required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 124, 124, 124),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            // Textfield
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Add a Task!',
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Save Button
                myButtons(text: 'Save', onPressed: save),

                //Cancel Button
                myButtons(text: 'Cancel', onPressed: cancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
