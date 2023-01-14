import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project1/Widgets/Button.dart';
import 'package:project1/Widgets/TextfieldWidget.dart';
import 'package:project1/Widgets/color.dart';
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

  void signUserIn() async {
    // Show loading Circle
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: MyAppColour.mainColor,
        ),
      ),
    );
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // stop the loading indicator
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // stop the loading indicator
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // Error message
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyAppColour.mainColor,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.1, horizontal: w * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextfieldWidget(
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
            textHeader: 'Password',
            textInputType: TextInputType.visiblePassword,
            hidden: true,
            control: passwordController,
            textinputaction: TextInputAction.done,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ForgetPasswordWidget(),
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
            child: MyButton(
              text: 'Login',
              onTap: signUserIn,
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
}
