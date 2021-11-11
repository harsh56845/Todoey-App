
import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
   final String title;
   final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({Key? key, required this.onChangedTitle, required this.onChangedDescription, required this.onSavedTodo, required this.title, required this.description}) : super(key: key);


  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        const SizedBox(height: 8,),
        buildDescription(),
        const SizedBox(height: 20,),
        buildButton()
    
    ],),
  );

  Widget buildTitle()=> TextFormField(
    initialValue: title,
    onChanged: onChangedTitle,
    maxLines: 1,
    validator: (title){
      if(title!.isEmpty)
      {
        return 'The title cannot be empty';
      }
      else{ return null;}
    },
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title'
    ),
  );

  Widget buildDescription()=> TextFormField(
    initialValue: description,
    onChanged: onChangedDescription,
  maxLines: 3,
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description'
    ),
  );

Widget buildButton()=>SingleChildScrollView(
  child:   SizedBox(
  
    width: double.infinity,
  
    child:   ElevatedButton(
  
    
  
      style: ElevatedButton.styleFrom(
  
    
  
        primary: Colors.black,
  
    
  
      ),
  
    
  
      onPressed: onSavedTodo, child: const Text("Save",style: TextStyle(color: Colors.white),)),
  
  ),
);
  

  }
