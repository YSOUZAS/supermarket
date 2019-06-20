import 'package:flutter/material.dart';

class FlatButtonDialog extends StatelessWidget {
  final String text;
  final Function functions;
  const FlatButtonDialog({Key key, this.text, this.functions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      onPressed: () {
        functions();
      },
    );
  }
}
