import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flickr_gallery/favourite/presentation/favourite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBarFavouriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.star),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.bloc<CatalogBloc>(),
              child: FavouritePage(),
            ),
          ),
        );
      },
    );
  }
}
