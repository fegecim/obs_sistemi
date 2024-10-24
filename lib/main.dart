import 'package:flutter/material.dart';
import 'screens/imu_giris.dart';

//Giriş ekranına atmak için başlangıç noktası.
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMU OBS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaEkran(),
    );
  }
}

