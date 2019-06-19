import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:supermarket/data/blocs/supermarket/index.dart';
import 'package:supermarket/data/services/index.dart';
import 'package:supermarket/pages/common/widgets/index.dart';

class SupermarketsPage extends StatefulWidget {
  static const String routeName = "/supermarkets";

  @override
  _SupermarketsPageState createState() => _SupermarketsPageState();
}

class _SupermarketsPageState extends State<SupermarketsPage> {
  final _supermarketBloc = kiwi.Container().resolve<SupermarketBloc>();
  @override
  void initState() {
    _supermarketBloc.onSupermarketInitiated();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _supermarketBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupermarketBloc>(
      child: Scaffold(
        body: BlocBuilder(
          bloc: _supermarketBloc,
          builder: (BuildContext context, SupermarketState state) {
            if (state.isLoading) {
              return CommonCircularProgressIndicator();
            }
            if (state.isSuccessful) {
              return ListView.builder(
                itemCount: state.supermarkets.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CachedNetworkImage(
                              imageUrl:
                                  state.supermarkets[index].brand.data.imageUrl,
                            ),
                            foregroundColor: Colors.white,
                          ),
                          title: Text(
                              "${state.supermarkets[index].brand.data.name} - ${state.supermarkets[index].data.name}"),
                        ),
                      ),
                      actions: null,
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Update',
                          color: Colors.black45,
                          icon: Icons.edit,
                          onTap: () {},
                        ),
                        IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {}),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {},
        ),
      ),
      builder: (BuildContext context) => _supermarketBloc,
    );
  }
}
