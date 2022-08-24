import 'dart:io';

import 'package:flutter/material.dart';
import 'user.dart';

class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
   User? user;
  updateUser(String user, File file) => setState(() {
        this.user = User(name: user, file: file);
      });
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(state: this, child: widget.child);
  }
}

class MyInheritedWidget extends InheritedWidget {
  final AppStateWidgetState state;

  const MyInheritedWidget(
      {super.key, required super.child, required this.state});

  static AppStateWidgetState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
