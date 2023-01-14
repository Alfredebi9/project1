// import 'package:flutter/material.dart';
// import 'package:project1/Widgets/SigninWidget.dart';
// import 'package:project1/Widgets/color.dart';
// import '../Widgets/SignupWidget.dart';

// class AuthSignUpScreen extends StatelessWidget {
//   const AuthSignUpScreen({
//     super.key,
//     // required void Function() onClickedAuthSignUpScreen,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width.round();
//     var h = MediaQuery.of(context).size.height.round();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: h * 1,
//               width: w * 1,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color.fromARGB(244, 150, 150, 110),
//                     Color.fromARGB(255, 237, 238, 219),
//                   ],
//                 ),
//               ),
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Opacity(
//                         opacity: 0.1,
//                         child: Image(
//                           image: AssetImage(
//                             'asset/images/Lady.jpg',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: h * 0.05),
//                     child: TabBar(
//                       isScrollable: false,
//                       indicator: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 223, 161, 99),
//                             MyAppColour.darkColor,
//                           ],
//                         ),
//                       ),
//                       labelStyle: const TextStyle(
//                           color: MyAppColour.mainColor,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'LibreBaskerville'),
//                       tabs: [
//                         //Tab 1
//                         SizedBox(
//                           width: w * 0.35,
//                           child: Tab(
//                             child: Text('Sign Up'),
//                           ),
//                         ),

//                         //Tab 2
//                         SizedBox(
//                           width: w * 0.35,
//                           child: Tab(
//                             child: Text(
//                               'Sign In',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: TabBarView(
//                       children: [
//                         //Tab 1
//                         SignupWidget(
//                             // onClickedAuthSignInScreen: () {},
//                             ),
//                         //Tab 2
//                         SignInWidget(
//                           onClickedAuthSignUpScreen: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
