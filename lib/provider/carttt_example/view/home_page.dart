import 'package:provider/provider.dart';
import 'package:state_managment/provider/carttt_example/state/my_app_state.dart';

import '../model/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                leading: Text(itemm.item[index].id.toString()),
                title: Text(itemm.item[index].name),
                subtitle: Text(itemm.item[index].amount.toString()),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      Provider.of<MyAppState>(context, listen: false)
                          .updateCart(Item(
                              id: itemm.item[index].id,
                              amount: itemm.item[index].amount,
                              name: itemm.item[index].name));
                    }),
              );
            })));
  }
}

class ItemList {
  List<Item> item = [
    Item(name: 'vagitable', amount: 21, id: 1),
    Item(name: 'fruit', amount: 41, id: 2),
    Item(name: 'mango', amount: 81, id: 3),
    Item(name: 'apple', amount: 271, id: 4),
    Item(name: 'banana', amount: 214, id: 5),
    Item(name: 'chicken', amount: 213, id: 6),
    Item(name: 'bread', amount: 211, id: 7),
  ];
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Item'),
      ),
      body: Consumer<MyAppState>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
              itemCount: Provider.of<MyAppState>(context).cartItem.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(Provider.of<MyAppState>(context)
                      .cartItem[index]
                      .id
                      .toString()),
                  title: Text(

                      Provider.of<MyAppState>(context).cartItem[index].name),
                  subtitle: Text(Provider.of<MyAppState>(context)
                      .cartItem[index]
                      .amount
                      .toString()),
                );
              });
        },
      ),
    );
  }
}
