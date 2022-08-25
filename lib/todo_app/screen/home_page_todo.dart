import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:state_managment/todo_app/screen/todo_page.dart';
import 'package:state_managment/todo_app/state/app_state.dart';

class TodoDataInput extends StatelessWidget {
  TodoDataInput({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appState = MyInheritWidget.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 20,
        title: const Text(
          "Add To-Do",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        elevation: 70,
      ),
      body: Column(
        children: [
          Container(height: 250, child: Lottie.asset("assets/anim.json")),
          const Text(
            "Adding a new Task?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add Task Here"),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              child: const Text("Add Task"),
              onPressed: () {
                appState.updateTodo(_titleController.text, false);
                _titleController.clear();
                ;
              }),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TodosPage())),
                child: Text('View Task')),
          )
        ],
      ),
    );
  }
}
