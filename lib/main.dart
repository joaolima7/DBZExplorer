import 'package:dbz_app/dbz_app.dart';
import 'package:dbz_app/layers/core/inject/inject.dart';
import 'package:flutter/widgets.dart';

void main() {
  Inject.init();
  runApp(
    const DbzApp(),
  );
}
