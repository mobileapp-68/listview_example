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

class TodoData {
  TodoData({
    required this.title,
    required this.text,
    this.color = Colors.amber,
  });
  final String title;
  final String text;
  final Color color;
}

class TodoDisplay extends StatelessWidget {
  const TodoDisplay({super.key, required this.todo});
  final TodoData todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double
            .infinity, // Make container take full width. This is not required for ListView/GridView because they handle width automatically.
        // width: 200, // Fixed width for horizontal ListView
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: .circular(12),
          color: todo.color,
        ),
        child: Column(
          children: [Text(todo.title), Text(todo.text)],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final List<TodoData> todos = [
    TodoData(title: "Eat", text: "Pizza", color: Colors.red),
    TodoData(title: "Sleep", text: "Tight", color: Colors.blue),
    TodoData(title: "Code", text: "Flutter", color: Colors.green),
    TodoData(title: "Read", text: "Books", color: Colors.purple),
    TodoData(title: "Exercise", text: "Run 5km", color: Colors.orange),
    TodoData(title: "Meditate", text: "15 minutes", color: Colors.teal),
    TodoData(title: "Cook", text: "Healthy meal", color: Colors.pink),
    TodoData(title: "Clean", text: "My room", color: Colors.brown),
    TodoData(title: "Shop", text: "Groceries", color: Colors.cyan),
    TodoData(title: "Call", text: "Family", color: Colors.indigo),
    TodoData(title: "Plan", text: "Next week", color: Colors.lime),
    TodoData(title: "Relax", text: "Watch a movie", color: Colors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      // ? Using Column to display items vertically.  This will result in overflow if items exceed screen height.
      // body: Column(
      //   children: todos.map((todo) => TodoDisplay(todo: todo)).toList(),
      // ),

      // ? Using SingleChildScrollView to make Column scrollable
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: todos.map((todo) => TodoDisplay(todo: todo)).toList(),
      //   ),
      // ),

      // ? Using SingleChildScrollView to make Column scrollable
      // body: SizedBox(
      //   height: 300, // Fixed height to demonstrate scrolling
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: todos.map((todo) => TodoDisplay(todo: todo)).toList(),
      //     ),
      //   ),
      // ),

      // ? Using ListView to display items in a vertical list.  This is not the optimal way for large lists.
      // body: ListView(
      //   children: todos.map((todo) => TodoDisplay(todo: todo)).toList(),
      // ),

      // ? Using ListView.builder for better performance with large lists
      // body: ListView.builder(
      //   itemCount: todos.length,
      //   itemBuilder: (context, index) {
      //     return TodoDisplay(todo: todos[index]);
      //   },
      // ),

      // ! Nested ListView in SingleChildScrollView.  This will give error because ListView tries to be infinite in height. The height needs to be constrained.
      // body: SingleChildScrollView(
      //   child: ListView.builder(
      //     // We can uncomment the below two lines to fix the error. What this does is to make ListView take only the space it needs.  But this is not optimal for large lists.
      //     // Explanation: ShrinkWrap: true makes the ListView take only the space it needs.  NeverScrollableScrollPhysics disables scrolling for ListView, allowing SingleChildScrollView to handle scrolling.
      //     // shrinkWrap: true,
      //     // physics: NeverScrollableScrollPhysics(),
      //     itemCount: todos.length,
      //     itemBuilder: (context, index) {
      //       return TodoDisplay(todo: todos[index]);
      //     },
      //   ),
      // ),

      // ? To fix this error, we can wrap ListView in a SizedBox with fixed height
      // body: SingleChildScrollView(
      //   child: SizedBox(
      //     height: 400, // Fixed height to constrain ListView
      //     child: ListView.builder(
      //       itemCount: todos.length,
      //       itemBuilder: (context, index) {
      //         return TodoDisplay(todo: todos[index]);
      //       },
      //     ),
      //   ),
      // ),

      // ? Horizontal ListView
      // body: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: todos.length,
      //   itemBuilder: (context, index) {
      //     return TodoDisplay(todo: todos[index]);
      //   },
      // ),

      // ? Horizontal ListView with fixed height
      // body: SizedBox(
      //   height: 200, // Fixed height for horizontal ListView
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: todos.length,
      //     itemBuilder: (context, index) {
      //       return TodoDisplay(todo: todos[index]);
      //     },
      //   ),
      // ),

      // ? Horizontal and Vertical ListView combined using Column and Expanded
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: todos.length,
      //         itemBuilder: (context, index) {
      //           return TodoDisplay(todo: todos[index]);
      //         },
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: todos.length,
      //         itemBuilder: (context, index) {
      //           return TodoDisplay(todo: todos[index]);
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      // ! Horizontal and Vertical ListView combined using Column and Expanded within SingleChildScrollView. This will give error because ListView tries to be infinite in height. The height needs to be constrained.
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // ? Horizontal and Vertical ListView combined using Column and Expanded within SingleChildScrollView. This will give error because ListView tries to be infinite in height. The height needs to be constrained.
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 300, // Fixed height for horizontal ListView
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 400, // Fixed height for vertical ListView
      //         child: ListView.builder(
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 300, // Fixed height for horizontal ListView
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // ? Using GridView to display items in a grid format
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   children: todos.map((todo) => TodoDisplay(todo: todo)).toList(),
      // ),

      // ? Using GridView.builder for better performance with large lists
      // body: GridView.builder(
      //   // scrollDirection: Axis.horizontal,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //   ),
      //   itemCount: todos.length,
      //   itemBuilder: (context, index) {
      //     return TodoDisplay(todo: todos[index]);
      //   },
      // ),

      // ?Combining ListView and GridView using Column and Expanded
      // body: SingleChildScrollView(
      //   physics: AlwaysScrollableScrollPhysics(),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 200, // Fixed height for horizontal ListView
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 400,
      //         child: ListView.builder(
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 400, // Fixed height for GridView
      //         child: GridView.builder(
      //           scrollDirection: Axis.horizontal,
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //           ),
      //           itemCount: todos.length,
      //           itemBuilder: (context, index) {
      //             return TodoDisplay(todo: todos[index]);
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
