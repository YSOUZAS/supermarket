import 'package:flutter/material.dart';
import 'package:supermarket/pages/home/index.dart';
import 'package:supermarket/utils/index.dart';

void main() {
  initiKiwi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      checkerboardRasterCacheImages: true,
      locale: Locale('pt-br', 'BR'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
