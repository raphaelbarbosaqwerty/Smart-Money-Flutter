import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final controller;
  final onChanged;  
  final String Function() errorText;
  final Icon prefixIcon;

  const FormFieldWidget({Key key, this.labelText, this.controller, this.onChanged, this.errorText, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlign: TextAlign.end,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Hexcolor('#34495e'),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Hexcolor('#34495e'))
        ),
        prefixIcon: prefixIcon,
        errorText: errorText == null ? null : errorText()
      ),
    );
  }
}
