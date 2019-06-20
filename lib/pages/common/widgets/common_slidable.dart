import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:supermarket/pages/common/widgets/common_circle_avatar.dart';

class CommonSlidable extends StatelessWidget {
  final String text;
  final String imageUrl;
  final List<Widget> actions;
  final List<Widget> secondaryActions;
  const CommonSlidable(
      {Key key,
      @required this.text,
      @required this.imageUrl,
      @required this.actions,
      @required this.secondaryActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: CommonCircleAvatar(
              url: imageUrl,
            ),
            title: Text(text),
          ),
        ),
        actions: actions,
        secondaryActions: secondaryActions);
  }
}
