import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/repository/firebase/index.dart';

class SupermarketFormDialog extends StatefulWidget {
  final Function addSupermarket;
  final Function editSupermarket;
  final String name;
  final String documentID;
  final bool edit;
  final BuiltList<Brand> brandsBuild;
  SupermarketFormDialog(
      {Key key,
      this.addSupermarket,
      this.editSupermarket,
      this.name,
      this.documentID,
      this.edit,
      this.brandsBuild})
      : super(key: key);

  @override
  _SupermarketFormDialogState createState() => _SupermarketFormDialogState();
}

class _SupermarketFormDialogState extends State<SupermarketFormDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<Brand>> brands = List<DropdownMenuItem<Brand>>();
  Brand _currentBrand;

  @override
  void initState() {
    for (var brand in widget.brandsBuild) {
      brands.add(
          new DropdownMenuItem(value: brand, child: new Text(brand.data.name)));
    }
    _currentBrand = widget.brandsBuild[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _nameTextController = TextEditingController(
      text: widget.name.isNotEmpty == true ? widget.name : "",
    );

    return AlertDialog(
      elevation: 10,
      title: Text(widget.name.isNotEmpty == true
          ? "Edit Supermarket"
          : "New Supermarket"),
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
                ),
                SizedBox(
                  height: 10,
                ),
                new Text("Please choose your brand: "),
                new DropdownButton(
                  value: _currentBrand,
                  items: brands,
                  onChanged: changedDropDownItem,
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
            if (!widget.edit)
              widget.addSupermarket(_nameTextController.text);
            else
              widget.editSupermarket(
                  widget.documentID, _nameTextController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  void changedDropDownItem(Brand brand) {
    setState(() {
      _currentBrand = brand;
    });
  }
}
