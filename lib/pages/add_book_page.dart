import 'package:flutter/material.dart';
import 'package:practice5/global/lists.dart';
import 'package:practice5/models/item.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController authorController = TextEditingController();
final TextEditingController pageNumberController = TextEditingController();
final TextEditingController imageLinkController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();

class _AddBookPageState extends State<AddBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавить книгу"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration:
                    const InputDecoration(labelText: 'Введите название книги:'),
              ),
              TextField(
                controller: authorController,
                decoration:
                    const InputDecoration(labelText: 'Введите имя автора:'),
              ),
              TextField(
                controller: pageNumberController,
                decoration: const InputDecoration(
                    labelText: 'Введите количество страниц в книге:'),
              ),
              TextField(
                controller: imageLinkController,
                decoration: const InputDecoration(
                    labelText: 'Введите ссылку на обложку книги:'),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // imageLinkController.text.isNotEmpty
              //     ? Image.network(
              //         imageLinkController.text,
              //         height: 100,
              //       )
              //     : Image.network(
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlIZqZsvzHw2ueUfWq3DOk7gveV_n_LZxsVA&s",
              //         height: 100,
              //       ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Введите краткое описание книги:'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    String newTitle = titleController.text;
                    String newAuthor = authorController.text;
                    int newPageNum = int.parse(pageNumberController.text);
                    String newImageLink = imageLinkController.text;
                    String newDescription = descriptionController.text;

                    Item newBook = Item(items.length, newTitle, newAuthor,
                        newPageNum, newImageLink, newDescription, false);

                    if (newBook.title.isNotEmpty &&
                        newBook.author.isNotEmpty &&
                        newBook.imageLink.isNotEmpty &&
                        newBook.description.isNotEmpty) {
                      Navigator.pop(context, newBook);
                    }
                  },
                  child: const Text("Добавить книгу"))
            ],
          ),
        ),
      ),
    );
  }
}
