import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogRefreshWrapper extends StatelessWidget {
  final Widget child;

  CatalogRefreshWrapper({
    @required this.child,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.bloc<CatalogBloc>().add(RefreshCatalog());
        return Future.delayed(Duration(microseconds: 300));
      },
      child: child,
    );
  }
}
