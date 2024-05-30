import 'package:flutter/material.dart';

class TextFielCustom extends StatefulWidget {
  const TextFielCustom({super.key});

  @override
  State<TextFielCustom> createState() => _TextFielCustomState();
}

class _TextFielCustomState extends State<TextFielCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
