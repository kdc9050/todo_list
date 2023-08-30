import 'package:flutter/material.dart';
import 'package:todo3/todo_object.dart';

class MyTodo extends StatefulWidget {
  const MyTodo({Key? key, required this.todo, required this.onDelete})
      : super(key: key);

  final Todo todo;
  final void Function(int index) onDelete;

  @override
  MyTodoState createState() => MyTodoState();
}

class MyTodoState extends State<MyTodo> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Column(
                children: [
                  Text(
                    widget.todo.work1,
                    style: TextStyle(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.todo.work2,
                    style: TextStyle(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              widget.onDelete(widget.todo.id);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class AddTodo extends StatefulWidget {
  final id;
  const AddTodo({Key? key, required this.createTodo, required this.id})
      : super(key: key);

  final void Function(String work1, String work2, int id) createTodo;

  @override
  State<AddTodo> createState() => AddTodoState();
}

class AddTodoState extends State<AddTodo> {
  late TextEditingController _titleCon = TextEditingController();
  late TextEditingController _detailCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleCon = TextEditingController();
    _detailCon = TextEditingController();
  }

  @override
  void dispose() {
    _titleCon.dispose();
    _detailCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('추가'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleCon,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(hintText: "할일1"),
          ),
          TextField(
            controller: _detailCon,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(hintText: "할일2"),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            widget.createTodo(_titleCon.text, _detailCon.text, widget.id);
            Navigator.pop(context);
          },
          child: const Text('저장'),
        ),
      ],
    );
  }
}

class ChangeTodo extends StatefulWidget {
  final id;
  const ChangeTodo({Key? key, required this.createTodo, this.id})
      : super(key: key);

  final void Function(String work1, String work2, int id) createTodo;

  @override
  State<ChangeTodo> createState() => ChangeTodoState();
}

class ChangeTodoState extends State<ChangeTodo> {
  late TextEditingController _titleCon = TextEditingController();
  late TextEditingController _detailCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleCon = TextEditingController();
    _detailCon = TextEditingController();
  }

  @override
  void dispose() {
    _titleCon.dispose();
    _detailCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('수정'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleCon,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(hintText: "할일1"),
          ),
          TextField(
            controller: _detailCon,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(hintText: "할일2"),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            widget.createTodo(_titleCon.text, _detailCon.text, widget.id);
            Navigator.pop(context);
          },
          child: const Text('저장'),
        ),
      ],
    );
  }
}
