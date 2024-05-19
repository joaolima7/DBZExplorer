import 'package:flutter/material.dart';

class TextCustom extends StatefulWidget {
  TextCustom({super.key, required this.txt, required this.color});
  String txt;
  Color color;

  @override
  State<TextCustom> createState() => _TextCustomState();
}

class _TextCustomState extends State<TextCustom> {
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Text(
      widget.txt,
      style: TextStyle(
          fontSize: sizeScreen.width * .1,
          color: widget.color,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
    );
  }
}
