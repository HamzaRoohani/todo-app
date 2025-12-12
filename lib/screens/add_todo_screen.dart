// lib/screens/add_todo_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../models/todo.dart';

class AddTodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Todo Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (textController.text.isNotEmpty) {
                    todoController.addTodo(
                      Todo(id: DateTime.now().millisecondsSinceEpoch, title: textController.text),
                    );
                    Get.back();
                  }
                },
                child: Text('Add Todo')),
          ],
        ),
      ),
    );
  }
}
