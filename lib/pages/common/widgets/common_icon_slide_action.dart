import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CommonIconSlidAction extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final IconData icon;

  const CommonIconSlidAction(
      {Key key,
      @required this.text,
      @required this.onTap,
      @required this.color,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
        caption: text, color: color, icon: icon, onTap: onTap);
  }
}
