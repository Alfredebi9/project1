import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Widgets/color.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future verifyEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
              'Password reset link sent! Check your email',
            ),
          );
        },
      );
    } on FirebaseException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              e.message.toString(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.2, horizontal: w * 0.1),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Recieve an email to\nreset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: h * 0.03,
                    color: MyAppColour.mainColor,
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                SizedBox(
                  width: w * 0.8,
                  height: h * 0.05,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.email_outlined),
                    label: const Text(
                      'Reset Password',
                    ),
                    onPressed: verifyEmail,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyAppColour.darkColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
