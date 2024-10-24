import 'package:flutter/material.dart';
import 'package:obs_sistemi/screens/ogrenci/ogrenci_danisman.dart';
import 'package:obs_sistemi/screens/ogrenci/ogrenci_ders_programi.dart';
import 'package:obs_sistemi/screens/ogrenci/ogrenci_ders_ekle.dart';
import 'package:obs_sistemi/screens/ogrenci/toDo/ogrenci_yapilacaklar_listesi.dart';


class OgrenciBilgiEkrani extends StatefulWidget {
  String kullaniciAdi;
  OgrenciBilgiEkrani({required this.kullaniciAdi});
  _OgrenciEkranDurumu createState() => _OgrenciEkranDurumu();
}

class _OgrenciEkranDurumu extends State<OgrenciBilgiEkrani>{

  void _dersProgrami(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
              DersProgrami()
        )
    );
  }
  void _ogrenciDanisman(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OgrenciDanisman()
        )
    );
  }
  void _ogrenciDers(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                OgrenciDers()
        )
    );
  }
  void _yapilacaklar(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                YapilacaklarListesi()
        )
    );
  }
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(style: TextStyle(color: Colors.white),"Öğrenci Bilgi Sistemi"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color:Colors.white,), // Geri tuşu simgesi
            onPressed: () {
              Navigator.pop(context); // Geri tıklandığında bir önceki sayfaya döner
            },
          ),
        ),
        body: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:Center(
                  child: Text(style: TextStyle(color: Colors.white,fontSize: 20,fontStyle:FontStyle.normal ),"Hoşgeldiniz!",)
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(style: TextStyle(color: Colors.white,fontSize: 16, fontStyle: FontStyle.italic),"Öğrenci bilgi sistemine başarıyla giriş yaptınız.",)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed:(){
                  _dersProgrami();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text(style: TextStyle(color: Colors.black,fontSize: 16.0),"Ders Programını Gör"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed:(){
                  _ogrenciDanisman();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text(style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),"Danışmanını Gör"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed:(){
                  _ogrenciDers();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text(style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),"Ders Ekle-Çıkar"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed:(){
                  _yapilacaklar();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text(style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),"Yapılacaklar Listesi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}