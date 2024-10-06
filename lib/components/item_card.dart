import 'package:flutter/material.dart';
import 'package:practice5/global/lists.dart';
import 'package:practice5/pages/item_page.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.itemIndex,
    required this.toggleFavourite,
    required this.itemList,
    required this.refresh,
  });

  final int itemIndex; // Проп для названия заметки
  final Function toggleFavourite;
  final List itemList;
  final Function refresh;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  void _goToItemPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ItemPage(
              itemIndex: items.indexWhere(
                  (item) => item.id == widget.itemList[widget.itemIndex].id))),
    );

    if (result == true) {
      setState(() {
        items.removeAt(items.indexWhere(
            (item) => item.id == widget.itemList[widget.itemIndex].id));
        // Обновляем список любимых книг
        favourites = items.where((item) => item.favourite == true).toList();
        widget.refresh();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        // Виджет для того, чтобы весь child стал кликабельным
        child: GestureDetector(
          onTap: () => _goToItemPage(context),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).primaryColor),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 2))),
                  padding: const EdgeInsets.all(6),
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: Image.network(
                    widget.itemList[widget.itemIndex].imageLink,
                    height: 100,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Кнопка перехода на другую страницу
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          widget.itemList[widget.itemIndex].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            widget.itemList[widget.itemIndex].author,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 11),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Страниц: ${widget.itemList[widget.itemIndex].pageCount}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.itemList[widget.itemIndex].favourite
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  onPressed: () => widget
                      .toggleFavourite(widget.itemList[widget.itemIndex].id),
                )
              ],
            )),
          ),
        ));
  }
}
