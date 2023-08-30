import 'package:flutter/material.dart';
import 'package:todo3/mytodo.dart';
import 'package:todo3/todo_object.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => TodoAppState();
}

class TodoAppState extends State<TodoApp> {
  List<Todo> todos = [];
  int id = 0;

  void saveTodo(String work1, String work2, int id) {
    setState(() {
      final todo = Todo(work1: work1, work2: work2, id: id, isChecked: false);
      id++;
      todos.add(todo);
    });
  }

  void deleteTodo(int index) {
    setState(() {
      id--;
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: createList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTodo(
                id: id,
                createTodo: saveTodo,
              );
            },
          ),
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget createList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return MyTodo(todo: todo, onDelete: deleteTodo);
        },
      ),
    );
  }
}
