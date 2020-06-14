import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBarGridButton extends StatelessWidget {
  final _iconsMap = {
    1: Icons.widgets,
    2: Icons.view_comfy,
    4: Icons.view_agenda,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(_iconsMap[state.crossAxisCount]),
          onPressed: () {
            context.bloc<CatalogBloc>().add(NextCrossAxisCountCatalog());
          },
        );
      },
    );
  }
}
