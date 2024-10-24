import 'package:flutter/material.dart';

class YapilacaklarListesi extends StatefulWidget {
  _YapilacaklarListesiDurumu createState() => _YapilacaklarListesiDurumu();
}

class _YapilacaklarListesiDurumu extends State<YapilacaklarListesi> {
  List<TodoItem> todoItems =[];
  TextEditingController textController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Yapılacaklar Listesi",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    controller: textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Yapılacak ödev veya çalışama ekle.",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      setState(() {
                        todoItems.add(TodoItem(
                          task: textController.text,
                          isDone: false,
                        ));
                        textController.clear();
                      });
                    }
                  },
                  child: Text("Ekle",style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Kutucuklar arasındaki boşluk
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      activeColor: Colors.black,
                      value: todoItems[index].isDone,
                      onChanged: (value) {
                        setState(() {
                          todoItems[index].isDone = value!;
                        });
                      },
                    ),
                    title: Text(
                      todoItems[index].task,
                      style: TextStyle(
                        decoration: todoItems[index].isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todoItems.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  String task;
  bool isDone;

  TodoItem({required this.task, this.isDone = false});
}

