import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final List<TodoData> todos = [
    TodoData(title: "Eat", text: "Pizza"),
    TodoData(title: "Sleep", text: "Tight"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      // body: Center(
      //   child: ListView(
      //     children: [
      //       TodoDisplay(todo: todos[0]),
      //       TodoDisplay(todo: todos[1]),
      //     ],
      //   ),
      // ),
    );
  }
}

class TodoDisplay extends StatelessWidget {
  const TodoDisplay({super.key, required this.todo});
  final TodoData todo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(todo.title), Text(todo.text)],
    );
  }
}

class TodoData {
  TodoData({required this.title, required this.text});
  final String title;
  final String text;
}
