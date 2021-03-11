import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {

  final String text;
  final Function onPress;

  CustomButtonText({this.onPress, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFeb1555),
      child: TextButton(
        onPressed: onPress,
        child: AutoSizeText(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
          minFontSize: 1,
          maxLines: 1,
        ),
      ),
    );
  }
}