import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:supermarket/pages/common/widgets/index.dart';

class CommonCircleAvatar extends StatelessWidget {
  final String url;

  const CommonCircleAvatar({Key key, @required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: CachedNetworkImage(
        placeholder: (context, url) => new CommonCircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
        imageUrl: url,
      ),
      foregroundColor: Colors.white,
    );
  }
}
