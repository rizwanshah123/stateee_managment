import 'package:flutter/widgets.dart';

import '../item.dart';

class MyInheritedWidget extends InheritedWidget {
  final AppStateWidget state;

  const MyInheritedWidget(
      {super.key, required super.child, required this.state});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static AppStateWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.state;
}

class AppState extends StatefulWidget {
  Widget child;
  AppState({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppStateWidget();
}

class AppStateWidget extends State<AppState> {
  Item? item;
  int total = 0;
  List<Item> itemList=[];
  updateCart(Item item) => setState(() {
    this.item = null;
        this.item = item;
        
      });

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(state: this, child: widget.child);
  }
}
