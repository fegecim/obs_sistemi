import 'package:flutter/material.dart';
import 'ogrenci/imu_giris_ogrenci.dart';
import 'imu_giris_ogretmen.dart';
import 'imu_giris_sekreter.dart';

class AnaEkran extends StatefulWidget {
  _AnaEkranDurumu createState() => _AnaEkranDurumu();
}

class _AnaEkranDurumu extends State<AnaEkran>{
  final TextEditingController _kullaniciAdiKontrol = TextEditingController();
  final TextEditingController _sifreKontrol= TextEditingController();
  void _giris(){
    if(_kullaniciAdiKontrol.text== 'ogrenci' && _sifreKontrol.text== '123') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                OgrenciBilgiEkrani(kullaniciAdi: _kullaniciAdiKontrol.text)
          )
      );
    }
    else if(_kullaniciAdiKontrol.text== 'hoca' && _sifreKontrol.text== '123') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OgretmenBilgiEkrani(kullaniciAdi: _kullaniciAdiKontrol.text)
          )
      );
    }
    else if(_kullaniciAdiKontrol.text== 'sekreter' && _sifreKontrol.text== '123') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SekreterBilgiEkrani(kullaniciAdi: _kullaniciAdiKontrol.text)
          )
      );
    }
    else{
      //Yanlış Giriş
      showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text('Hatalı Giriş'),
          content: Text('Kullanıcı adı veya şifre hatalı.'),
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
  }
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("İMU OBS",style: TextStyle(color: Colors.white)),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.black,
                controller: _kullaniciAdiKontrol,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: ('Kullanıcı Adı'),
                  labelStyle: TextStyle(
                    color:Colors.black,
                    fontSize: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.black,
                controller: _sifreKontrol,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: ('Şifre'),
                  labelStyle: TextStyle(
                    color:Colors.black,
                    fontSize: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _giris,
                  child: Text(style: TextStyle(color: Colors.black),"Giriş Yap"),
                )
            )
          ],
        ),
      ),
    );
  }
}