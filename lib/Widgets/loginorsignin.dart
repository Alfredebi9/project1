import 'package:flutter/material.dart';
import 'package:project1/Screen/TabBar.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const TabBarWidget(index: 0);
    } else {
      return const TabBarWidget(index: 0);
    }
  }
}
