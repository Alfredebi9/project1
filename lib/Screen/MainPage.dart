import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Screen/TabBar.dart';
import 'package:project1/Screen/log_Out.dart';
import 'package:project1/Widgets/color.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyAppColour.mainColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) {
          return Log_OuT();
        } else {
          return TabBarWidget(
            index: 1,
          );
        }
      },
    );
  }
}
