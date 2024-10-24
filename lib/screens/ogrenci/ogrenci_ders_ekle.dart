import 'package:flutter/material.dart';

class OgrenciDers extends StatefulWidget {
  _OgrenciDersDurumu createState() => _OgrenciDersDurumu();
}

class _OgrenciDersDurumu extends State<OgrenciDers> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  String? goruntulenenMetin = "";
  List<String> listeIci1 = [];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(style: TextStyle(color: Colors.white), "Ders Ekle/Çıkar"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 205,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3.0),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: TextField(
                            cursorColor: Colors.black,
                            controller: textController1,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: "Ders",
                              hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 205,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 0),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, minimumSize: Size(103, 50)),
                            onPressed: () {
                              setState(() {
                                listeIci1.add(textController1.text);
                                textController1.clear();
                              });
                            },
                            child: Text(
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
                              "Ekle",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 100,
                      width: 206,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3.0),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: TextField(
                            cursorColor: Colors.black,
                            controller: textController2,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: "Ders",
                              hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 206,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3.0),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, minimumSize: Size(103, 50)),
                            onPressed: () {
                              setState(() {
                                if (listeIci1.contains(textController2.text)) {
                                  listeIci1.remove(textController2.text);
                                }
                                else{
                                  showDialog(
                                      context: context,
                                      builder: (context)=> AlertDialog(
                                        title: Text('Hatalı Giriş'),
                                        content: Text('Böyle bir dersiniz bulunmamaktadır.'),
                                        actions: [
                                          TextButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            child: Text('Tamam',style: TextStyle(color: Colors.black),),
                                          )
                                        ],
                                      )
                                  );
                                }
                                textController2.clear(); // TextField'i temizle
                              });
                            },
                            child: Text(
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
                              "Çıkar",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              child: Container(
                width: 211,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black, width: 3.0),
                ),
                child: Center(
                  child: Text("DERSLERİNİZ", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: 411,
                height: 500,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black, width: 3.0),
                ),
                child: ListView.builder(
                  itemCount: listeIci1.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listeIci1[index], style: TextStyle(color: Colors.black)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
