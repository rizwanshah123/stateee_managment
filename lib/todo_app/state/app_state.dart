import 'package:flutter/widgets.dart';

import '../Model/todo_model.dart';

class MyInheritWidget extends InheritedWidget {
  final TodoAppState state;

  const MyInheritWidget({super.key, required super.child, required this.state});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static TodoAppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritWidget>()!.state;
}

class TodoApp extends StatefulWidget {
  final Widget child;
  const TodoApp({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => TodoAppState();
}

class TodoAppState extends State<TodoApp> {
  Todo? todo;
  List<Todo> todoList = [];

  updateTodo(String todo, bool isCompleted) {
    todo.isEmpty
        ? " "
        : todoList.add(Todo(
            task: todo,
            isCompleted: isCompleted ? "Completed" : "Not Completed"));
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritWidget(state: this, child: widget.child);
  }
}
