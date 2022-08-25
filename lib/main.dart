import 'package:flutter/material.dart';
import 'package:state_managment/todo_app/screen/home_page_todo.dart';
import 'package:state_managment/todo_app/state/app_state.dart';
import 'cart_example/states/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TodoApp(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoDataInput(),
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   Home({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var appState = MyInheritedWidget.of(context);
//     return Scaffold(
//         appBar: AppBar(title: const Text('State Managment')),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(50.0),
//               child: TextFormField(
//                 controller: _controller,
//                 decoration: const InputDecoration(hintText: 'enter namne '),
//               ),
//             ),
//             if (appState!.user != null)
//               Text(
//                 appState.user!.name,
//                 style: Theme.of(context).textTheme.displayMedium,
//               ),
//             Padding(
//               padding: const EdgeInsets.all(50.0),
//               child: ElevatedButton(
//                   onPressed: () {
//                     imagePicker(context);
//                   },
//                   child: const Text('update')),
//             ),
//             if (appState.user != null)
//               Image.file(
//                 appState.user!.file,
//                 width: 300,
//                 height: 200,
//               ),
//           ],
//         ));
//   }

//   imagePicker(BuildContext context) async {
//     final ImagePicker imagePicker = ImagePicker();
//     final XFile? image =
//         await imagePicker.pickImage(source: ImageSource.gallery);
//     var myAppState = MyInheritedWidget.of(context);
//     myAppState!.updateUser( _controller.text.toString(), File(image!.path));
//     _controller.clear();
//   }
// }
