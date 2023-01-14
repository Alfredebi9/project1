import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Screen/homePage.dart';
import 'package:project1/Widgets/color.dart';
import 'package:project1/Widgets/loginorsignin.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyAppColour.mainColor,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          } else if (snapshot.hasData) {
            return const Home_Page();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
