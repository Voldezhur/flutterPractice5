import 'package:flutter/material.dart';
import 'package:practice5/components/item_card.dart';
import 'package:practice5/global/lists.dart';
import 'package:practice5/pages/add_book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToAddNote(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddBookPage()),
    );

    if (result != null) {
      setState(() {
        items.add(result);
      });
    }
  }

  void _toggleFavourite(int index) {
    setState(() {
      items[index].favourite = !items[index].favourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главная"),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                "В библиотеке пусто 🤷\nПопробуйте добавить книгу",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (MediaQuery.of(context).size.width) /
                    (MediaQuery.of(context).size.height / 1.2),
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  itemIndex: index,
                  toggleFavourite: _toggleFavourite,
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddNote(context),
        tooltip: 'Добавить книгу',
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
