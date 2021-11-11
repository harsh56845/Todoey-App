import 'package:flutter/cupertino.dart';
import 'package:todey_final/models/todo.dart';

class TodosProvider extends ChangeNotifier {
   final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Simple Todey App',
      description: '''-> You can write your Daily Task , Notes or etc.. Here
-> You can also delete your task
-> You can also mark your task completed or Viseversa
-> Created by Harsh Vardhan''', id: '',
    ),
  ];

void addTodo(Todo todo){
 _todos.add(todo);
 notifyListeners();
}

void removeTodo(Todo todo){
 _todos.remove(todo);
 notifyListeners();
}

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  } 

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

    List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
}