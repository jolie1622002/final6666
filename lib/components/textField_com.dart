import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatelessWidget {
  TextFieldComponent(
      {required this.controlleR,
      required this.validate,
      this.isPassward = false,
      this.labelText,
      this.inputType,
      this.preIcon,
      this.sufIcon,
      this.sufIconPressed});
  TextEditingController? controlleR;
  @required
  String? Function(String?) validate;
  String? labelText;
  TextInputType? inputType;
  IconData? preIcon;
  IconData? sufIcon;
  Function()? sufIconPressed;
  bool isPassward;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextFormField(
        controller: controlleR,
        validator: validate,
        keyboardType: inputType,
        obscureText: isPassward,
        onFieldSubmitted: (String value) {
          print(value);
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(preIcon),
          suffix: IconButton(
            onPressed: sufIconPressed,
            icon: Icon(sufIcon),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
