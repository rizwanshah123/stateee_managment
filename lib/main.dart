import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final AppStateWidgetState state;

  const MyInheritedWidget(
      {super.key, required super.child, required this.state});

  static AppStateWidgetState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  String user = 'Rizwan shah';

  updateUser(String newUser) => setState(() => user = newUser);
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(state: this, child: widget.child);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
 final  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appState = MyInheritedWidget.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('State Managment')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'enter namne '),
              ),
            ),
            Text(
              appState!.user,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                  onPressed: () {
                    appState.updateUser(_controller.text.toString());
                    _controller.clear();
                  },
                  child: Text('update')),
            )
          ],
        ));
  }
}
