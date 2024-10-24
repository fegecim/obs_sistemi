import 'package:flutter/material.dart';

class OgrenciDanisman extends StatelessWidget{
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
          title: Text("Danışman",style: TextStyle(color: Colors.white)),
        ),
        body:Column(
          children: [
            Container(
                width: 412,
                height: 30,
                margin: EdgeInsets.only(top:10,left: 25,right: 25),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(250),
                ),
                child:Center(
                  child: Text('DANIŞMANINIZ',style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                )
            ),
            Container(
              width: 412,
              height: 110,
              margin: EdgeInsets.only(top:10,left:15,right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child:Center(
                child: Text('Sinan Başarslan',style: TextStyle(fontSize:20,),),
              )
            ),
            Container(
                width: 412,
                height: 30,
                margin: EdgeInsets.only(top:10,left: 25,right: 25),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(250),
                ),
                child:Center(
                  child: Text('İLETİŞİM BİLGİLERİ',style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                )
            ),
            Container(
                width: 412,
                height: 30,
                margin: EdgeInsets.only(top:10,left: 25,right: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(250),
                ),
                child:Center(
                  child: Text('Mail: muhammet.basarslan@medeniyet.edu.tr',style: TextStyle(fontSize:15),),
                )
            ),
            Container(
                width: 412,
                height: 30,
                margin: EdgeInsets.only(top:10,left: 25,right: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(250),
                ),
                child:Center(
                  child: Text('Telefon: 2162803333',style: TextStyle(fontSize:15),),
                )
            ),
          ]
        ),
      ),
    );
  }
}