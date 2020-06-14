import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state.tag != null && state.tag.isNotEmpty) {
          return Text(state.tag);
        }
        return SizedBox.shrink();
      },
    );
  }
}
