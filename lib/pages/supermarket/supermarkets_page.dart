import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:supermarket/data/blocs/supermarket/index.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/services/index.dart';
import 'package:supermarket/pages/common/widgets/common_slidable.dart';
import 'package:supermarket/pages/common/widgets/index.dart';
import 'package:supermarket/pages/supermarket/widgets/index.dart';

class SupermarketsPage extends StatefulWidget {
  static const String routeName = "/supermarkets";

  @override
  _SupermarketsPageState createState() => _SupermarketsPageState();
}

class _SupermarketsPageState extends State<SupermarketsPage> {
  final _supermarketBloc = kiwi.Container().resolve<SupermarketBloc>();
  BuiltList<Brand> brands = BuiltList<Brand>();
  @override
  void initState() {
    _supermarketBloc.onSupermarketInitiated();
    super.initState();
  }

  @override
  void dispose() {
    _supermarketBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupermarketBloc>(
      child: Scaffold(
        body: BlocBuilder(
          bloc: _supermarketBloc,
          builder: (BuildContext context, SupermarketState state) {
            brands = state.brands;
            if (state.isLoading) {
              return CommonCircularProgressIndicator();
            } else if (state.isSuccessful) {
              if (state.supermarkets.isNotEmpty)
                return ListView.builder(
                  itemCount: state.supermarkets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: CommonSlidable(
                        imageUrl: state.supermarkets[index].brand.data.imageUrl,
                        text:
                            "${state.supermarkets[index].brand.data.name} - ${state.supermarkets[index].data.name}",
                        secondaryActions: <Widget>[
                          _getUpdateCommonIconSlideAction(
                              documentID: state.supermarkets[index].documentID,
                              name: state.supermarkets[index].data.name,
                              brand: state.supermarkets[index].brand),
                          _getDeleteCommonIconSlideAction(
                              state.supermarkets[index].documentID),
                        ],
                        actions: null,
                      ),
                    );
                  },
                );
            } else {
              return CenteredMessage(
                icon: FontAwesomeIcons.timesCircle,
                message: "There are no supermarkets registered!",
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            callDialog(defaultBrand: null, documentID: "", name: "");
          },
        ),
      ),
      builder: (BuildContext context) => _supermarketBloc,
    );
  }

  CommonIconSlidAction _getUpdateCommonIconSlideAction(
      {@required String documentID,
      @required String name,
      @required Brand brand}) {
    return CommonIconSlidAction(
      text: 'Update',
      color: Colors.black45,
      icon: Icons.edit,
      onTap: () =>
          callDialog(documentID: documentID, name: name, defaultBrand: brand),
    );
  }

  CommonIconSlidAction _getDeleteCommonIconSlideAction(String documentID) {
    return CommonIconSlidAction(
      text: 'Delete',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => _supermarketBloc.onDeleteSupermarket(documentID),
    );
  }

  Future callDialog(
      {String documentID, String name, Brand defaultBrand}) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SupermarketFormDialog(
            addSupermarket: _supermarketBloc.onInsertSupermarket,
            documentID: documentID,
            name: name,
            editSupermarket: _supermarketBloc.onEditSupermarket,
            brandsBuild: brands,
            defaultBrand: defaultBrand,
          );
        });
  }
}
