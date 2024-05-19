import 'package:dbz_app/layers/presentation/ui/pages/scaffold_page.dart';
import 'package:flutter/material.dart';

class DbzApp extends StatelessWidget {
  const DbzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Colors.transparent),
      home: ScaffoldPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
