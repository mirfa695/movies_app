import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.text,
        required this.con,
        this.val,
        required this.choice,
        this.color1,
        required this.no,
        Key? key})
      : super(key: key);
  final String text;
  final TextEditingController con;
  double no;
  bool choice;
  Color? color1;
  String? Function(String?)? val;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: no, left: no),
      child: TextFormField(
        style: TextStyle(color: color1 ?? Colors.white),
        controller: con,
        validator: val,
        obscureText: choice,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(.2),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                borderSide: BorderSide(color: Colors.grey)),
            labelText: text,
            labelStyle: TextStyle(color: Colors.black.withOpacity(.3))),
      ),
    );
  }
}
