import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:supermarket/data/blocs/brand/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/pages/brand/widgets/index.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:supermarket/pages/common/widgets/index.dart';

class BrandsPage extends StatefulWidget {
  static const String routeName = "/brands";

  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final _brandBloc = kiwi.Container().resolve<BrandBloc>();

  @override
  void initState() {
    _brandBloc.onBrandInitiated();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _brandBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrandBloc>(
      child: Scaffold(
        body: BlocBuilder(
          bloc: _brandBloc,
          builder: (BuildContext context, BrandState state) {
            if (state.isLoading) {
              return CommonCircularProgressIndicator();
            } else if (state.isSuccessful) {
              return ListView.builder(
                itemCount: state.brands.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: CommonCircleAvatar(
                            url: state.brands[index].data.imageUrl,
                          ),
                          title: Text(state.brands[index].data.name),
                        ),
                      ),
                      actions: null,
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Update',
                          color: Colors.black45,
                          icon: Icons.edit,
                          onTap: () => buildShowDialog(
                              context, state.brands[index], true),
                        ),
                        IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () => _brandBloc
                                .onDeleteBrand(state.brands[index].documentID)),
                      ],
                    ),
                  );
                },
              );
            } else {
              return CenteredMessage(
                icon: FontAwesomeIcons.timesCircle,
                message: "There are no brands registered!",
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            return buildShowDialog(context, null, false);
          },
        ),
      ),
      builder: (BuildContext context) => _brandBloc,
    );
  }

  Future buildShowDialog(BuildContext context, Brand brand, bool edit) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return BrandAddDialog(
            edit: edit,
            addBrand: _brandBloc.onInsertBrand,
            editBrand: _brandBloc.onEditBrand,
            name: brand != null ? brand.data.name : "",
            documentID: brand != null ? brand.documentID : "",
          );
        });
  }
}
