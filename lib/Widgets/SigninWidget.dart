import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project1/Screen/log_Out.dart';
import 'package:project1/Widgets/TextfieldWidget.dart';
import 'package:project1/Widgets/color.dart';
import 'package:project1/utils.dart';

import '../forgetPassword.dart';

class SignInWidget extends StatefulWidget {
  final Function() onClickedSignUp;
  const SignInWidget({
    super.key,
    required this.onClickedSignUp,
  });

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.1, horizontal: w * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextfieldWidget(
            validateMode: AutovalidateMode.onUserInteraction,
            Validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a Valid Email'
                    : null,
            textHeader: 'Email Address',
            textInputType: TextInputType.emailAddress,
            hidden: false,
            control: emailController,
            textinputaction: TextInputAction.next,
          ),
          SizedBox(
            height: h * 0.05,
          ),
          TextfieldWidget(
            validateMode: AutovalidateMode.onUserInteraction,
            Validator: (value) =>
                value != null && value.length < 6 ? 'Enter 6 characters' : null,
            textHeader: 'Password',
            textInputType: TextInputType.visiblePassword,
            hidden: true,
            control: passwordController,
            textinputaction: TextInputAction.done,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ForgetPasswordWidget(),
            )),
            child: Container(
              width: w * 0.9,
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: h * 0.015,
                    fontWeight: FontWeight.w700,
                    color: MyAppColour.darkColor),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.07,
          ),
          Container(
            width: w * 0.9,
            height: h * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.01),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: MyAppColour.darkColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const Log_OuT()),
                  ),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: h * 0.02,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: h * 0.01),
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                  text: 'Don`t have an Account?   ',
                  style: TextStyle(
                    fontSize: h * 0.015,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Register',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: h * 0.017,
                        fontWeight: FontWeight.w700,
                        color: MyAppColour.darkColor,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    //Navigator.of(context) not working!
    var navigatorkey;
    navigatorkey.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }
}
