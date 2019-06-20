import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/data/models/brand/index.dart';

class SupermarketFormDialog extends StatefulWidget {
  final Function addSupermarket;
  final Function editSupermarket;
  final String name;
  final String documentID;

  final BuiltList<Brand> brandsBuild;
  final Brand defaultBrand;

  SupermarketFormDialog(
      {Key key,
      this.addSupermarket,
      this.editSupermarket,
      this.name,
      this.documentID,
      this.brandsBuild,
      this.defaultBrand})
      : super(key: key);

  @override
  _SupermarketFormDialogState createState() => _SupermarketFormDialogState();
}

class _SupermarketFormDialogState extends State<SupermarketFormDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<Brand>> brands = List<DropdownMenuItem<Brand>>();
  Brand _currentBrand;
  bool showErrorBrand = false;

  final _nameTextController = TextEditingController();

  @override
  void initState() {
    for (var brand in widget.brandsBuild) {
      brands.add(
          new DropdownMenuItem(value: brand, child: new Text(brand.data.name)));
    }
    if (widget.defaultBrand != null)
      _currentBrand = widget.defaultBrand;
    else
      _currentBrand = widget.brandsBuild[0];
    _nameTextController.text =
        widget.name.isNotEmpty == true ? widget.name : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                ),
                showErrorBrand
                    ? Text(
                        "choose a different brand",
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Save"),
          onPressed: () {
            if (!_formKey.currentState.validate() &&
                _currentBrand.documentID == widget.defaultBrand.documentID) {
              setState(() {
                showErrorBrand = true;
              });
              return;
            }

            setState(() {
              showErrorBrand = false;
            });
            if (widget.defaultBrand == null)
              widget.addSupermarket(
                  _nameTextController.text, _currentBrand.documentID);
            else
              widget.editSupermarket(widget.documentID,
                  _nameTextController.text, _currentBrand.documentID);
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
