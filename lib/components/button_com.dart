// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent(this.function, {this.buttonName, this.buttonWidth});
  //Widget nextPage;
  @required
  Function() function;
  String? buttonName;
  double? buttonWidth = double.infinity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0XFF2E266D),
        ),
        width: buttonWidth,
        height: 40,
        child: Center(
          child: Text(
            buttonName!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
