import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/count_app_provider.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('build whole widget');
    var count = Provider.of<CountState>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count App'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(child: Consumer<CountState>(
          builder: (BuildContext context, value, Widget? child) {
            return Text(count.get().toString());
          },
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {count.increment()},
        child: const Icon(Icons.add),
      ),
    );
  }
}
