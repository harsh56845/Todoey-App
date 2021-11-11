import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey_final/models/todo.dart';
import 'package:todey_final/provider/todos.dart';

import 'todo_form_widget.dart';

class AddTodoDialogeWidget extends StatefulWidget {
  const AddTodoDialogeWidget({ Key? key }) : super(key: key);

  @override
  _AddTodoDialogeWidgetState createState() => _AddTodoDialogeWidgetState();
}

class _AddTodoDialogeWidgetState extends State<AddTodoDialogeWidget> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(content: Form(
    key: _formkey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Add Todos',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        const SizedBox(height: 8,),
        TodoFormWidget(
          onChangedTitle :(title) => setState(()=>this.title = title),
          onChangedDescription :(description) => setState(()=>this.description = description),
          onSavedTodo: addTodo, title: '', description: '',
          )
      ],
    ),
  ),);

  void addTodo(){
    final isVaild =_formkey.currentState!.validate();

    if(!isVaild){
      return;
    }
    else
    {
      final todo =Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now());

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    
    }
  }
}