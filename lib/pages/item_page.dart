import 'package:flutter/material.dart';
import 'package:practice5/global/lists.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.itemIndex});

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(items[itemIndex].title)),
      body: Center(
        child: Column(
          children: [
            Image.network(
              items[itemIndex].imageLink,
              height: 300,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26))),
              padding: const EdgeInsets.only(top: 25),
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            ),
            Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(items[itemIndex].description))),
          ],
        ),
      ),
    );
  }
}
