import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:input_country/input_country.dart';
import 'package:project1/Screen/log_Out.dart';
import 'package:project1/Widgets/TextfieldWidget.dart';
import 'package:project1/Widgets/color.dart';
import '../utils.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.1, horizontal: w * 0.08),
      child: Form(
        key: formKey,
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
                      Text(
                        'First Name',
                        style: const TextStyle(
                          color: MyAppColour.darkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.0005,
                      ),
                      Container(
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
                      Text(
                        'Surname',
                        style: const TextStyle(
                          color: MyAppColour.darkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.0005,
                      ),
                      Container(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number',
                  style: const TextStyle(
                    color: MyAppColour.darkColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: h * 0.0005,
                ),
                Container(
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
                    validateMode: AutovalidateMode.onUserInteraction,
                    Validator: (value) => value != null && value.length < 6
                        ? 'Enter 6 characters'
                        : null,
                    textHeader: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    hidden: false,
                    control: passwordController,
                    textinputaction: TextInputAction.done,
                  ),
                ),
                SizedBox(
                  width: w * 0.1,
                ),
                Flexible(
                  child: TextfieldWidget(
                    validateMode: AutovalidateMode.onUserInteraction,
                    Validator: (value) => value != null && value.length < 6
                        ? 'Enter 6 characters'
                        : null,
                    control: passwordController,
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
                  margin: EdgeInsets.only(),
                  child: Icon(
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
                    Text(
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
                  'Get Started',
                  style: TextStyle(
                    fontSize: h * 0.02,
                  ),
                ),
              ),
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
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
