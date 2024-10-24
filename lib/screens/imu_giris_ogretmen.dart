import 'package:flutter/material.dart';


class OgretmenBilgiEkrani extends StatefulWidget{
  String kullaniciAdi;
  OgretmenBilgiEkrani({required this.kullaniciAdi});
  @override
  _OgretmenBilgiEkraniDurumu createState() => _OgretmenBilgiEkraniDurumu();
}
class _OgretmenBilgiEkraniDurumu extends State<OgretmenBilgiEkrani>{
  TextEditingController vizeKontrolu = TextEditingController();
  TextEditingController finalKontrolu = TextEditingController();

  double? ortalama;

  void ortalamaHesapla(){
    double vizeNotu = double.tryParse(vizeKontrolu.text) ?? 0; // Vize notu
    double finalNotu = double.tryParse(finalKontrolu.text) ?? 0; // Final notu
    if(vizeNotu>=0 && vizeNotu<=100 && finalNotu>=0 && finalNotu<=100) {
      setState(() {
        ortalama = (vizeNotu * 0.4) + (finalNotu * 0.6);
      });
    }
    else if((vizeNotu>=100||vizeNotu<=0) && (finalNotu<=100 && finalNotu>=0)) {
      showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            title: Text('Hatalı Giriş'),
            content: Text('Vize notu 0-100 aralığında olmalıdır.'),
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
    else if((finalNotu>=100||finalNotu<=0) && (vizeNotu<=100 && vizeNotu>=0)){
      showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            title: Text('Hatalı Giriş'),
            content: Text('Final notu 0-100 aralığında olmalıdır.'),
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
    else if((vizeNotu>=100 || vizeNotu<=0) && (finalNotu>=100 || finalNotu<=0)){
      showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            title: Text('Hatalı Giriş'),
            content: Text('Vize-Final notu 0-100 aralığında olmalıdır.'),
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
          title: Text("Öğretmen Bilgi Sistemi",style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color:Colors.white,), // Geri tuşu simgesi
            onPressed: () {
              Navigator.pop(context); // Geri tıklandığında bir önceki sayfaya döner
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(style: TextStyle(color: Colors.white,fontSize: 20,fontStyle:FontStyle.normal ),"Hoşgeldiniz!",)
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(style: TextStyle(color: Colors.white,fontSize: 16, fontStyle: FontStyle.italic),"Öğretmen bilgi sistemine başarıyla giriş yaptınız.",)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.black,
                controller: vizeKontrolu,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: ("Vize Notunu Giriniz."),
                  labelStyle: TextStyle(
                    color: Colors.black,
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
                controller: finalKontrolu,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: ("Final Notunu Giriniz."),
                  labelStyle: TextStyle(
                    color: Colors.black,
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
                  onPressed:(){
                    ortalamaHesapla();
                  },
                  child: Text(style: TextStyle(color: Colors.black),"Hesapla"),
                )
            ),
            if (ortalama != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  //color: Colors.black,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child:Center(
                    child: Text(
                    "Öğrencinin ortalaması: ${ortalama!.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}