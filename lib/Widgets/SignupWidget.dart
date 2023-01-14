import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:input_country/input_country.dart';
import 'package:project1/Widgets/Button.dart';
import 'package:project1/Widgets/TextfieldWidget.dart';
import 'package:project1/Widgets/color.dart';

class SignupWidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignupWidget({
    super.key,
    required this.onClickedSignIn,
  });

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  final ConfirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signUserUp() async {
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
    // try sign up
    try {
      if (passwordController.text == ConfirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // Show error message, password isn`t the same
        showErrorMessage('Password don`t match!');
      }
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
        children: [
          Row(
            children: [
              SizedBox(
                height: h * 0.15,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'First Name',
                      style: TextStyle(
                        color: MyAppColour.darkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.0005,
                    ),
                    SizedBox(
                      height: h * 0.07,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyAppColour.tabBarColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(h * 0.01),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: w * 0.1,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Surname',
                      style: TextStyle(
                        color: MyAppColour.darkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.0005,
                    ),
                    SizedBox(
                      height: h * 0.07,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyAppColour.tabBarColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(h * 0.01),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Phone Number',
                style: TextStyle(
                  color: MyAppColour.darkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: h * 0.0005,
              ),
              SizedBox(
                height: h * 0.07,
                child: TextFormField(
                  maxLength: 11,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyAppColour.tabBarColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(h * 0.01),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: h * 0.15,
              ),
              Flexible(
                child: TextfieldWidget(
                  textHeader: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  hidden: true,
                  control: passwordController,
                  textinputaction: TextInputAction.next,
                ),
              ),
              SizedBox(
                width: w * 0.1,
              ),
              Flexible(
                child: TextfieldWidget(
                  control: ConfirmPasswordController,
                  textinputaction: TextInputAction.done,
                  textHeader: 'Confirm Password',
                  textInputType: TextInputType.visiblePassword,
                  hidden: true,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.01),
              color: MyAppColour.tabBarColor,
            ),
            child: InputCountry(
              showFlagOnItems: true,
              icon: Container(
                margin: const EdgeInsets.only(),
                child: const Icon(
                  Icons.arrow_drop_down,
                ),
              ),
              iconSize: h * 0.04,
              hint: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: w * 0.06,
                      right: w * 0.02,
                    ),
                    color: Colors.black,
                    height: h * 0.001,
                    width: w * 0.2,
                  ),
                  const Text(
                    'Choose Country',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: MyAppColour.darkColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: w * 0.02,
                      right: w * 0.05,
                    ),
                    color: Colors.black,
                    height: h * 0.001,
                    width: w * 0.15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h * 0.06,
          ),
          MyButton(
            text: 'Get Started',
            onTap: signUserUp,
          ),
          SizedBox(
            height: h * 0.01,
          ),
          RichText(
            text: TextSpan(
                text: 'Already have an Account?   ',
                style: TextStyle(
                  fontSize: h * 0.015,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                    text: 'Sign In',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: h * 0.017,
                      fontWeight: FontWeight.w700,
                      color: MyAppColour.darkColor,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
