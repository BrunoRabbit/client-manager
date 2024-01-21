import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.controller,
    this.hintText,
    this.validator,
    this.icon,
    this.onChanged,
    this.inputFormatters,
    super.key,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Icon? icon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: const Color(0xff0A1D4D),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0A1D4D),
          ),
        ),
      ),
    );
  }
}
