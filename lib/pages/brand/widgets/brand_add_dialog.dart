import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BrandAddDialog extends StatelessWidget {
  final Function addBrand;
  final Function editBrand;
  final String name;
  final String documentID;
  final bool edit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  BrandAddDialog(
      {Key key,
      this.addBrand,
      this.editBrand,
      this.name,
      this.documentID,
      this.edit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _nameTextController = TextEditingController(
      text: name.isNotEmpty == true ? name : "",
    );

    return AlertDialog(
      elevation: 10,
      title: Text(name.isNotEmpty == true ? "Edit Brand" : "New Brand"),
      content: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
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
                    if (value == name) return "input a different name";
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
            if (!_formKey.currentState.validate()) {
              return;
            }
            if (!edit)
              addBrand(_nameTextController.text);
            else
              editBrand(documentID, _nameTextController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
