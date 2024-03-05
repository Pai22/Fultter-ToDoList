import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screen/introduction_screen.dart';

bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //ให้เชื่อมต่อกับgoogle clund firebase

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ??
      true; //ถ้าไม่ใช่หน้าสุดท้ายให้รันไปเรื่อยๆ
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false, //ไม่มีMode
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      //home: IntroScreen(),
      home: show
          ? IntroScreen()
          : const HomeScreen(), //คำสังifในรูปย่อ ถ้าshowเป็นจริงจะไปหน้าintro ถ้าไม่ใช่จะไปหน้าhomescreen
    );
  }
}
