// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: Obx(() => ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return ListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () => todoController.toggleDone(todo.id)),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => todoController.removeTodo(todo.id)),
                ],
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => AddTodoScreen());
        },
      ),
    );
  }
}
