import 'package:flutter/material.dart';

class CatalogScrollViewWrapper extends StatelessWidget {
  final Widget child;

  CatalogScrollViewWrapper({
    @required this.child,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(),
        child,
      ],
    );
  }
}
