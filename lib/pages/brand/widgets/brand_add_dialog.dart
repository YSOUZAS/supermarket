import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BrandAddDialog extends StatelessWidget {
  final _nameTextController = TextEditingController();
  final Function addBrand;

  BrandAddDialog({Key key, this.addBrand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      title: Text("New Brand"),
      content: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameTextController,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Name',
                      icon: Icon(FontAwesomeIcons.scroll)),
                  validator: (String value) {
                    if (value.isEmpty) return "input a name";
                  },
                )
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Save"),
          onPressed: () {
            addBrand(_nameTextController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
