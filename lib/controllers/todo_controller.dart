import 'package:get/get.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void removeTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  void toggleDone(int id) {
    var todo = todos.firstWhere((todo) => todo.id == id);
    todo.isDone = !todo.isDone;
    todos.refresh(); // updates UI
  }
}
