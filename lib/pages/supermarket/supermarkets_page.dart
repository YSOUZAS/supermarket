import 'package:flutter/material.dart';

class SupermarketsPage extends StatelessWidget {
  static const String routeName = "/supermarkets";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Supermarkets"),
      ),
      body: new SupermarketsScreen(supermarketsBloc: _supermarketsBloc),
    );
  }
}
