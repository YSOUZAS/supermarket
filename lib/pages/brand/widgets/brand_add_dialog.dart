import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/pages/brand/widgets/index.dart';

class BrandAddDialog extends StatefulWidget {
  final Function addBrand;
  final Function editBrand;
  final String name;
  final String documentID;
  final bool edit;

  BrandAddDialog(
      {Key key,
      this.addBrand,
      this.editBrand,
      this.name,
      this.documentID,
      this.edit})
      : super(key: key);

  @override
  _BrandAddDialogState createState() => _BrandAddDialogState();
}

class _BrandAddDialogState extends State<BrandAddDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();

  @override
  void initState() {
    _nameTextController.text =
        widget.name.isNotEmpty == true ? widget.name : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      title: Text(widget.name.isNotEmpty == true ? "Edit Brand" : "New Brand"),
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
                    if (value == widget.name) return "input a different name";
                  },
                )
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButtonDialog(
          text: "Save",
          functions: () {
            if (!_formKey.currentState.validate()) {
              return;
            }
            saveAction();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  saveAction() {
    if (!widget.edit)
      widget.addBrand(_nameTextController.text);
    else
      widget.editBrand(widget.documentID, _nameTextController.text);
  }
}
