import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/main.dart';

import '../model/item.dart';

class MyAppState extends ChangeNotifier {
  List<Item> cartItem = [];

  updateCart(Item item) {
    cartItem.add(item);
    notifyListeners();
  }

  static MyAppState of(BuildContext context, {bool listen = true}) =>
      Provider.of<MyAppState>(context, listen: listen);
}
