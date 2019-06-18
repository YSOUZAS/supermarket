import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:supermarket/data/blocs/brand/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/pages/brand/widgets/index.dart';

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
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.isSuccessful) {
              return ListView.builder(
                itemCount: state.brands.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child:
                          ListTile(title: Text(state.brands[index].data.name)));
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            return showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return BrandAddDialog(
                    addBrand: _brandBloc.onInsertBrand,
                  );
                });
          },
        ),
      ),
      builder: (BuildContext context) => _brandBloc,
    );
  }
}
