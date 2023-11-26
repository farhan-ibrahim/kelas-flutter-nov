import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  TextEditingController todoController = TextEditingController();
  List todos = [
    "Beli barang", // 1
    "Kemas rumah", // 2
  ];

  List done = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        backgroundColor: Colors.orange[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What to do?",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                /// Tambah new todo ke dalam list
                setState(() {
                  todos.insert(0, todoController.text);
                });
              },
              child: const Text("Add"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                  children: todos
                      .map(
                        (todo) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(todo),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  /// Buang todo dari dalam list
                                  setState(() {
                                    todos.remove(todo);
                                    done.add(todo);
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
