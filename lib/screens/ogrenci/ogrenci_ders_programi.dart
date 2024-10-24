import 'package:flutter/material.dart';

class DersProgrami extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color:Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Ders Programı",style: TextStyle(color: Colors.white)),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(

                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/dersprogrami.png',fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}