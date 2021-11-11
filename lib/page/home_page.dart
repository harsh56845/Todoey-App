import 'package:flutter/material.dart';
import 'package:todey_final/main.dart';
import 'package:todey_final/widgets/add_todo_dailoge.dart';
import 'package:todey_final/widgets/completed_list_widget.dart';
import 'package:todey_final/widgets/todo_list_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
     const  TodoListWidget(),
     const  CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(MyApp.title)),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
                selectedIndex = index;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fact_check_outlined,
                  size: 28,
                ),
                label: 'Todos'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.done,
                  size: 28,
                ),
                label: 'Completed'),
          ]),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.add),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const AddTodoDialogeWidget()),
      ),
    );
  }
}
