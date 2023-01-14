import 'package:flutter/material.dart';
import 'package:project1/Widgets/color.dart';

class TextfieldWidget extends StatelessWidget {
  final AutovalidateMode validateMode;
  final String? Function(String?) Validator;
  final String textHeader;
  final TextInputType textInputType;
  final bool hidden;
  final TextEditingController control;
  final TextInputAction textinputaction;
  const TextfieldWidget({
    super.key,
    required this.textHeader,
    required this.textInputType,
    required this.hidden,
    required this.control,
    required this.textinputaction,
    required this.Validator,
    required this.validateMode,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHeader,
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
            autovalidateMode: validateMode,
            validator: Validator,
            controller: control,
            textInputAction: textinputaction,
            decoration: InputDecoration(
              filled: true,
              fillColor: MyAppColour.tabBarColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(h * 0.01),
                borderSide: BorderSide.none,
              ),
            ),
            cursorColor: Colors.black,
            keyboardType: textInputType,
            obscureText: hidden,
            obscuringCharacter: '*',
          ),
        ),
      ],
    );
  }
}
