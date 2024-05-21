import 'package:flutter/material.dart';

class TextCustom extends StatefulWidget {
  TextCustom({
    super.key,
    required this.txt,
    required this.color,
    required this.sizeWidth,
  });

  String txt;
  double sizeWidth;
  Color color;

  @override
  State<TextCustom> createState() => _TextCustomState();
}

class _TextCustomState extends State<TextCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.txt,
      style: TextStyle(
          fontSize: widget.sizeWidth * .1,
          color: widget.color,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
    );
  }
}
