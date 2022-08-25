import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:state_managment/todo_app/state/app_state.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({
    Key? key,
  }) : super(key: key);
  static const String id = "/todo-page";
  @override
  Widget build(BuildContext context) {
    var appState = MyInheritWidget.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 20,
          title: const Text(
            "Todos App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          elevation: 70,
        ),
        body: appState.todoList.isEmpty
            ? Center(child: Lottie.asset('assets/no-todo.json'))
            : ListView.builder(
                itemCount: appState.todoList.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(appState.todoList[index].task),
                          trailing: Text(appState.todoList[index].isCompleted),
                        ),
                      ),
                    ],
                  );
                })));
  }
}
