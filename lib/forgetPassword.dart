import 'package:auth/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/Widgets/color.dart';
import 'package:project1/main.dart';
import 'package:project1/utils.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Reset Password'),
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
                  decoration: InputDecoration(labelText: 'Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a Valid Email'
                          : null,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Container(
                  width: w * 0.8,
                  height: h * 0.05,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.email_outlined),
                    label: Text(
                      'Reset Password',
                    ),
                    onPressed: () {},
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

  Future verifyEmail() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: MyAppColour.mainColor,
        ),
      ),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Password Reset Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
