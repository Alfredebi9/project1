// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:project1/Screen/AuthSignUp.dart';
// import 'package:project1/Widgets/color.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       Duration(milliseconds: 1500),
//       () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => AuthSignUpScreen()),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height.round();
//     var w = MediaQuery.of(context).size.width.round();
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: h * 0.35,
//               width: w * 0.75,
//               child: FittedBox(
//                 fit: BoxFit.fill,
//                 child: Image.asset(
//                   'asset/images/digital.jpg',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: h * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 style: TextStyle(
//                   fontSize: w * 0.065,
//                   color: MyAppColour.darkColor,
//                 ),
//                 children: const [
//                   TextSpan(
//                     text: 'Buy ',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(text: '& '),
//                   TextSpan(
//                     text: 'Sell',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             Text(
//               'Airtime and Data',
//               style: TextStyle(
//                 color: MyAppColour.darkColor,
//                 fontSize: w * 0.08,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'With Ease ',
//               style: TextStyle(
//                 color: MyAppColour.mainColor,
//                 fontSize: w * 0.065,
//               ),
//             ),
//             SizedBox(
//               height: h * 0.05,
//             ),
//             Container(
//               alignment: Alignment.center,
//               width: w * 0.75,
//               height: h * 0.05,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     MyAppColour.mainColor,
//                     MyAppColour.tabBarColor,
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(h * 0.02),
//               ),
//               child: Text(
//                 'Get Started',
//                 style: TextStyle(fontSize: w * 0.05),
//               ),
//             ),
//             SizedBox(
//               height: h * 0.01,
//             ),
//             CircularProgressIndicator(
//               color: MyAppColour.mainColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
