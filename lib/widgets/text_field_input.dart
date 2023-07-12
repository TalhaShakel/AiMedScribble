import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final bool isSearch;
  final String hintText;
  
  final String iconPath;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
     this.isSearch = false,
    required this.hintText,
    required this.textInputType, required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(40));

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        suffixIcon:isSearch?const SizedBox() :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(iconPath),
        ),
        prefixIcon:isSearch? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(iconPath),
        ):const SizedBox(),
        hintText: hintText,
        fillColor: Colors.white,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding:  EdgeInsets.symmetric(horizontal: 20,vertical:isSearch?12 :25),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}