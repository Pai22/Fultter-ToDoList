import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
// import 'package:onboarding_screen/screens/login_succes_screen.dart';
import 'package:onboarding_screen/screen/todolist_screen.dart';
//ไฟล์ที่เช็คว่าคูณloginมารึยัง ถ้าloginแล้วให้กระโดดไปที่todolist
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return const ToDoListScreen();
            } else {
              return const HomeScreen();
            }
          }
        },
      ),
    );
  }
}
