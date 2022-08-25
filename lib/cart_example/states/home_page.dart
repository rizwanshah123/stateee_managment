import 'package:flutter/material.dart';
import 'package:state_managment/cart_example/item.dart';
import 'package:state_managment/cart_example/states/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = MyInheritedWidget.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shoping App'),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Cart())),
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        body: ListView.builder(
            itemCount: ItemList().item.length,
            itemBuilder: ((context, index) {
              var itemm = ItemList();
              return ListTile(
                title: Text(itemm.item[index].name),
                subtitle: Text(itemm.item[index].amount.toString()),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      appState.itemList.add(Item(
                        name: itemm.item[index].name.toString(),
                        amount: itemm.item[index].amount,
                      ));

                      appState.total += 1;
                    }),
              );
            })));
  }
}

class ItemList {
  List<Item> item = [
    Item(name: 'vagitable', amount: 21),
    Item(name: 'fruit', amount: 41),
    Item(name: 'mango', amount: 81),
    Item(name: 'apple', amount: 271),
    Item(name: 'banana', amount: 214),
    Item(name: 'chicken', amount: 213),
    Item(name: 'bread', amount: 211),
  ];
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = MyInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Item'),
      ),
      body: ListView.builder(
          itemCount: appState.itemList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(appState.itemList[index].name),
              subtitle: Text(appState.itemList[index].amount.toString()),
            );
          }),
    );
  }
}
