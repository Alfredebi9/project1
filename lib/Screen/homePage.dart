import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Screen/TabBar.dart';
import 'package:project1/Widgets/color.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    void signUserOut() {
      FirebaseAuth.instance.signOut();
    }

    final user = FirebaseAuth.instance.currentUser!;
    var h = MediaQuery.of(context).size.height.round();
    var w = MediaQuery.of(context).size.width.round();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(
                  'asset/images/header.png',
                ),
              ),
              Container(
                width: w * 0.95,
                child: Text(
                  style: TextStyle(
                    color: MyAppColour.tabBarColor,
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'times new roman',
                  ),
                  textAlign: TextAlign.left,
                  'Welome to TopIt ${user.email!}',
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Container(
                height: h * 0.35,
                width: w * 0.75,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'asset/images/digital.jpg',
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: w * 0.065,
                    color: MyAppColour.darkColor,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Buy ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '& '),
                    TextSpan(
                      text: 'Sell',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                'Airtime and Data',
                style: TextStyle(
                  color: MyAppColour.darkColor,
                  fontSize: w * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'With Ease ',
                style: TextStyle(
                  color: MyAppColour.mainColor,
                  fontSize: w * 0.065,
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Container(
                alignment: Alignment.center,
                width: w * 0.75,
                height: h * 0.05,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      MyAppColour.mainColor,
                      MyAppColour.tabBarColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(h * 0.02),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: w * 0.05),
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
